// Import libraries
import express from 'express';
import minimist from 'minimist';
import { engine } from 'express-handlebars';
import sqlite3 from 'sqlite3';
import { open } from 'sqlite';
import bcrypt from 'bcrypt';
import date from 'date-and-time';

const session = require('express-session');

// Retrieve arguments from shell command
const args = minimist(process.argv.slice(2));

// Initialize port. Default port is 5000.
const port = args.port || 5000;

// Initialize number of salt rounds for hashing passwords
const SALT_ROUNDS = 10;

// Initialize express server
const app = express();

// Register a Handlebars view engine for rendering HTML code
app.engine('handlebars', engine());
app.set('view engine', 'handlebars');
app.set('views', './views');

// Use middleware for reading encoded URLs
app.use(express.urlencoded({extended: true}));

// Initialize Session. This will be used for logging in.
app.use(session({
  resave: false,
  saveUninitialized: false,
  secret: 'world_cup',
  cookie: {
    sameSite: true
  }
}));

// Create a promise for connecting to the SQLite database
const dbPromise = open({
  filename: 'data.db',
  driver: sqlite3.Database
});

// Create and use middleware for logging HTTP request information in a database table
app.use(async (req, res, next) => {
  const db = await dbPromise;
  const now = new Date();
  const userLog = {
        ip: req.ip,
        user: req.user,
        date: date.format(now, 'YYYY-MM-DD'),
        time: date.format(now, 'hh:mm:ss A [GMT]Z'),
        method: req.method,
        url: req.url,
        protocol: req.protocol,
        httpVersion: req.httpVersion,
        secure: req.secure,
        statusCode: res.statusCode,
        referer: req.headers.referer,
        userAgent: req.headers['user-agent']
  };
  await db.run('INSERT INTO UserLog (ip, user, date, time, method, url, protocol, httpVersion, secure, statusCode, referer, userAgent) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);',
	       userLog.ip,
	       userLog.user,
	       userLog.date,
	       userLog.time,
	       userLog.method,
	       userLog.url,
	       userLog.protocol,
	       userLog.httpVersion,
	       userLog.secure,
	       userLog.statusCode,
	       userLog.referer,
	       userLog.userAgent);
  next();
});

// HTTP GET /app/health/
// Endpoint for assessing the health of the application and viewing logs
app.get('/app/health/', async (req, res) => {
  const db = await dbPromise;
  const userLogs = await db.all('SELECT * FROM UserLog;');
  res.send(userLogs);
});

// HTTP GET /app/
// Endpoint for accessing the home page
app.get('/app/', async (req, res) => {
  const { logged_in, username } = req.session;
  if (logged_in) {
    const db = await dbPromise;
    const user_info = await db.all('SELECT email, username, team FROM User WHERE username=?;', username);
    const email = user_info[0].email;
    const team = user_info[0].team;
    const matches = await db.all('SELECT * FROM Match WHERE team1=? OR team2=?;', team, team);
    const teams = await db.all('SELECT * FROM Team ORDER BY name;');
    res.render('home', { email, username, team, matches, teams });
  }
  else {
    res.redirect('/app/login/');
  }
});

// HTTP GET /app/register/
// Endpoint for accessing the page for creating a new account
app.get('/app/register/', async (req, res) => {
  const { logged_in, username } = req.session;
  if (logged_in) {
    res.redirect('/app/');
  }
  else {
    const db = await dbPromise;
    const teams = await db.all('SELECT * FROM Team ORDER BY name;');
    res.render('register', { teams });
  }
});

// HTTP POST /app/register/
// Endpoint for creating a new account
app.post('/app/register/', async (req, res) => {
  const db = await dbPromise;
  const { email, username, password, passwordRepeat, team } = req.body;
  if (password != passwordRepeat) {
    const teams = await db.all('SELECT * FROM Team ORDER BY name;');
    res.render('register', { teams, error: "Passwords must match" });
  }
  else {
    const users = await db.all('SELECT email, username FROM User WHERE email=? OR username=?;', email, username);
    if (users.length > 0) {
      const teams = await db.all('SELECT * FROM Team ORDER BY name;');
      res.render('register', { teams, error: "Email and/or username is already in use" });
    }
    else {
      const passwordHash = await bcrypt.hash(password, SALT_ROUNDS);
      await db.run('INSERT INTO User (email, username, password, team) VALUES (?, ?, ?, ?);', email, username, passwordHash, team);
      req.session.logged_in = true;
      req.session.username = username;
      res.redirect('/app/');
    }
  }
});

// HTTP GET /app/login/
// Endpoint for accessing the login page
app.get('/app/login/', (req, res) => {
  const { logged_in, username } = req.session;
  if (logged_in) {
    res.redirect('/app/')
  }
  else {
    res.render('login');
  }
});

// HTTP POST /app/login/
// Endpoint for logging in
app.post('/app/login/', async (req, res) => {
  const db = await dbPromise;
  const { username, password } = req.body;
  const users = await db.all('SELECT email, username, password, team FROM User WHERE username=?;', username);
  if (users.length == 0) {
    res.render('login', { error: "Account does not exist" });
  }
  else {
    const password_match = await bcrypt.compare(password, users[0].password);
    if (!password_match) {
      res.render('login', { error: "Incorrect password" });
    }
    else {
      req.session.logged_in = true;
      req.session.username = username;
      res.redirect('/app/');
    }
  }
});

// HTTP POST /app/change_team/
// Endpoint for changing teams
app.post('/app/change_team/', async (req, res) => {
  const db = await dbPromise;
  await db.run('UPDATE User SET team=? WHERE username=?;', req.body.team, req.session.username);
  res.redirect('/app/');
});

// HTTP Post /app/logout/
// Endpoint for logging out
app.post('/app/logout/', (req, res) => {
  req.session.logged_in = false;
  req.session.username = undefined;
  res.redirect('/app/login/');
});

// HTTP Post /app/delete_account/ endpoint
// Endpoint for deleting account
app.post('/app/delete_account/', async (req, res) => {
  const db = await dbPromise;
  await db.run('DELETE FROM User WHERE username=?;', req.session.username);
  req.session.logged_in = false;
  req.session.username = undefined;
  res.redirect('/app/login/');
});

// Send a 404 NOT FOUND message if an invalid endpoint is specified
app.get('*', (req, res) => {
  res.status(404).send('404 NOT FOUND');
});

// Set up the server to listen on the specified port
const setup = async () => {
  const db = await dbPromise;
  await db.migrate();
  const server = app.listen(port, () => {
    console.log(`Listening on localhost:${port}`);
  });
}

setup();

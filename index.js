import express from 'express';
import minimist from 'minimist';
import { engine } from 'express-handlebars';
import sqlite3 from 'sqlite3';
import { open } from 'sqlite';

const session = require('express-session');

const args = minimist(process.argv.slice(2));

const port = args.port || 5000;

const app = express();

app.engine('handlebars', engine());
app.set('view engine', 'handlebars');
app.set('views', './views');

app.use(express.urlencoded({extended: true}));

app.use(session({
  resave: false,
  saveUninitialized: false,
  secret: 'world_cup',
  cookie: {
    sameSite: true
  }
}));

const dbPromise = open({
  filename: 'data.db',
  driver: sqlite3.Database
});

app.get('/app/', (req, res) => {
  res.render('home');
});

app.get('/app/register/', async (req, res) => {
  const db = await dbPromise;
  const teams = await db.all('SELECT * FROM Team;');
  res.render('register', { teams });
});

app.post('/app/register/', async (req, res) => {
  const db = await dbPromise;
  const { email, username, password, team } = req.body;
  await db.run('INSERT INTO User (email, username, password, team) VALUES (?, ?, ?, ?)', email, username, password, team);
  res.redirect('/app/');
});

app.get('/app/login/', async (req, res) => {
  const db = await dbPromise;
  res.render('login');
});

app.post('/app/login/', async (req, res) => {
  const db = await dbPromise;
  res.redirect('/app/');
})

app.post('/app/logout/', async (req, res) => {
  const db = await dbPromise;
  res.redirect('/app/login/');
})

app.get('*', (req, res) => {
  res.status(404).send('404 NOT FOUND');
})

const setup = async () => {
  const db = await dbPromise;
  await db.migrate();
  const server = app.listen(port, () => {
    console.log(`Listening on localhost:${port}`);
  })
}

setup();

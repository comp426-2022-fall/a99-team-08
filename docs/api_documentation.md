## Endpoints for World Cup

Welcome! Here, you will see the endpoints in our application.

### app.get('/app/', async (req, res)
If the user is already logged in, the response will render a 'home' page with the relevant user's information, such as their email, username, favorite team,
and the matches that their team is playing. Otherwise, this endpoint redirects to '/app/login/'.

### app.get('/app/register/', async (req, res)
If the user clicks the register link, they are redirected to this endpoint. If they're already logged in, it redirects to '/app/'. Otherwise, it shows a
page where the user can register a new account.

### app.post('/app/register/', async (req, res)
If the user inputs their new account information into the text boxes, then the app sends a POST request. If the password is not the same as the repeated
password, then the user will receive a "Passwords must match" error. If the username or email is already in use, the user will receive a 
"Email and/or username is already in use" error. Otherwise, the information is considered valid, and the app sets logged_in = true, and redirects to
/app/.

### app.get('/app/login/', (req, res)
If the user is already logged in, redirect to /app/. Otherwise, render the appropriate 'login' html.

### app.post('/app/login/', async (req, res)

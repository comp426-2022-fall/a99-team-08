## Endpoints for World Cup

Welcome! Here, you will see the endpoints in our application.

### HTTP GET /app/
Endpoint for accessing the home page.    
If the user is already logged in, the response will render a 'home' page with the relevant user's information, such as their email, username, favorite team,
and the matches that their team is playing. Otherwise, this endpoint redirects to '/app/login/'.

### HTTP GET /app/register/
Endpoint for accessing the create a new account page.  
If the user clicks the register link, they are redirected to this endpoint. If they're already logged in, it redirects to '/app/'. Otherwise, it shows a
page where the user can register a new account.

### HTTP POST /app/register/
Endpoint for creating a new account.  
If the user inputs their new account information into the text boxes, then the app sends a POST request with the body "{email, username, password, passwordRepeat, team}." If the password is not the same as the repeated password, then the user will receive a "Passwords must match" error. If the username or email is already in use, the user will receive a 
"Email and/or username is already in use" error. Otherwise, the information is considered valid, and the app sets the session variable logged_in = true, and redirects to /app/.

### HTTP GET /app/login/
Endpoint for accessing the login page.  
If the user is already logged in, redirect to /app/. Otherwise, render the appropriate 'login' html.

### HTTP POST /app/login/
Endpoint for logging in.  
If the user inputs their login information into the text boxes, then the app sends a POST request with the body "{ username, password }". If the username
does not exist, return the error "Account does not exist". If the password is incorrect, return the error "Incorrect password". Otherwise, set the session
variable logged_in = true and redirect the user to /app/.

### HTTP POST /app/logout/
Endpoint for deleting account.  
Sets the session variable logged_in = false and username = undefined. Redirects page to /login/.

### HTTP POST /app/delete_account/
Endpoint for deleting account.  
Deletes the user from the database. Sets the session variable logged_in = false and username = undefined. Redirects page to /login/.

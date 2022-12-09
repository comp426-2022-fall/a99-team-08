## Endpoints for World Cup

Welcome! Here, you will see the endpoints in our application.

### HTTP GET /app/
<b>Endpoint for accessing the home page.</b>  
If the user is already logged in, the response will render a 'home' page with the relevant user's information, such as their email, username, favorite team,
and the matches that their team is playing. Otherwise, this endpoint redirects to '/app/login/'.

### HTTP GET /app/register/
<b>Endpoint for accessing the create a new account page.</b>  
If the user clicks the register link, they are redirected to this endpoint. If they're already logged in, then this endpoint redirects to '/app/'. Otherwise, it displays a page where the user can register a new account.

### HTTP POST /app/register/
<b>Endpoint for creating a new account.</b>  
If the user enters his or her new account information into the text boxes, the app will send a POST request with the following body: "{email, username, password, passwordRepeat, team}." If the password is not the same as the repeated password, then the endpoint will display the following error message: "Passwords must match". If the username or email is already in use, then the endpoint will display the following error message: "Email and/or username is already in use." Otherwise, the information is considered valid, and the app will set the session variable logged_in to true and redirect to /app/.

### HTTP GET /app/login/
<b>Endpoint for accessing the login page.</b>  
If the user is already logged in, then this endpoint redirects to /app/. Otherwise, it will render the appropriate 'login' HTML code for the page.

### HTTP POST /app/login/
<b>Endpoint for logging in.</b>  
If the user enters his or her login information into the text boxes, then the app will send a POST request with the body "{ username, password }". If the username
does not exist in the database, then the endpoint will display the following error message: "Account does not exist". If the password is incorrect, then the endpoint will display the following error message: "Incorrect password". Otherwise, it will set the session variable logged_in to true and redirect the user to /app/.

### HTTP POST /app/change_team/
<b>Endpoint for changing teams.</b>  
Changes the user's favorite team in the database. Redirects to /app/.

### HTTP POST /app/logout/
<b>Endpoint for logging out of account.</b>  
Sets the session variable logged_in to false and username to undefined. Redirects to /login/.

### HTTP POST /app/delete_account/
<b>Endpoint for deleting account.</b>  
Deletes the user from the database. Sets the session variable logged_in to false and username to undefined. Redirects to /login/.

### HTTP GET /app/health/
<b>Endpoint for assessing the health of the application and viewing logs.</b>  
A status code of 200 means that the application is healthy.

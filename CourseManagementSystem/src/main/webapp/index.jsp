<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="resources/img/log.svg" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="resources/css/index.css" />
    <title>CMS</title>
</head>
<body>
    <main>
        <div class="login-container" id="login-container">
            <div class="form-container">
                <form method="post" action="checklogin" class="form form-login">
                <!-- Print message if available -->
                    <div class="form-message">
                    	<% 
                        String message = request.getParameter("message"); 
                        if ("sessionExpired".equals(message)) {
                        %>
                        <h3 style="color: red;">Your session has expired. Please log in again.</h3>
                        <% 
                        } 
                        %>
                        <p style="color: red;">
                            ${message != null ? message : ""}
                        </p>
                    </div>
                    <h2 class="form-title">Login</h2><br/>
                    <div class="form-social">
                    </div>
                    <div class="inputs">
                        <input class="form-input" type="text" name="auname" id="auname" placeholder="Email" />
                        <input class="form-input" type="password" name="apwd" id="apwd" placeholder="Password" />
                    </div>
                    
                    <br/><br/>
                    
                    <button type="submit" class="form-button">login</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <h2 class="form-title form-title-light">Course Management System</h2>
                    <p class="form-text">Learn Practice Execute!</p>
                </div>
            </div>
        </div>
    </main>
</body>
</html>

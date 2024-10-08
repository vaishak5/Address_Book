<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="./style/style.css">
</head>
<body>
    <div class="navbar">
        <div class="navbarFt">
            <img class="addressLogo" src="./assets/bodyBook.png" alt="img" width="30" height="30">
            <h2>ADDRESS BOOK</h2>
        </div>
        <div class="navbarSnd">
            <img class="signupLogo" src="./assets/contactLogo.png" alt="img" width="20" height="20">
            <a href="signupPage.cfm">SignUp</a>
            <img class="loginLogo" src="./assets/login.png" alt="img" width="20" height="20">
            <a href="loginPage.cfm">Login</a>
        </div>
    </div>
    <div class="main">
        <div class="mainSection">
            <div class="mainBodyFt">
                <img class="addressLogoImg" src="./assets/bodyBook.png" alt="img" width="75" height="75">
            </div>
            <div class="mainBodySnd">
                <h1>LOGIN</h1>
                <div class="mainBodySndCont">
                    <form class="inputConts">
                        <input type="text" class="inputs" placeholder="USERNAME">
                        <input type="password" class="inputs" placeholder="PASSWORD">
                    </form>
                    <div class="loginBtn">
                        <a href="listPage.cfm">LOGIN</a>
                        <p class="singinTxt"> Or Sign In Using</p>
                    </div>
                    <div class="anotherAccess">
                        <img class="fb" src="./assets/fb.png" alt="img" width="40" height="40">
                        <img class="google" src="./assets/google.png" alt="img" width="30" height="30">
                    </div>
                    <div class="registerCont">
                        <p class="accountTxt">Don't have an account?</p>
                        <a href="signupPage.cfm" >Register Here</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Page</title>
    <link rel="stylesheet" href="./style/style.css">
    <link rel="stylesheet" href="./style/jquery-ui.css">
    <script src="./script/sourceFirst.js"></script>
    <script src="./script/sourceSecond.js"></script>
    <script src="./script/sourceThird.js"></script>
    <script src="./script/jquery.min.js"></script>
    <script src="./script/jquery-ui.min.js"></script>
    <script src="./script/validation.js"></script>
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
        <div class="mainSectionn">
            <div class="mainBodyFt">
                <img class="addressLogoImg" src="./assets/bodyBook.png" alt="img" width="75" height="75">
            </div>
            <div class="mainBodySndd">
                <h1>SIGN UP</h1>
                <div class="mainBodySndCont">
                    <form class="inputContz">
                        <input type="text" class="inputs" placeholder="Full Name" id="fullName">
                        <span id="fullNameError" class="error"></span>
                        <input type="email" class="inputs" placeholder="Email ID" id="email">
                        <span id="emailError" class="error"></span>
                        <input type="email" class="inputs" placeholder="User Name" id="userName">
                        <span id="usernameError" class="error"></span>
                        <input type="password" class="inputs" placeholder="Password" id="password">
                        <span id="passwordError" class="error"></span>
                        <input type="password" class="inputs" placeholder="Confirm Password" id="confirmPassword">
                         <span id="confirmError" class="error"></span>
                        <input type="button" class="submitBtn" id="submitClick" value="Register">
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
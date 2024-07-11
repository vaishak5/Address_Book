$(document).ready(function(){
    /*SIGN IN*/
    $("#submitClick").click(function () {
        var fullName=$("#fullName").val().trim();
        var emailId=$("#email").val().trim();
        var userName=$("#userName").val().trim();
        var password=$("#password").val().trim();
       if(signValidation()){
            $.ajax({
                type: "POST",
                url: "./component/addressBook.cfc?method=signUpload",
                datatype: "text",
                data: {fullName:fullName,
                    emailId: emailId,
                    userName:userName,
                    password: password,
                },
             
                success: function(response) {
                    console.log(response);
                    if (response =="true") {
                        alert("Form submitted successfully!");
                        window.location.href = "./loginPage.cfm";
                    } else { 
                        alert("Username already exists!");
                        window.location.reload();
                    }
                },
                error: function(xhr, status, error) { 
                    console.error(error);
                    alert("An error occurred while submitting the form. Please try again.");
                }
            });
        }
        return false;
    });

    /*LOGIN*/ 
    $("#loginSubmit").click(function ()  {
        var emailId=$("#email").val().trim();
        var password=$("#password").val().trim();
        if(emailId==""|| password==""){
            alert("Invalid username and Password!");
            return;
        }
        else{
            
            $.ajax({
                type: "POST",
                url: "./component/addressBook.cfc?method=checkLogin",
                datatype: "text",
                data: {emailId:emailId,
                    password: password
                },
                success: function(response) {
                    if (response === "true") {
                        alert("Login Successfully!!!")
                        window.location.href = "./listPage.cfm";
                    } else  { 
                        alert("User Not Found!!!");
                    }
                },
                error: function(xhr, status, error) {
                    console.error(error);
                    alert("An error occurred while submitting the form. Please try again.");
                }
            });
        }
    });   
});
function signValidation(){
    var fullName=$("#fullName").val().trim();
    var emailId=$("#email").val().trim();
    var userName=$("#userName").val().trim();
    var password=$("#password").val().trim();
    var confirmPassword=$("#confirmPassword").val().trim();
    $(".error").hide();
    var isValid = true;
    if(fullName=="" && emailId=="" && userName=="" && password=="" && confirmPassword==""){
        $("#fullNameError").html("This field is required. Please enter a value.").css("color","red");
        $("#fullNameError").show();
        $("#emailError").html("This field is required. Please enter a value.").css("color","red");
        $("#emailError").show();
        $("#usernameError").html("This field is required. Please enter a value.").css("color","red");
        $("#usernameError").show();
        $("#passwordError").html("This field is required. Please enter a value.").css("color","red");
        $("#passwordError").show();
        $("#confirmError").html("This field is required. Please enter a value.").css("color","red");
        $("#confirmError").show();
        isValid = false;
    }
    else{
        if(fullName==""){
        $("#fullNameError").html("Please enter the full name").css("color","red");
        $("#fullNameError").show();
        isValid = false;
        }
        
        if(!(/\S+@\S+\.\S+/.test(emailId)) || emailId==""){
            $("#emailError").html("Please enter a valid Email ID.").css("color","red");
            $("#emailError").show();
            isValid = false;
        }
        if(userName==""){
            $("#usernameError").html("Please enter a valid User Name.").css("color","red");
            $("#usernameError").show();
            isValid = false;
        }
        if(password==""){
            $("#passwordError").html("Please enter the password").css("color","red");
            $("#passwordError").show();
            isValid = false;
        }
        else if (!isValidPassword(password)) {
            $("#passwordError").html("Password must contain all kind of formats!").css("color","red");
            $("#passwordError").show();
            isValid = false;
        }
        if(confirmPassword==""){
            $("#confirmError").html("Please enter the correct password").css("color","red");
            $("#confirmError").show();
        }
        if (password != confirmPassword){
            $("#confirmError").html("Please enter correct password").css("color","red");
            $("#confirmError").show();
            isValid = false;
        }
    }
    if(isValid){
        return true;
    }
    return false;
}
function isValidPassword(password) {
    var passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
    return passwordRegex.test(password);
}

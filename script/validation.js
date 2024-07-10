$(document).ready(function(){
    $("#submitClick").on("click", function () {
        var fullName=$("#fullName").val().trim();
        var emailId=$("#email").val().trim();
        var userName=$("#userName").val().trim();
        var password=$("#password").val().trim();
        var confirmPassword=$("#confirmPassword").val().trim();
        if(signValidation()){
            $.ajax({
                type: "POST",
                url: "./component/addressBook.cfc?method=signUpload",
                datatype: "text",
                data: {fullName:fullName,
                    emailId: emailId,
                    userName:userName,
                    password: password,
                    confirmPassword:confirmPassword
                },
                success: function(response) {
                    if (response === true) {
                        alert("Form submitted successfully!");
                        window.location.href = "./loginPage.cfm";
                    } else if (response === false) { 
                        alert("Username already exists!");
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
        if(!(/\S+@\S+\.\S+/.test(userName)) ||  userName==""){
            $("#usernameError").html("Please enter a valid User Name.").css("color","red");
            $("#usernameError").show();
            isValid = false;
        }
        if(password==""){
            $("#passwordError").html("Please enter the password").css("color","red");
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

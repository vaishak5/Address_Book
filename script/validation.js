$(document).ready(function(){
    /*SIGN IN*/
    $("#submitClick").click(function () {
        var fullName=$("#fullName").val().trim();
        var emailId=$("#email").val().trim();
        var userName=$("#userName").val().trim();
        var password=$("#password").val().trim();
        var file=$('#myfile')[0].files[0];
        var formData = new FormData();
        formData.append("fullName",fullName) ;
        formData.append("emailId", emailId);
        formData.append("userName", userName);
        formData.append("password", password);
        formData.append("myfile", file);
        if(signValidation()){
         $.ajax({
                type: "POST",
                url: "./component/addressBook.cfc?method=signUpload",
                processData: false,
                contentType: false,
                datatype: "text",
                data: formData,
                success: function(response) {
                    if(response === "true"){
                        console.log(response);
                        alert("New User added Successfully");
                        window.location.href = "./loginPage.cfm";
                    }
                    else if(response === "false"){
                        console.log(response);
                        alert("User Already exists!");
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
    
    /*Create Contact(Entering new datas into the form)*/
    $("#dataCreating").click(function (){
        var title=$("#titles").val().trim();
        var firstName=$("#firstName").val().trim();
        var lastName=$("#lastName").val().trim();
        var gender=$("#gender").val().trim();
        var dob=$("#dob").val().trim();
        var profile=$("#profile").val().trim();
        var address=$("#address").val().trim();
        var street=$("#street").val().trim();
        var phoneNum=$("#phoneNumber").val().trim();
        var email=$("#email").val().trim();
        var pincode=$("#pincode").val().trim();
        if(formValidation){
            if( title=="" || firstName=="" || lastName=="" || gender=="" || dob=="" || profile=="" || address=="" || street=="" ||  phoneNum=="" || email=="" || pincode){
                alert("This field is required Plz enter any values in the given fields!!!");
                return;
            };
        }
    });
});




function signValidation(){
    var fullName=$("#fullName").val().trim();
    var file=$("#myfile").val().trim();
    var emailId=$("#email").val().trim();
    var userName=$("#userName").val().trim();
    var password=$("#password").val().trim();
    var confirmPassword=$("#confirmPassword").val().trim();
    $(".error").hide();
    var isValid = true;
    if(fullName=="" && file=="" && emailId=="" && userName=="" && password=="" && confirmPassword==""){
        $("#fullNameError").html("This field is required. Please enter a value.").css("color","red");
        $("#fullNameError").show();
        $("#fileError").html("This field is required. Please enter a value.").css("color","red");
        $("#fileError").show();
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
        if(file==""){
            $("#fileError").html("Please fill the field").css("color","red");
            $("#fileError").show();
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
function formValidation(){
    var title=$("#titles").val().trim();
    var firstName=$("#firstName").val().trim();
    var lastName=$("#lastName").val().trim();
    var gender=$("#gender").val().trim();
    var dob=$("#dob").val().trim();
    var profile=$("#profile").val().trim();
    var address=$("#address").val().trim();
    var street=$("#street").val().trim();
    var phoneNum=$("#phoneNumber").val().trim();
    var email=$("#email").val().trim();
    var pincode=$("#pincode").val().trim();
    var isValid=true;
    if( title=="" && firstName==""&& lastName=="" && gender=="" && dob=="" && profile=="" && address=="" && street=="" &&  phoneNum=="" && email=="" && pincode){
        alert("This field is required...Plz enter any values in the given fields!!!");
        isValid = false;
    }
    else{
        if(title===""){
            alert("Please enter any value in the Title field");
            isValid = false;
        }
        if(firstName==""){
            alert("Please enter any value in the FirstName field");
            isValid = false;
        }
        if(lastName==""){
            alert("Please enter any value in the LastName field");
            isValid = false;
        }
        if(gender==""){
            alert("Please enter any value in the Gender field");
            isValid = false;
        }
        if(dob==""){
            alert("Please enter any value in the DOB field");
            isValid = false;
        }
        if(profile==""){
            alert("Please select any value in the File field");
            isValid = false;
        }
        if(address==""){
            alert("Please enter any value in the Address field");
            isValid = false;
        }
        if(street==""){
            alert("Please enter any value in the Street field");
            isValid = false;
        }
        if(phoneNum==""){
            alert("Please enter any value in the Phone Number field");
            isValid = false;
        }
        if(email==""){
            alert("Please enter any value in the Email field");
            isValid = false;
        }
        if(pincode==""){
            alert("Please enter any value in the Pincode field");
            isValid = false;
        }
    }
    if(isValid){
        return true;
    }
    return false;
}

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
    $("#dataCreating").click(function () {
        var title = $("#titles").val().trim();
        var firstName = $("#firstName").val().trim();
        var lastName = $("#lastName").val().trim();
        var gender = $("#gender").val().trim();
        var dob = $("#dob").val().trim();
        var profile = $("#profile")[0].files[0];
        var address = $("#address").val().trim();
        var street = $("#street").val().trim();
        var phoneNum = $("#phoneNumber").val().trim();
        var email = $("#email").val().trim();
        var pincode = $("#pincode").val().trim();
        var formData = new FormData();
        formData.append("title", title);
        formData.append("firstName", firstName);
        formData.append("lastName", lastName);
        formData.append("gender", gender);
        formData.append("dob", dob);
        formData.append("profile", profile);
        formData.append("address", address);
        formData.append("street", street);
        formData.append("phoneNumber", phoneNum); // Ensure this matches ColdFusion argument name
        formData.append("email", email);
        formData.append("pincode", pincode);
        
        if (formValidation()) {
            $.ajax({
                type: "POST",
                url: "./component/addressBook.cfc?method=dataUpload",
                contentType: false,
                processData: false,
                dataType: "text",
                data: formData,
                success: function(response) {
                    if (response === "true") {
                        window.location.href = "./listPage.cfm";
                    }
                    else if(response === "false") {
                        alert("Datas already present!!");
                    }
                },
                error: function(xhr, status, error) {
                    console.error(error);
                    alert("An error occurred while submitting the form. Please try again.");
                }
            });
        }
    });

    /*Deleting Rows*/
    $(".delete").click( function () {
        var contactId = $(this).attr("data-id");
        var deleting=$(this);
        $.ajax({
            type: "POST",
            url: './component/addressBook.cfc?method=deleteDatas',
            dataType: "text",
            data: { contactId: contactId },
            success: function(response) {
                alert("Data is deleted successfully!!");
                $(deleting).parents("tr").remove();//remove previous row element datas
    
            },
            error: function(xhr, status, error) {
                console.error(error);
                alert("Error deleting record.");
            }
        });
    });

    /*View Full Data Row*/
    $(".view").click(function() {
        var contactId = $(this).data("id");
        $.ajax({
            type: "POST",
            url: "./component/addressBook.cfc?method=viewDatas",
            dataType: "text", 
            data: {
                contactId: contactId
            },
            success: function(response) {
                var viewDetails = JSON.parse(response); 
                console.log(viewDetails);
                $("#fullName").html(viewDetails.FULLNAME);
                $("#genders").html(viewDetails.GENDER);
                $("#dobSecond").html(viewDetails.DOB);
                $("#addressSecond").html(viewDetails.FULLADDRESS);
                $("#phoneNumberSecond").html(viewDetails.PHONENUMBER);
                $("#emailid").html(viewDetails.EMAIL);
                $("#pincodeSecond").html(viewDetails.PINCODE);
                $("#myImage").attr( "src" , "./assets/"+viewDetails.PROFILEPIC);
            },
            error: function(xhr, status, error) {
                console.error("Error:", status, error); 
                alert("Failed to retrieve data."); 
            }
        });
    });

    /*Select datas in the row(all input fields)*/

    $(".editBtn").click(function() {
        var contactid=$(this).attr("contactid");
        
        $.ajax({
            type: "POST",
            url: "./component/addressBook.cfc?method=selectDatas",
            dataType: "text", 
            data: {
                contactId: contactid
            },
            success: function(response) {
                var selectDetails = JSON.parse(response); 
                var date = new Date(selectDetails.dob);
                var dateSet = date.getFullYear() + '-' + ('0' + (date.getMonth() + 1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2);
                console.log(date);
                console.log(dateSet);
                console.log(selectDetails.myFile);
                console.log(selectDetails); 
                $("#editTitle").val(selectDetails.title);
                $("#editFirstName").val(selectDetails.firstName);
                $("#editLastName").val(selectDetails.lastName);
                $("#editGender").val(selectDetails.gender);
                $("#editDob").prop("value", dateSet);
                $("#editAddress").val(selectDetails.address);
                $("#editStreet").val(selectDetails.street);
                $("#editPhoneNumber").val(selectDetails.phoneNumber);
                $("#editEmail").val(selectDetails.email);
                $("#editPincode").val(selectDetails.pincode); 
                $("#editingMyFile").attr( "src" , "./assets/"+selectDetails.myFile);
            },
            error: function(xhr, status, error) {
                console.error("Error:", status, error); 
                alert("Failed to retrieve data."); 
            }
    });

    /*Updating new datas to the field*/

    $(".updateNewDatas").click(function(){
        var contactid=$(this).attr("contactid");
        console.log(contactid);
        var firstName=$("#editFirstName").val().trim();
        var lastName=$("#editLastName").val().trim();
        var gender = $("#editGender").val().trim();
        var dob = $("#editDob").val().trim();
        var address = $("#editAddress").val().trim();
        var street = $("#editStreet").val().trim();
        var phoneNum = $("#editPhoneNumber").val().trim();
        var email = $("#editEmail").val().trim();
        var pincode = $("#editPincode").val().trim();
        /* var profile = $("#profile")[0].files[0]; */
        $.ajax({
            type: "POST",
            url: "./component/addressBook.cfc?method=updatingDatas",
            dataType: "text", 
            data: {
                contactId: contactid,
                firstName:firstName,
                lastName:lastName,
                gender:gender,
                dob:dob,
                address:address,
                street:street,
                phoneNumber:phoneNum,
                email:email,
                pincode:pincode,
                /* profile:profile */
            },
            success: function(response) {
                if (response)  {
                    var editedRow = $("#" + contactid);//select the row elements with id(contactid) attribute
                    editedRow.find(".nameList").text(firstName);
                    editedRow.find(".nameList").text(lastName);
                    editedRow.find(".emailList").text(email);
                    editedRow.find(".phoneList").text(phoneNum);
                    alert("Data edited!!");
                    window.location.href = "./listPage.cfm";
                } else {
                    alert("Failed to edit data. Please try again.");
                }
            },
            error: function(xhr, status, error) {
                console.error(error);
                alert("An error occurred while submitting the form. Please try again.");
            }


        });
    });
});


    
    
});

/*SIGN UP*/

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
/*VALIDATE PASSWORD*/

function isValidPassword(password) {
    var passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
    return passwordRegex.test(password);
}

/*CREATE CONTACT*/

function formValidation() {
    var title = $("#titles").val().trim();
    var firstName = $("#firstName").val().trim();
    var lastName = $("#lastName").val().trim();
    var gender = $("#gender").val().trim();
    var dob = $("#dob").val().trim();
    var profile = $("#profile").val().trim();
    var address = $("#address").val().trim();
    var street = $("#street").val().trim();
    var phoneNum = $("#phoneNumber").val().trim();
    var email = $("#email").val().trim();
    var pincode = $("#pincode").val().trim();
    var isValid = true;
    var errorMsg = [];
    if (title === "" || firstName === "" || lastName === "" || gender === "" || dob === "" || profile === "" || address === "" || street === "" || phoneNum === "" || email === "" || pincode === "") {
        errorMsg.push("All fields are required!");
        isValid = false;
    } else {
        if (title === "") {
            errorMsg.push("Please select a title.");
            isValid = false;
        } if (firstName === "" || /\d/.test(firstName) || firstName.length > 20) {
            errorMsg.push("Please enter a valid first name (up to 20 characters, no digits).");
            isValid = false;
        } if (lastName === "" || /\d/.test(lastName) || lastName.length > 20) {
            errorMsg.push("Please enter a valid last name (up to 20 characters, no digits).");
            isValid = false;
        } if (gender === "") {
            errorMsg.push("Please select a gender.");
            isValid = false;
        } if (dob === "") {
            errorMsg.push("Please enter a date of birth.");
            isValid = false;
        } if (profile === "") {
            errorMsg.push("Please select a profile picture.");
            isValid = false;
        }  if (address === "" || address.length > 100) {
            errorMsg.push("Please enter a valid address (up to 100 characters).");
            isValid = false;
        } if (street === "" || street.length > 50) {
            errorMsg.push("Please enter a valid street (up to 50 characters).");
            isValid = false;
        } if (phoneNum === "" || !(/^\d{10}$/.test(phoneNum))) {
            errorMsg.push("Please enter a valid 10-digit phone number.");
            isValid = false;
        } if (email === "" || !(/\S+@\S+\.\S+/.test(email))) {
            errorMsg.push("Please enter a valid email address.");
            isValid = false;
        }  if (pincode === "" || !(/^\d{6}$/.test(pincode))) {
            errorMsg.push("Please enter a valid 6-digit pincode.");
            isValid = false;
        }
    }
    // Display the error message
    if (errorMsg.length > 0) {
        var errorMessages = errorMsg.join("<br>");
        $("#errorMsg").html(errorMessages).css("color", "red");
        return false; 
    } else {
        $("#errorMsg").html("Data added successfully.").css("color", "green");
        return true; 
    }
}


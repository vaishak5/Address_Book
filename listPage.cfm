<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Page</title>
    <link rel="stylesheet" href="./style/style.css">
    <link rel="stylesheet" href="./style/jquery-ui.css">
    <link rel="stylesheet" href="./style/bootstrap.min.css">
    <script src="./script/sourceFirst.js"></script>
    <script src="./script/sourceSecond.js"></script>
    <script src="./script/sourceThird.js"></script>
    <script src="./script/jquery.min.js"></script>
    <script src="./script/jquery-ui.min.js"></script>
    <script src="./script/validation.js"></script>
    <script src="./script/modalJS.js"></script>
    <script src="./script/reset.js"></script>
</head>
<body>
<cfif session.login>
    <div class="navbar px-5">
        <div class="navbarFt">
            <img class="addressLogo" src="./assets/bodyBook.png" alt="img" width="30" height="30">
            <h3 class="mb-0">ADDRESS BOOK</h3>
        </div>
        <div class="navbarSndSet">
            <img class="loginLogo" src="./assets/logout.png" alt="img" width="20" height="20">
            <a href="./component/addressBook.cfc?method=doLogout">Logout</a>
        </div>
    </div>
    <div class="mainSet">
        <div class="body">
            <div class="bodyFt">
                <div class="downloadSet">
                    <img src="./assets/pdf.png" alt="img">
                    <img src="./assets/excel.png" alt="img">
                    <img src="./assets/print.png" alt="img">
                </div>
            </div>
        </div>
        <div class="bodyConts">
            <div class="bodySnd">
                <div class="d-flex flex-column  bg-light text-dark me-2 text-center rounded">  
                    <div class="userProfile p-2">
                        <img src="./assets/#session.imgFile#" class="rounded-circle img-fluid" alt="img" width="100">
                    </div>
                    <div class="userName p-2 ">#session.fullName#</div>
                        <div class="p-2 ">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="##exampleModal" >
                                Create Contact
                            </button>
                            <!-- Modal -->
                            <div class="modal bd-example-modal-lg fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg p-1">
                                    <div class="modal-content">
                                        <div class="fullBody d-flex">
                                            <div class="firstBody">
                                                <div class="modalContent bg-white px-5">
                                                    <div class="headings">
                                                        <div class="heading d-flex justify-content-center w-100">
                                                            <h3 class="creating px-4 w-100">CREATE CONTACT</h3>
                                                        </div>
                                                        <div class="nextHeading mt-3 w-100 d-flex justify-content-center">
                                                            <h5 class="personal w-100 d-flex py-1">Personal Contact</h5>
                                                        </div>
                                                    </div>
                                                    <div class="inputFields">
                                                        <form class="formField" method="post" action="" id="myForm">
                                                            <!---First Input--->
                                                            <div class="inputSet d-flex gap-5 py-2">
                                                                <div class="titleSet d-flex flex-column">
                                                                    <label for="title" class="title col-3">Title*</label>
                                                                    <select name="title" id="titles" required>
                                                                        <option value selected="selected"></option>
                                                                        <option value="mr">Mr.</option>
                                                                        <option value="mrs">Mrs.</option>
                                                                        <option value="ms">Ms.</option>
                                                                    </select>
                                                                </div>
                                                                <div class="firstName d-flex flex-column">
                                                                    <label for="fname" class="fname col-6">First Name*</label>
                                                                    <input type="text" name="fname" placeholder="Your First Name" id="firstName" required>
                                                                </div>
                                                                <div class="lastName d-flex flex-column">
                                                                    <label for="lname" class="lname col-6">Last Name*</label>
                                                                    <input type="text" name="lname" placeholder="Your Last Name" id="lastName" required>
                                                                </div>
                                                
                                                            </div>
                                                            <!---Second Input--->
                                                            <div class="inputSetSecond d-flex gap-5 py-3">
                                                                <div class="titleSet d-flex flex-column">
                                                                    <label for="gender" class="title col-3">Gender*</label>
                                                                    <select name="gender" id="gender" required>
                                                                        <option value selected="selected"></option>
                                                                        <option value="male">Male</option>
                                                                        <option value="female">Female</option>
                                                                    </select>
                                                                </div>
                                                                <div class="dateSet d-flex flex-column">
                                                                    <label for="dob" class="dob col-10">Date Of Birth*:</label>
                                                                    <input type="date" id="dob" name="dob" required>
                                                                </div>
                                                            </div>
                                                            <!---Third Input--->
                                                            <div class="inputThird d-flex">
                                                                <div class="upload d-flex flex-column col-8">
                                                                    <label for="myfile" class="file col-4">Upload Photo*</label>
                                                                    <input type="file" id="profile" name="myfile" required>
                                                                </div>
                                                            </div>
                                                            <!---Heading2--->
                                                            <div class="details">
                                                                <div class="nextHeading mt-3 w-100 d-flex justify-content-center">
                                                                    <h5 class="personal w-100 d-flex py-1">Contact Details</h5>
                                                                </div>
                                                            </div>
                                                            <!---Fourth Input--->
                                                            <div class="inputSet d-flex gap-5 py-2">
                                                                <div class="firstName d-flex flex-column col-5">
                                                                    <label for="fname" class="fname col-4">Address*</label>
                                                                    <input type="text" name="fname" id="address" required>
                                                                </div>
                                                                <div class="lastName d-flex flex-column col-5">
                                                                    <label for="lname" class="lname col-3">Street*</label>
                                                                    <input type="text" name="lname" id="street" required>
                                                                </div>
                                                            </div>
                                                            <!---Fifth Input--->
                                                            <div class="inputSet d-flex gap-5 py-2">
                                                                <div class="firstName d-flex flex-column col-5">
                                                                    <label for="fname"  class="fname col-7">Phone Number*</label>
                                                                    <input type="text" name="fname" maxlength="10" id="phoneNumber" required>
                                                                </div>
                                                                <div class="lastName d-flex flex-column col-5">
                                                                    <label for="lname" class="lname col-3">Email*</label>
                                                                    <input type="email" name="lname" id="email" required>
                                                                </div>
                                                            </div>
                                                            <!---Sixth Input--->
                                                            <div class="inputSet d-flex gap-5 py-2">
                                                                <div class="firstName d-flex flex-column col-5">
                                                                    <label for="fname"  class="fname col-4">Pincode*</label>
                                                                    <input type="text" name="fname" maxlength="6" id="pincode" required>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <span id="errorMsg" class="errorTxt"></span>
                                                    <!---Close--->
                                                    <div class="footer col-8 py-3 gap-3">
                                                        <button type="button" class="btn btn-primary" id="dataCreating">Submit</button>
                                                        <button type="button" class="btn btn-secondary close" data-bs-dismiss="modal" aria-bs-label="Close" onclick="myFunction()">Close</button>
                                                    </div>
                                                    <!---Close--->
                                                </div>
                                            </div>
                                            <div class="secondMain col-4">
                                                <div class="dummyImg">
                                                    <img src="./assets/profilePic.png" alt="image" width="200">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bodyThd">
                    <div class="tableStyle d-flex align-items-center justify-content-center">
                        <table class="table table-hover">
                           <thead>
                              <tr>
                                 <th class="titleValues" scope="col-3">
                                    <h6><b>NAME</b></h6>
                                 </th> 
                                 <th class="titleValues" scope="col">
                                    <h6><b>EMAIL ID</b></h6>
                                 </th>
                                 <th class="titleValues" scope="col">
                                    <h6><b>MOBILE NUMBER</b></h6>
                                 </th>
                              </tr>
                           </thead>
                           <tbody>
                            
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <cfelse>
        <cflocation  url="loginPage.cfm">
    </cfif> 
</body>
</html>
</cfoutput>
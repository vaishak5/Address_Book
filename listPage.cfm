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
            <div class="mainSett">
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
                                                            <option value="mr">MR.</option>
                                                            <option value="mrs">MRS.</option>
                                                            <option value="ms">MS.</option>
                                                         </select>
                                                      </div>
                                                      <div class="firstName d-flex flex-column">
                                                         <label for="fname" class="fname col-6">First Name*</label>
                                                         <input type="text" name="fname" placeholder="Your First Name" id="firstName"  required>
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
                                                            <option value="male">MALE</option>
                                                            <option value="female">FEMALE</option>
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
                                                         <label for="address" class="fname col-4">Address*</label>
                                                         <input type="text" name="address" id="address" required>
                                                      </div>
                                                      <div class="lastName d-flex flex-column col-5">
                                                         <label for="street" class="lname col-3">Street*</label>
                                                         <input type="text" name="street" id="street" required>
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
                           <thead class="col-12">
                              <tr class="col-12">
                                 <th class="titleValues"  scope="col-3">
                                    <h6><b></b></h6>
                                 </th>
                                 <th class="titleValues" scope="col-3">
                                    <h6><b>NAME</b></h6>
                                 </th>
                                 <th class="titleValues" scope="col">
                                    <h6><b>EMAIL ID</b></h6>
                                 </th>
                                 <th class="titleValues" scope="col">
                                    <h6><b>MOBILE NUMBER</b></h6>
                                 </th>
                                 <th class="titleValues" scope="col">
                                    <h6><b></b></h6>
                                 </th>
                                 <th class="titleValues" scope="col">
                                    <h6><b></b></h6>
                                 </th>
                                 <th class="titleValues" scope="col">
                                    <h6><b></b></h6>
                                 </th>
                              </tr>
                           </thead>
                           <tbody>
                              <cfset local.contacts = EntityLoad("ORM_Create_Contact")>
                              <cfloop array="#local.contacts#" index="contact">
                                 <cfset local.contactId = contact.getcontactId()>
                                 <cfif session.userID EQ contact.getuserId()>
                                    <tr>
                                       <td><img src="./assets/#contact.getprofilePic()#" class="profilePhoto" alt="profile"></td>
                                       <td>#contact.getfirstName()# #contact.getlarstName()#</td>
                                       <td>#contact.getemailID()#</td>
                                       <td>#contact.getphoneNumber()#</td>
                                       <td>
                                          <button type="submit" class="btn btn-primary editBtn" data-bs-toggle="modal" data-bs-target="##exampleModal3" contactid="#contact.getcontactId()#">
                                          Edit
                                          </button>
                                       </td>
                                       <!---Edit Modal--->
                                       <div class="modal bd-example-modal-lg fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                          <div class="modal-dialog modal-lg p-1">
                                             <div class="modal-content">
                                                <div class="fullBody d-flex">
                                                   <div class="firstBody">
                                                      <div class="modalContent bg-white px-5">
                                                         <div class="headings">
                                                            <div class="heading d-flex justify-content-center w-100">
                                                               <h3 class="creating px-4 w-100 d-flex justify-content-center">CREATE CONTACT</h3>
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
                                                                     <label for="editTitle" class="title col-3">Title*</label>
                                                                     <select name="editTitle" id="editTitle" required>
                                                                        <option value selected="selected"></option>
                                                                        <option value="mr">MR.</option>
                                                                        <option value="mrs">MRS.</option>
                                                                        <option value="ms">MS.</option>
                                                                     </select>
                                                                  </div>
                                                                  <div class="firstName d-flex flex-column">
                                                                     <label for="fname" class="fname col-6">First Name*</label>
                                                                     <input type="text" name="editFirstName" placeholder="Your First Name" id="editFirstName" required>
                                                                  </div>
                                                                  <div class="lastName d-flex flex-column">
                                                                     <label for="editLastName" class="lname col-6">Last Name*</label>
                                                                     <input type="text" name="editLastName" placeholder="Your Last Name" id="editLastName" required>
                                                                  </div>
                                                               </div>
                                                               <!---Second Input--->
                                                               <div class="inputSetSecond d-flex gap-5 py-3">
                                                                  <div class="titleSet d-flex flex-column">
                                                                     <label for="editGender" class="title col-3">Gender*</label>
                                                                     <select name="editGender" id="editGender" required>
                                                                        <option value selected="selected"></option>
                                                                        <option value="male">MALE</option>
                                                                        <option value="female">FEMALE</option>
                                                                     </select>
                                                                  </div>
                                                                  <div class="dateSet d-flex flex-column">
                                                                     <label for="editDob" class="dob col-10">Date Of Birth*:</label>
                                                                     <input type="date" id="editDob" name="editDob" required>
                                                                  </div>
                                                               </div>
                                                               <!---Third Input--->
                                                               <div class="inputThird d-flex">
                                                                  <div class="upload d-flex flex-column col-8">
                                                                     <label for="editMyFile" class="file col-4">Upload Photo*</label>
                                                                     <input type="file" id="editMyFile" name="editMyFile" required>
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
                                                                     <label for="editAddress" class="fname col-4">Address*</label>
                                                                     <input type="text" name="editAddress" id="editAddress" required>
                                                                  </div>
                                                                  <div class="lastName d-flex flex-column col-5">
                                                                     <label for="editStreet" class="lname col-3">Street*</label>
                                                                     <input type="text" name="editStreet" id="editStreet" required>
                                                                  </div>
                                                               </div>
                                                               <!---Fifth Input--->
                                                               <div class="inputSet d-flex gap-5 py-2">
                                                                  <div class="firstName d-flex flex-column col-5">
                                                                     <label for="editPhoneNumber"  class="fname col-7">Phone Number*</label>
                                                                     <input type="text" name="editPhoneNumber" maxlength="10" id="editPhoneNumber" required>
                                                                  </div>
                                                                  <div class="lastName d-flex flex-column col-5">
                                                                     <label for="editEmail" class="lname col-3">Email*</label>
                                                                     <input type="email" name="editEmail" id="editEmail" required>
                                                                  </div>
                                                               </div>
                                                               <!---Sixth Input--->
                                                               <div class="inputSet d-flex gap-5 py-2">
                                                                  <div class="firstName d-flex flex-column col-5">
                                                                     <label for="editPincode"  class="fname col-4">Pincode*</label>
                                                                     <input type="text" name="editPincode" maxlength="6" id="editPincode" required>
                                                                  </div>
                                                               </div>
                                                            </form>
                                                         </div>
                                                         <span id="errorMsg" class="errorTxt"></span>
                                                         <!---Close--->
                                                         <div class="footer col-8 py-3 gap-3">
                                                            <button type="button" class="btn btn-primary updateNewDatas" contactid="#local.contactId#">Submit</button>
                                                            <button type="button" class="btn btn-secondary close" data-bs-dismiss="modal" aria-bs-label="Close" onclick="myFunction()">Close</button>
                                                         </div>
                                                         <!---Close--->
                                                      </div>
                                                   </div>
                                                   <div class="secondMain col-4">
                                                      <div class="dummyImg">
                                                         <img id="editingMyFile" src="" alt="image" class="editImg">
                                                       
                                                      </div>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                       <td><button type="submit" class="btn btn-primary delete"  data-id="#local.contactId#">Delete</button></td>
                                       <td><button type="button" class="btn btn-primary view" data-bs-toggle="modal" data-bs-target="##exampleModal2"  data-id="#local.contactId#">View</button></td>
                                       <!-- Modal -->
                                       <div class="modal bd-example-modal-lg fade" id="exampleModal2" tabindex="-1"  aria-hidden="true">
                                          <div class="modal-dialog modal-lg p-1">
                                             <div class="wholeSection d-flex">
                                                <div class="modalContent bg-white col-9">
                                                   <div class="heading d-flex justify-content-center col-9">
                                                      <h3 class="creating px-4">CONTACT DETAILS</h3>
                                                   </div>
                                                   <div class="displayItems d-flex align-items-baseline px-5 py-3">
                                                      <div class="displayDetails d-flex flex-column col-12">
                                                         <div class="nameSet d-flex">
                                                            <p class="set col-3">Name:</p>
                                                            <p class="name" id="fullName"></p>
                                                         </div>
                                                         <div class="genderSet d-flex">
                                                            <p class="set col-3">Gender:</p>
                                                            <p class="gender" id="genders"></p>
                                                         </div>
                                                         <div class="dobSet d-flex">
                                                            <p class="set col-3">Date of Birth:</p>
                                                            <p class="date" id="dobSecond"></p>
                                                         </div>
                                                         <div class="addressSet d-flex">
                                                            <p class="set col-3">Full Address:</p>
                                                            <p class="address" id="addressSecond"></p>
                                                         </div>
                                                         <div class="phoneSet d-flex">
                                                            <p class="set col-3">Phone Number:</p>
                                                            <p class="phone" id="phoneNumberSecond"></p>
                                                         </div>
                                                         <div class="emailSet d-flex">
                                                            <p class="set col-3">Email:</p>
                                                            <p class="email" id="emailid"></p>
                                                         </div>
                                                         <div class="pincodeSet d-flex">
                                                            <p class="set col-3">Pincode:</p>
                                                            <p class="pin" id="pincodeSecond"></p>
                                                         </div>
                                                      </div>
                                                   </div>
                                                   <div class="footerSet py-3 d-flex justify-content-center">
                                                      <button type="button" class="btn btn-primary" id="closeBtn"  data-bs-dismiss="modal" aria-bs-label="Close" onclick="myFunction()">Close</button>
                                                   </div>
                                                </div>
                                                <div class="imgSetContss col-3">
                                                   <div class="placeImg">
                                                      <img id="myImage" src="" alt="image">
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </tr>
                                    <cfelse>
                                    <cfcontinue>
                                 </cfif>
                              </cfloop>
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
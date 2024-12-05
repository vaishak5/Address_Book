<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="./style/style.css">
    <link rel="stylesheet" href="./style/jquery-ui.css">
    <link rel="stylesheet" href="./style/bootstrap.min.css">
    <script src="./script/sourceFirst.js"></script>
    <script src="./script/sourceSecond.js"></script>
    <script src="./script/sourceThird.js"></script>
    <script src="./script/jquery.min.js"></script>
    <script src="./script/jquery-ui.min.js"></script>
    <script src="./script/validation.js"></script>
</head>
<body>
    <div class="navbar px-5">
        <div class="navbarFt">
            <img class="addressLogo" src="./assets/bodyBook.png" alt="img" width="30" height="30">
            <h3 class="mb-0">ADDRESS BOOK</h3>
        </div>
        <div class="navbarSndSet">
            <img class="loginLogo" src="./assets/logout.png" alt="img" width="20" height="20">
            <a href="loginPage.cfm">Logout</a>
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
                        <img src="./assets/google.png" class="rounded-circle img-fluid" alt="img" width="100">
                    </div>
                    <div class="userName p-2 ">Name</div>
                        <div class="p-2 ">
                            <button type="button" class="btn btn-primary">Create Contact</button>
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
                        </table>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</body>
</html>
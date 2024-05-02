
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Modernize Free</title>
    <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
    <link rel="stylesheet" href="../assets/css/styles.min.css" />
</head>

<body>
    <!--  Body Wrapper -->
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6"
        data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed">
        <div class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
            <div class="d-flex align-items-center justify-content-center w-100">
                <div class="row justify-content-center w-100">
                    <div class="col-md-8 col-lg-6 col-xxl-3">
                        <div class="card mb-0">
                            <div class="card-body">
                                <a href="./index.html" class="text-nowrap logo-img text-center d-block py-3 w-100">
                                    <img src="../assets/images/logos/dark-logo.svg" width="180" alt="">
                                </a>
                                <p class="text-center">Your Social Campaigns</p>
                                <form method="post" action="register.php">
                                    <div class="mb-3">
                                        <label for="name" class="form-label">Name</label>
                                        <input type="text" class="form-control" id="name" name="name"
                                            aria-describedby="textHelp" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email Address</label>
                                        <input type="email" class="form-control" id="email" name="email"
                                            aria-describedby="emailHelp" required>
                                    </div>
                                    <div class="mb-4">
                                        <label for="password" class="form-label">Password</label>
                                        <input type="password" class="form-control" id="password" name="password"
                                            required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="role" class="form-label">Role</label>
                                        <select class="form-select" id="role" name="role"
                                            onchange="showDocumentsFields()" required>
                                            <option value="">Select Role</option>
                                            <option value="passenger">Passenger</option>
                                            <option value="temporary_driver">Temporary Driver</option>
                                            <option value="private_driver">Private Driver</option>
                                        </select>
                                    </div>
                                    <div class="mb-3" id="idDocumentField" style="display: none;">
                                        <label for="idDocument" class="form-label">ID Document</label>
                                        <input type="file" class="form-control" id="idDocument" name="idDocument">
                                    </div>
                                    <div class="mb-3" id="drivingLicenseField" style="display: none;">
                                        <label for="drivingLicense" class="form-label">Driving License</label>
                                        <input type="file" class="form-control" id="drivingLicense"
                                            name="drivingLicense">
                                    </div>
                                    <div class="mb-3" id="vehicleRegistrationField" style="display: none;">
                                        <label for="vehicleRegistration" class="form-label">Vehicle Registration</label>
                                        <input type="file" class="form-control" id="vehicleRegistration"
                                            name="vehicleRegistration">
                                    </div>
                                    <button type="submit"
                                        class="btn btn-primary w-100 py-2 fs-4 mb-4 rounded-2">Sign Up</button>
                                    <div class="d-flex align-items-center justify-content-center">
                                        <p class="fs-4 mb-0 fw-bold">Already have an Account?</p>
                                        <a class="text-primary fw-bold ms-2"
                                            href="./index.php">Sign In</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function showDocumentsFields() {
            var roleSelect = document.getElementById("role");
            var selectedRole = roleSelect.options[roleSelect.selectedIndex].value;

            if (selectedRole === "temporary_driver") {
                document.getElementById("idDocumentField").style.display = "block";
                document.getElementById("drivingLicenseField").style.display = "block";
                document.getElementById("vehicleRegistrationField").style.display = "none";
            } else if (selectedRole === "private_driver") {
                document.getElementById("idDocumentField").style.display = "block";
                document.getElementById("drivingLicenseField").style.display = "block";
                document.getElementById("vehicleRegistrationField").style.display = "block";
            } else {
                document.getElementById("idDocumentField").style.display = "none";
                document.getElementById("drivingLicenseField").style.display = "none";
                document.getElementById("vehicleRegistrationField").style.display = "none";
            }
        }
    </script>
</body>

</html>
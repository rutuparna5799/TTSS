<!DOCTYPE html>
<html lang="en">
 
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>TTSS</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 
<!-- Add this script tag after including Toastr CSS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <!-- Core theme CSS (includes Bootstrap)-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Add this in the head section of your HTML file -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<!--    <style type="text/css">
body {
    font-size: 14px; /* Adjust the size as needed */
}
form {
  font-size: 14px;
}
 
.form-control {
  font-size: 14px;
  padding: 5px;
  border: 1px solid #ccc;
}
 
</style> -->
   
   
    <script>
    $(document).ready(function () {
        $("#saveSchedule").click(function () {
            var trainingRefId = $("#trainingReferenceId").val();
            var tvenueId = $("#venueId").val();
            var trainingMode = $("#trainingMode").val();
            var trainingMonth = $("#trainingMonth").val();
            var trainingYear = $("#trainingYear").val();
            var trainingName = $("#trainingName").val();
            var module = $("#module").val();
            var description = $("#description").val();
            var grade = $("#grade").val();
            var agency = $("#agency").val();
            var coordinatorname = $("#coordinatorName").val();
            var cemail = $("#email").val();
            var cmobile = $("#mobile").val();
            var tstate = $("#state").val();
            var tdistrict = $("#district").val();
            var tmandal = $("#mandal").val();
            var astartDate = $("#applicationSD").val();
            var aendDate = $("#applicationED").val();
            var tstartDate = $("#trainingSD").val();
            var tendDate = $("#trainingED").val();
 
            // Construct the formData object
            var formData = {
                ref_planner_id: trainingRefId,
                venue_id: tvenueId,
                tmode: trainingMode,
                tmonth: trainingMonth,
                tyear: trainingYear,
                tname: trainingName,
                tmodule: module,
                tdescription: description,
                tgrade: grade,
                tagency: agency,
                coordinatorname: coordinatorname,
                coordinatoremailid: cemail,
                coordinatormobileno: cmobile,
                state: tstate,
                district: tdistrict,
                mandal: tmandal,          
                apply_start_dt: astartDate,
                apply_end_dt: aendDate,
                training_start_dt: tstartDate,
                training_end_dt: tendDate
            };
 
            var jsonString = JSON.stringify(formData);
 
 
            fetch('/TTSS03/api/schedule', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: jsonString
            })
           
            .then(response => response.json())
            .then(data => {
                console.log("Schedule API response:", data);
               
 
               
            })
            .catch(error => {
                console.log("Error:", error);
            });
        });
    });
 
    //script-2
    $(document).ready(function () {
        $("#searchButton").click(function () {
            var searchTerm = $("#trainingReferenceId").val();
 
            $.ajax({
                type: "GET",
                url: "/TTSS03/api/search/schedule?ref_planner_id=" + searchTerm,
                dataType: "json",
                success: function (response) {
                    console.log(response);
                    var tmonth = response[0].tmonth;
                    var tyear = response[0].tyear;
                    var tname = response[0].tname;
                    var tdescription = response[0].tdescription;
                   
                    var tmode = response[0].tmode;
                    //var tmodule = response[0].tmodule;
                    var tgrade = response[0].tgrade;
                    var tagency = response[0].tagency;
                    var tcategory = response[0].tcategory;
                    var module = response[0].t_subjects;
 
                   
 
                    $("#trainingMonth").val(tmonth);
                    $("#trainingYear").val(tyear);
                    $("#trainingName").val(tname);
                    $("#description").val(tdescription);
                   
                    $("#traningMode").val(tmode);
                    //$("#module").val(tmodule);
                    $("#grade").val(tgrade);
                    $("#trainingMode").val(tmode);
                    $("#agency").val(tagency);
                    $("#trainingType").val(tcategory);
                    $("#module").val(module);
                },
                error: function (error) {
                    console.log("Error:", error);
                }
            });
        });
    });
 
    function formatDate(inputDate) {
        var date = new Date(inputDate);
        var year = date.getFullYear();
        var month = String(date.getMonth() + 1).padStart(2, '0');
        var day = String(date.getDate()).padStart(2, '0');
        return year + "-" + month + "-" + day;
    }
   
   
                 
   
    $(document).ready(function () {
        $.ajax({
            url: "/TTSS03/api/search/venue",
            type: "GET",
            dataType: "json",
            success: function (data) {
                var dropdown = $("#venueDropdown");
                dropdown.empty();
                dropdown.append($("<option>").val("").text("----Select Venue----"));
                $.each(data, function (index, item) {
                    var optionText = item.vname;
                    dropdown.append($("<option>").val(item.vid).text(optionText));
                });
            },
            error: function (error) {
                console.log("Error fetching venue data:", error);
            }
        });
 
        $('#venueDropdown').change(function () {
            var selectedVenueId = $(this).val();
            console.log(selectedVenueId);
 
            if (selectedVenueId) {
                $('#venueId').val(selectedVenueId);
 
                $.ajax({
                    type: "GET",
                    url: "/TTSS03/api/search/venueId?vid=" + selectedVenueId,
                    dataType: "json",
                    success: function (response) {
                        var vid = response[0].vid;
 
                        var vmandal = response[0].vmandal;
                        var vstate = response[0].vstate;
                        var vdistrict = response[0].vdistrict;
                        var vlocation = response[0].vlocation;
                        var vcontactname = response[0].vcontactname;
                        var vcontactno = response[0].vcontactno;
                        var vcontactmailid = response[0].vcontactmailid;
                       
                        $("#venueId").val(vid);
                        $("#mandal").val(vmandal);
                        $("#state").val(vstate);
                        $("#district").val(vdistrict);
                        $("#mapLocation").val(vlocation);
                        $("#coordinatorName").val(vcontactname);
                        $("#mobile").val(vcontactno);
                        $("#email").val(vcontactmailid);
                         
 
                    },
                    error: function (error) {
                        console.log("Error fetching venue details:", error);
                    }
                });
            } else {
                $('#venueId').val('');
                $('#mandal').val('');
                $('#state').val('');
                $('#district').val('');
                $('#mapLocation').val('');
                $('#coordinatorName').val('');
                $('#mobile').val('');
                $('#email').val('');
            }
        });
    });
   
 
    </script>
</head>
 
<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar-->
        <div class="border-end bg-white" id="sidebar-wrapper">
            <div class="sidebar-heading border-bottom bg-light">
                <img src="./assets/loggoo.png" width="110" height="68">
            </div>
            <div class="list-group list-group-flush">
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!"
                    onclick="showTab('tab1')">Academic Calender</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!"
                    onclick="showTab('tab2')">Schedule Training</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" id="viewTraining" href="#!"
                    onclick="showTab('tab3')">View Training</a>
                <!-- Master Setup  menu -->
            </div>
        </div>
        <!-- Page content wrapper-->
        <div id="page-content-wrapper">
            <!-- Top navigation-->
            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom" style="width: 180%;" >
                <div class="container-fluid">
                    <div  id="sidebarToggle" >
                        <div style="width: 35px; height: 5px; background-color: black; margin: 6px 0;"></div>
                        <div style="width: 35px; height: 5px; background-color: black; margin: 6px 0;"></div>
                        <div style="width: 35px; height: 5px; background-color: black; margin: 6px 0;"></div>
                    </div>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation"><span>
                            class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <h1 class="nav-link ms-auto text-center text-info w-100" style="
                          position: relative;
                          top:-30px;
                          right: -200px;
                          font-size: 30px;
                        justify-content: center;
                        margin-top: 40px;
 
                        color: blue;">Teacher Training Support System</h1> <br>
                         <h2 class="nav-link ms-auto text-center text-info w-100" style=" position: relative;
                         top:10px;
                         right: 360px;
                         font-size: 20px;
                       justify-content: center;
                       margin-top: 40px;
                       color: Red;
                       ">Govt Of AndhraPradesh</h2>
 
                       
                        <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                           
                            <li class="nav-item dropdown">
                               
                                   <img  src="./assets/logo.png" width="80" height="68"/>
                               
                             
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Page content-->
            <!-- ######################### View Achedemic calender #################### -->
            <div class="container tab-content col-12" id="tab1" style="width: 168%;">
<div class="card mt-2">
<div class="card-header" ><b>Academic Calendar</b></div>
<div class="card-body">
<div class="table-responsive w-100">
<div id="excelData"></div>
</div>
</div>
</div>
</div>
 
<script>
    // Replace 'example.xlsx' with the path to your Excel file
    var excelFileURL = './actualTable.csv';
 
    fetch(excelFileURL)
        .then(function (response) {
            return response.arrayBuffer();
        })
        .then(function (data) {
            var workbook = XLSX.read(data, { type: 'array' });
 
            // Assuming you want to display the first sheet's data
            var firstSheetName = workbook.SheetNames[0];
            var worksheet = workbook.Sheets[firstSheetName];
            var excelData = XLSX.utils.sheet_to_json(worksheet, { header: 1 });
 
            // Display the Excel data
            var tableHTML = '<table class="table table-striped table-bordered table-hover w-100">';
            for (var i = 0; i < excelData.length; i++) {
                tableHTML += '<tr>';
                for (var j = 0; j < excelData[i].length; j++) {
                    tableHTML += '<td>' + excelData[i][j] + '</td>';
                }
                tableHTML += '</tr>';
            }
            tableHTML += '</table>';
 
            document.getElementById('excelData').innerHTML = tableHTML;
        })
        .catch(function (error) {
            console.error('Error loading Excel file:', error);
        });
</script>
            <!-- Traning Schudule Form -->
            <div class="container tab-content " id="tab2" style="display: none;width: 178%;" >
                <!-- Form Start  -->
                <div class="card mt-3">
                    <div class="card-header text-center">
                        <h4>Training schedule form</h4>
                    </div>
                    <!-- ################################ -->
                                     <div class="container mt-2">
<!-- <div class="card"> -->
<!-- <div class=""> -->
<form class="card-body shadow-lg bg-body-tertiary rounded" id="top">
<div class="row">
<div class="form-group col-md-3">
<div class="form-floating">
<input type="text" class="form-control" id="trainingReferenceId"
                                            placeholder="12343215" required>
<label for="floatingInputGridTreasury">Training Ref Id</label>
</div>
</div>
<div class="form-group col-md-3">
<div class="form-floating">
<button type="button" class="btn btn-primary btn-lg" Id="searchButton">Search</button>
</div>
</div>
<div class="form-group col-md-3">
<div class="form-group" id="venueName">
<label for="venue">Venue Name:</label>
<select id="venueDropdown" class="form-control"  required></select>
</div>
</div>
<div class="form-group" style="display: none;">
<label for="venue">Venue Id:</label>
<input type="text" class="form-control" id="venueId" name="venueId"  required>
</div>
</div>
</form>
</div>
 
                    <!-- ################################### -->
 
 
 
 
                    <div class="card-body">
<span class="text-danger"> * After search respective data will auto populated</span>
 
<form class="card-body shadow-lg p-3 mb-5 bg-body-tertiary rounded" id="middle">
<div class="row">
<div class="form-group col-md-3">
<div class="form-floating">
<input type="text" class="form-control" id="trainingType" placeholder="12343215"  required>
<label for="trainingType">Training Type</label>
</div>
</div>
<div class="form-group col-md-3">
<div class="form-floating">
<input type="text" class="form-control" id="trainingMode"
                                            placeholder="99372257343"  required>
<label for="trainingMode">Training Mode</label>
</div>
</div>
<div class="form-group col-md-3">
<div class="form-floating">
<input type="text" class="form-control" id="trainingMonth" placeholder="12343215" required>
<label for="trainingMonth">Training Month</label>
</div>
</div>
<div class="form-group col-md-3">
<div class="form-floating">
<input type="text" class="form-control" id="trainingYear" placeholder="12343215" required>
<label for="trainingYear">Training Year</label>
</div>
</div>
</div>
<!-- ################### 2nd ################ -->
<div class="row mt-1">
<div class="form-group col-md-3">
<div class="form-floating">
<input type="text" class="form-control" id="trainingName" placeholder="12343215" required>
<label for="trainingName">Training Name</label>
</div>
</div>
<div class="form-group col-md-3">
<div class="form-floating">
<input type="text" class="form-control" id="module" placeholder="99372257343" required>
<label for="module">Module</label>
</div>
</div>
<div class="form-group col-md-3">
<div class="form-floating">
<input type="text" class="form-control" id="description" placeholder="12343215" required>
<label for="description">Description</label>
</div>
</div>
<div class="form-group col-md-3">
<div class="form-floating">
<input type="text" class="form-control" id="mapLocation" placeholder="12343215" required>
<label for="mapLocation">Map Location</label>
</div>
</div>
</div>
<!-- ################################# 3rd ############################# -->
<div class="row mt-1">
<div class="form-group col-md-3">
<div class="form-floating">
<input type="text" class="form-control" id="grade" placeholder="12343215" required>
<label for="grade">Grade</label>
</div>
</div>
<div class="form-group col-md-3">
<div class="form-floating">
<input type="text" class="form-control" id="agency" placeholder="99372257343" required>
<label for="agency">Agency</label>
</div>
</div>
<div class="form-group col-md-3">
<div class="form-floating">
<input type="text" class="form-control" id="coordinatorName"
                                            placeholder="12343215" required>
<label for="coordinatorName">Co-Ordinater Name</label>
</div>
</div>
<div class="form-group col-md-3">
<div class="form-floating">
<input type="text" class="form-control" id="email" placeholder="12343215" required>
<label for="email">Email</label>
</div>
</div>
</div>
<!-- ############################# 4th ###############################
             -->
<div class="row mt-1">
<div class="form-group col-md-3">
<div class="form-floating">
<input type="text" class="form-control" id="mobile" placeholder="" required>
<label for="mobile">Mobile</label>
</div>
</div>
<div class="form-group col-md-3">
<div class="form-floating">
<input type="text" class="form-control" id="state"   placeholder="" required>
<label for="state">State</label>
</div>
</div>
<div class="form-group col-md-3">
<div class="form-floating">
<input type="text" class="form-control" id="district" placeholder="12343215"
                                            required>
<label for="district">District</label>
</div>
</div>
<div class="form-group col-md-3">
<div class="form-floating">
<input type="text" class="form-control" id="mandal" placeholder="12343215" required>
<label for="mandal">mandal</label>
</div>
</div>
</div>
 
<div class="row mt-1">
<span class="text-danger">* Please Fill The Bellow date</span>
</div>
 
<div class="row mt-1">
<div class="form-group col-md-3">
<div class="form-floating">
<input type="Date" class="form-control " id="applicationSD" required>
<label for="applicationSD" >Application Start Date</label>
</div>
</div>
<div class="form-group col-md-3">
<div class="form-floating">
<input type="Date" class="form-control" id="applicationED"
                                            placeholder="99372257343" required>
<label for="applicationED">Application End Date</label>
</div>
</div>
<div class="form-group col-md-3">
<div class="form-floating">
<input type="Date" class="form-control" id="trainingSD" placeholder="12343215"
                                           required>
<label for="trainingSD">Training Start Date</label>
</div>
</div>
<div class="form-group col-md-3">
<div class="form-floating" >
<input type="Date" class="form-control" id="trainingED" placeholder="12343215" required>
<label for="trainingED">Training End date</label>
</div>
</div>
</div>
<div class="row mt-2">
<div class="col-md-3">
</div>
<div class="col-md-3">
<button type="button" class="btn btn-primary btn-lg " Id="saveSchedule" >Schedule</button>
</div>
<div class="col-md-3">
<button type="button" class="btn btn-danger btn-lg " onclick="fun()">Clear</button>
</div>
<div class="col-md-3">
 
                                </div>
 
                            </div>
 
                        </form>
</div>
</div>
<form>
</form>
 
            </div>
              <!-- ################view Tranning  ######################### -->
            <div class="container mt-2 tab-content" id="tab3" style="display: none;" >
    <div class="card mt-2" style="width: 180%;" >
        <button id="viewTrainingButton" class="btn btn-primary">View Training</button>
        <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="trainingTable">
                <thead>
                    <tr>
                        <th>Training Ref Id</th>
                        <th>Venue</th>
                        <th>Training Mode</th>
                        <th>Module</th>
                        <th>Training Month</th>
                        <th>Training Year</th>
                        <th>Training Name</th>
                        <th>Description</th>
                        <th>Grade</th>
                        <th>Agency</th>
                        <th>Map Location</th>
                        <th>Coordinator Name</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>State</th>
                        <th>District</th>
                        <th>Mandal</th>
                        <th>Application Start Date</th>
                        <th>Application End Date</th>
                        <th>Training Start Date</th>
                        <th>Training End Date</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
</div>
 
<script>
    $(document).ready(function () {
        $("#viewTraining").click(function () {
            $.ajax({
                type: "GET",
                url: "/TTSS03/api/scheduledTrainings",
                dataType: "json",
                success: function (data) {
                    displayTrainingData(data);
                },
                error: function (xhr, status, error) {
                    console.error("API request error: " + error);
                }
            });
        });
 
        function displayTrainingData(data) {
            var trainings = data;
            trainings.reverse();
            var tableBody = $("#trainingTable tbody");
 
            // Clear existing rows
            tableBody.empty();
 
            for (var i = 0; i < trainings.length; i++) {
                var training = trainings[i];
                var row = $("<tr></tr>");
 
                row.append("<td>" + training.ref_planner_id + "</td>");
                row.append("<td>" + training.venue_id + "</td>");
                row.append("<td>" + training.tmode + "</td>");
                row.append("<td>" + training.tmodule + "</td>");
                row.append("<td>" + training.tmonth + "</td>");
                row.append("<td>" + training.tyear + "</td>");
                row.append("<td>" + training.tname + "</td>");
                row.append("<td>" + training.tdescription + "</td>");
                row.append("<td>" + training.tgrade + "</td>");
                row.append("<td>" + training.tagency + "</td>");
                row.append("<td>" + training.location + "</td>");
                row.append("<td>" + training.coordinatorname + "</td>");
                row.append("<td>" + training.coordinator_email + "</td>");
                row.append("<td>" + training.coordinator_mobile + "</td>");
                row.append("<td>" + training.tstate + "</td>");
                row.append("<td>" + training.tdistrict + "</td>");
                row.append("<td>" + training.tmandal + "</td>");
                row.append("<td>" + training.apply_start_dt + "</td>");
                row.append("<td>" + training.apply_end_dt + "</td>");
                row.append("<td>" + training.training_start_dt + "</td>");
                row.append("<td>" + training.training_end_dt + "</td>");
 
                tableBody.append(row);
            }
        }
    });
   
   
    function fun(){
        document.getElementById("top").reset();
        document.getElementById("middle").reset();
 
    }
   
    function alertbox(){
        alert ('training scheduled successfully')
    }
</script>
 
 <script>
    document.getElementById("saveSchedule").addEventListener("click", function () {
        // Display success message
        alert("Training Schedule Successfully ! ! !");
 
        // Wait for 1 second (1000 milliseconds)
        setTimeout(function () {
            // Redirect to another page (replace 'yourPage.html' with the actual page URL)
            window.location.href = '/TTSS03/admin';
        }, 1000);
    });
</script>
 
 
 
 
 
            <!--  script for show hide-->
            <script>
                function showTab(tabId) {
                    var tabs = document.querySelectorAll('.tab-content');
                    for (var i = 0; i < tabs.length; i++) {
                        tabs[i].style.display = 'none';
                    }
 
                    var tabToShow = document.getElementById(tabId);
                    if (tabToShow) {
                        tabToShow.style.display = 'block';
                    }
                }
            </script>
 
 
            <!-- Bootstrap core JS-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Core theme JS-->
            <script src="js/scripts.js"></script>
</body>
 
</html>
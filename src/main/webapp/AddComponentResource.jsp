<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add ComponentResourceLimit</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<style>
body {
	display: flex;
	justify-content: center;
}
form {
	max-width: 600px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
}
 
.form-column {
	float: left;
	width: 45%;
	margin-right: 5%;
}
 
label {
	display: block;
	margin-bottom: 8px;
	color: #333;
}
 
input, select {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
 
.invalid-feedback {
	color: red;
	font-size: 12px;
	margin-top: 5px;
}
 
.buttons {
	text-align: center;
	clear: both;
	margin-top: 15px;
	border: none;
	cursor: pointer;
}
 
button {
	width: 120px;
	padding: 10px;
	border: none;
	cursor: pointer
	background-color: #4caf50;
}
button:hover {
	background-color: #45a049;
}
</style>
</head>
<body>

	<div class="container" align="center">
	<h1>Add Component Resource Limit</h1>
		<form id="addSessionForm" class="text-left" onsubmit="return saveForm()">
   			 <div class="form-row">
		        <div class="form-column">
		            <label for="resources">Resources:</label>
			            <select id="resources" placeholder="Enter Resources" onchange="displaySelected()" required>
			            <option value="projector">Projector</option>
						    <option value="venue">Venue</option>
						    <option value="duster">Duster</option>
						    <option value="speaker">Speaker</option>
						    <option value="marker">Marker</option>
						    <option value="table">Table</option>
						    <option value="chair">Chair</option>
			            </select>
			            
		            <label for="approved_rate">Approved_rate:</label>
	                <input type="text" id="approved_rate" required>
		        </div>
		        <div class="form-column">
		            <label for="budgeted_year">Budgeted_year</label>
		            <input type="text" id="budgeted_year" placeholder="Enter Budgeted year" >
		            <label for="unit">Unit:</label>
			            <select id="unit" placeholder="Options" required>
			           
			            <option value="Per_day">Per Day</option>
						    <option value="lumpsum">LumpSum</option>
			            </select>
		            </div>
		        <div class="buttons">
					<button type="submit" class="btn btn-primary" id="saveButton">Save</button>
					&nbsp;
					<button type="button" class="btn btn-danger" onclick="closeForm()" id="exitButton">Close</button>
				</div>
    	</div>
 	</form>

</div>
	<script>

	function fetchBudgetedYear() {
        var selectedResource = $("#resources").val();

        // Assuming you have a server-side script to fetch the budgeted year based on the selected resource
        $.ajax({
            url: 'your_server_script.php',  // Replace with the actual server-side script URL
            type: 'GET',
            data: {resource: selectedResource},
            success: function (response) {
                // Update the budgeted_year field with the fetched value
                $("#budgeted_year").val(response);
            },
            error: function () {
                console.log("Error fetching budgeted year");
            }
        });
    }

	window.saveGroup = function() {
        if (validateForm()) {
            // Collect form data and create a JSON object
            var formData = {
            		sl : $("#sl").val()
                
            };

            // Make a POST request to the api/savedata endpoint
            $.ajax({
                type : "POST",
                url : "/api/create/spell",
                contentType : "application/json",
                data : JSON.stringify(formData),
                success : function(response) {
                    console.log(response);
                    toastr.success("Training spell saved successfully");
                    setTimeout(function(){
                    window.location.href = "/ComponentResource.jsp";
                    },1000)
                },
                error : function(xhr, status, error) {
                    console.error("API request error: " + error);
                    toastr.error("Failed to save training data");
                }
            });
        }

        // Prevent the default form submission
        return false;
    }
    window.closeForm = function() {
        // Redirect to session.jsp
        window.location.href = "/ComponentResource.jsp";
    }
  
 
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>TTSS</title>
<!-- Favicon-->
<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- Include Toastr CSS and JS -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

<!-- Include Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Your custom script containing deleteTraining function -->

<!-- Include Bootstrap JS (after your custom script) -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Core theme JS (if needed) -->
<script src="js/scripts.js"></script>

<!--      ########## Data-table ########## -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script
	src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<style type="text/css">
.btn {
	font-size: 14px;
}

.edit-button {
	width: 62.47px;
}
</style>

</head>
<body>

	<a href="/AddNewSession.jsp" class="btn btn-success mt-2">Add New
		Session +</a>

	<div class="card mt-2" style="width: 100%;">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered table-striped" id="trainingTable"
					style="font-size: 14px;">
					<!-- Table headers go here -->
					<thead class="thead-dark"
						style="background-color: #337ab7; color: white;">

						<tr>
							<th>Sl.no.</th>
							<th style="display: none">Session UID</th>
							<th>Session Code</th>
							<th>Session Name</th>
							<th>From Date</th>
							<th>To Date</th>
							<th>Status</th>
							<th>Record status</th>
							<th>Action</th>

						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>


	<script>
		// Declare the editTraining function in the global scope

		// Execute the function on page load
		fetchDataAndDisplay();

		function fetchDataAndDisplay() {
			$.ajax({
				type : "GET",
				url : "/api/session/get",
				dataType : "json",
				success : function(data) {
					displayTrainingData(data);
				},
				error : function(xhr, status, error) {
					console.error("API request error: " + error);
					toastr.error("Failed to fetch training data");
				}
			});
		}

		function displayTrainingData(data) {
			var trainings = data;
			var tableBody = $("#trainingTable tbody");

			// Clear existing rows
			tableBody.empty();

			for (var i = 0; i < trainings.length; i++) {
				var training = trainings[i];
				var row = $("<tr></tr>");
				row.append("<td class='serial-column'>" + (i + 1) + "</td>");
				row
						.append('<td style="display: none">' + training.id
								+ '</td>');
				row.append("<td>" + training.sessionCode + "</td>");
				row.append("<td>" + training.sessionName + "</td>");
				row.append("<td>" + training.fromDate + "</td>");
				row.append("<td>" + training.toDate + "</td>");
				row.append("<td>" + training.status + "</td>");
				row.append("<td>" + training.recordstatus + "</td>");
				row
						.append("<td><button class='btn btn-primary btn-sm edit-button' onclick='editTraining("
								+ training.id
								+ ")'>Edit</button><button class='btn btn-danger btn-sm'   onclick='deleteTraining(this,"
								+ training.id + ")'>Delete</button></td>");

				tableBody.append(row);
			}
			var dataTable = $('#trainingTable').DataTable();
		}

		// Sample functions for edit and delete
		function deleteTraining(button, id) {
			// Make an AJAX request to the delete endpoint
			var row = $(button).closest('tr');
			$.ajax({
				type : "Delete",
				url : "/api/session/deleteSession/" + id,
				success : function(response) {

					var table = $('#trainingTable').DataTable();
					table.row(row).remove().draw(false);
					toastr.success("Training deleted successfully");
					// Reload or update the data after deletion
					fetchDataAndDisplay();
				},
				error : function(xhr, status, error) {
					toastr.error("Failed to delete training: " + error);
				}
			});
		}

		// Sample function for edit
		function editTraining(id) {
			// Assuming you have an EditTraining.jsp page to handle editing
			var editUrl = "/EditTrainingSession.jsp?id=" + id;

			// Redirect to the EditTraining.jsp page with the query string parameters
			window.location.href = editUrl;
		}
	</script>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- Toastr CSS and JS links go here -->
</body>
</html>
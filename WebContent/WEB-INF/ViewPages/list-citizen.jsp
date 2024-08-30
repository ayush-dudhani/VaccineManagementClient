<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Citizen List</title>
<!-- Include Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Include Font Awesome CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<style>
body {
	padding: 20px;
	background-color: #f5f5f5; /* Light gray background for the body */
}

.container {
	margin-top: 20px;
}

table {
	margin-top: 20px;
	width: 100%;
}

th, td {
	text-align: center;
}

.table {
	background-color: #ffffff; /* White background for the table */
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	/* Subtle shadow for the table */
}

.table th {
	background-color: #e9ecef;
	/* Light gray background for table headers */
}

.btn-custom {
	margin: 5px;
	padding: 10px 15px;
	border-radius: 5px; /* Rounded corners for buttons */
}

.btn-primary {
	background-color: #007bff; /* Subtle blue */
	border: none;
}

.btn-primary:hover {
	background-color: #0056b3; /* Darker blue on hover */
}

.btn-info {
	background-color: #17a2b8; /* Subtle teal */
	border: none;
}

.btn-info:hover {
	background-color: #117a8b; /* Darker teal on hover */
}

.btn-warning {
	background-color: #ffc107; /* Subtle yellow */
	border: none;
}

.btn-warning:hover {
	background-color: #e0a800; /* Darker yellow on hover */
}

.btn-danger {
	background-color: #dc3545; /* Subtle red */
	border: none;
}

.btn-danger:hover {
	background-color: #c82333; /* Darker red on hover */
}

.btn-success {
	background-color: #28a745; /* Subtle green */
	border: none;
}

.btn-success:hover {
	background-color: #218838; /* Darker green on hover */
}
</style>
<script>
	function redirectTo(url) {
		window.location.href = url;
	}
</script>
</head>
<body>
<script>
        function confirmAndDelete(citizenId, dosesTaken, deleteUrl) {
            // Check if dosesTaken is 0 or 3
            if (dosesTaken === 0 || dosesTaken === 3) {
                // Show confirmation dialog
                if (confirm("Are you sure you want to delete this citizen?")) {
                    // Redirect to the delete URL if confirmed
                    window.location.href = deleteUrl;
                }
            } else {
                alert("Citizen cannot be deleted because the doses taken is neither 0 nor 3.");
            }
        }
    </script>
	<div class="container">
		<h1 class="my-4">Citizen List</h1>

		<!-- Buttons for various actions -->
		<div class="mb-4">
			<button type="button" class="btn btn-primary btn-custom"
				onclick="window.location.href='/VaccineManagementClient/addformforcitizen'">
				<i class="fas fa-plus"></i> Add Citizen
			</button>
			<button type="button" class="btn btn-info btn-custom"
				onclick="window.location.href='/VaccineManagementClient/firstdoselist'">Show
				First Dose Data Table</button>
			<button type="button" class="btn btn-warning btn-custom"
				onclick="window.location.href='/VaccineManagementClient/seconddoselist'">Show
				Second Dose Data Table</button>
			<button type="button" class="btn btn-success btn-custom"
				onclick="window.location.href='/VaccineManagementClient/boosterdoselist'">Show
				Booster Dose Data Table</button>
		</div>

		<!-- Citizen Data Table -->
		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th>ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Address</th>
					<th>Contact</th>
					<th>Date Of Birth</th>
					<th>Email</th>
					<th>Doses Taken</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="citizen" items="${citizens}">
					<c:url value="deleteform" var="citizenDelete">
						<c:param name="citizenId" value="${citizen.citizenId}" />
					</c:url>
					<c:url value="updateform" var="citizenUpdate">
						<c:param name="citizenId" value="${citizen.citizenId}" />
					</c:url>
					<c:url value="adddoseform" var="addDose">
						<c:param name="citizenId" value="${citizen.citizenId}" />
						<c:param name="doseTaken" value="${citizen.dosesTaken}" />
					</c:url>
					<tr>
						<td>${citizen.citizenId}</td>
						<td>${citizen.firstName}</td>
						<td>${citizen.lastName}</td>
						<td>${citizen.address}</td>
						<td>${citizen.contact}</td>
						<td>${citizen.dateOfBirth}</td>
						<td>${citizen.email}</td>
						<td>${citizen.dosesTaken}</td>
						<td>
							<button type="button" class="btn btn-primary btn-custom"
								onclick="redirectTo('${citizenUpdate}')">
								<i class="fas fa-edit"></i>
							</button>
							<button type="button" class="btn btn-danger btn-custom"
                                onclick="confirmAndDelete(${citizen.citizenId}, ${citizen.dosesTaken}, '${citizenDelete}')">
                                <i class="fas fa-trash"></i>
                            </button>
							<button type="button" class="btn btn-success btn-custom"
								onclick="redirectTo('${addDose}')">
								<i class="fas fa-syringe"></i> Add Dose
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>

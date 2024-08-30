<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Citizen</title>
<!-- Include Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<style>
body {
	padding: 20px;
	background-color: #f5f5f5; /* Light gray background for the body */
}

.container {
	max-width: 600px; /* Limit the width of the form */
	margin-top: 20px;
	background-color: #ffffff;
	/* White background for the form container */
	border-radius: 8px; /* Rounded corners for the form container */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	/* Subtle shadow for the form container */
	padding: 20px;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
	color: #343a40; /* Dark gray text color */
}

.form-group label {
	font-weight: bold;
}

.form-control {
	border-radius: 5px; /* Rounded corners for input fields */
	border-color: #ced4da; /* Subtle border color */
}

.form-control:focus {
	border-color: #007bff; /* Blue border on focus */
	box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
	/* Blue shadow on focus */
}

.btn-primary {
	background-color: #007bff; /* Subtle blue for the button */
	border: none;
	border-radius: 5px; /* Rounded corners for the button */
	padding: 10px 20px;
}

.btn-primary:hover {
	background-color: #0056b3; /* Darker blue on hover */
}

.form-group {
	margin-bottom: 1rem;
}
</style>

</head>
<body>
	<div class="container">
		<h1>
			<c:choose>
				<c:when test="${citizen.citizenId != null}">
                    Update Citizen
                </c:when>
				<c:otherwise>
                    Add Citizen
                </c:otherwise>
			</c:choose>
		</h1>
		<div id="formWrapper">
			<form:form action="savecitizen" method="post"
				modelAttribute="citizen">
				<div class="form-group">
					<label for="citizenId">Citizen ID</label>
					<form:input path="citizenId" class="form-control" id="citizenId"
						readonly="${citizen.citizenId != null}" />
				</div>
				<div class="form-group">
					<label for="firstName">First Name</label>
					<form:input path="firstName" class="form-control" id="firstName" />
				</div>
				<div class="form-group">
					<label for="lastName">Last Name</label>
					<form:input path="lastName" class="form-control" id="lastName" />
				</div>
				<div class="form-group">
					<label for="email">Email</label>
					<form:input path="email" class="form-control" id="email" />
				</div>
				<div class="form-group">
					<label for="dob">Date Of Birth</label>
					<form:input path="dateOfBirth" class="form-control" id="dob"
						type="date" />
				</div>
				<div class="form-group">
					<label for="contact">Contact</label>
					<form:input path="contact" class="form-control" id="contact" />
				</div>
				<div class="form-group">
					<label for="address">Address</label>
					<form:input path="address" class="form-control" id="address" />
				</div>
				<div class="form-group">
					<label for="dosesTaken">Doses Taken</label>
					<form:input path="dosesTaken" class="form-control" id="dosesTaken" />
				</div>
				<div class="form-group text-center">
					<input type="submit" class="btn btn-primary"
						value="${citizen.citizenId != null ? 'Update Citizen' : 'Add Citizen'}" />
				</div>
			</form:form>
		</div>
	</div>

	<script>
		document.getElementById("dosesTaken").readOnly = true;
	</script>
</body>
</html>

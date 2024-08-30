<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add First Dose</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f5f5f5; /* Light gray background for the body */
            padding: 20px;
        }
        .container {
            max-width: 600px; /* Set max-width to match previous form */
            margin: 20px auto; /* Center container */
            background-color: #ffffff; /* White background for the form container */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* Subtle shadow for the container */
        }
        .form-group {
            margin-bottom: 1rem;
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
            box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25); /* Blue shadow on focus */
        }
        .btn-custom {
            background-color: #007bff; /* Subtle blue for the button */
            border: none;
            color: #ffffff;
            border-radius: 5px; /* Rounded corners for the button */
            padding: 10px 20px;
        }
        .btn-custom:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
        .text-center {
            text-align: center;
        }
    </style>
    <script>
        function handleRedirect(message, url) {
            // Display the alert dialog
            alert(message);
            // Redirect to the specified URL after the alert is closed
            window.location.href = url;
        }
    </script>
</head>
<body>
    <div class="container">
        <h1 class="my-4 text-center">
            <c:choose>
                <c:when test="${doseNo == 0}">
                    DOSE No 1
                </c:when>
                <c:when test="${doseNo == 1}">
                    DOSE No 2
                </c:when>
                <c:when test="${doseNo == 2}">
                    Booster Dose
                </c:when>
                <c:otherwise>
                    <script>
                        handleRedirect("Congrats!!...You have taken the booster dose too.", "/VaccineManagementClient/citizens");
                    </script>
                </c:otherwise>
            </c:choose>
        </h1>
        <div id="formWrapper">
            <form:form action="adddose" method="post" modelAttribute="DoseDetails">
                <div class="form-group">
                    <label for="citizenIdInput">Citizen ID</label>
                    <form:input path="citizenId" id="citizenIdInput" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="doseName">Dose Name</label>
                    <form:input path="doseName" class="form-control" id="doseName" />
                </div>
                <div class="form-group">
                    <label for="docName">Doctor Name</label>
                    <form:input path="docName" class="form-control" id="docName" />
                </div>
                <div class="form-group">
                    <label for="location">Location</label>
                    <form:input path="location" class="form-control" id="location" />
                </div>
                <div class="form-group">
                    <label for="dd">Dose Date</label>
                    <form:input id="dd" type="date" path="doseDate" class="form-control" />
                </div>
                <div class="form-group text-center">
                    <input type="submit" value="SAVE DOSE DATA" class="btn btn-custom" />
                </div>
            </form:form>
        </div>
    </div>

    <script>
        document.getElementById('citizenIdInput').readOnly = true;
        
    </script>
</body>
</html>

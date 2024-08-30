<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Dose List</title>
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
            margin-top: 20px;
            background-color: #ffffff; /* White background for the container */
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1); /* Subtle shadow for the container */
        }
        .table {
            margin-top: 20px;
            background-color: #ffffff; /* White background for the table */
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1); /* Subtle shadow for the table */
        }
        .table th {
            background-color: #e9ecef; /* Light gray background for table headers */
        }
        .h1-custom {
            margin-top: 20px;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="h1-custom">
            <c:choose>
                <c:when test="${doseno == 1}">
                    First Dose List
                </c:when>
                <c:when test="${doseno == 2}">
                    Second Dose List
                </c:when>
                <c:when test="${doseno == 3}">
                    Booster Dose List
                </c:when>
                <c:otherwise>
                    DOSE No Unknown
                </c:otherwise>
            </c:choose>
        </h1>
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Dose Name</th>
                    <th>Doctor Name</th>
                    <th>Location</th>
                    <th>Dose Date</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="dose" items="${dose}">
                    <tr>
                        <td>${dose.citizenId}</td>
                        <td>${dose.doseName}</td>
                        <td>${dose.docName}</td>
                        <td>${dose.location}</td>
                        <td>${dose.doseDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>

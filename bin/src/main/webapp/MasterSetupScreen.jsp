<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    nav {
      background-color: #008CBA;
      overflow: hidden;
    }

    nav a {
      float: left;
      display: block;
      color: white;
      text-align: center;
      padding: 14px 13px;
      text-decoration: none;
    }

    nav a:hover {
      background-color: #ddd;
      color: black;
    }

    #content {
       margin-top: 10px; /* Adjust based on the height of the navigation bar */    
      padding: 20px;
    }

    iframe {
      width: 100%;
      height: calc(100vh - 50px); /* Adjust based on the height of the navigation bar */
      border: none;
    }
  </style>
</head>
<body>

<nav>
  <a href="/VenueSetUp.jsp" target="mainFramee">Venue</a>
  <a href="/session_master.jsp" target="mainFramee">Session</a>
  <a href="/TrainingGrade.jsp" target="mainFramee">Training Grade</a>
  <a href="/TrainingGroup.jsp" target="mainFramee">Training Group</a>
  <a href="/TrainingCategory.jsp" target="mainFramee">Training Category</a>
  <a href="/TrainingSpell.jsp" target="mainFramee">Training Spell</a>
  <a href="/TrainingMode.jsp" target="mainFramee">Training Mode</a>
  <a href="/TrainingStatus.jsp" target="mainFramee">Training Status</a>
  <a href="/ResourceType.jsp" target="mainFramee">Resource Type</a>
  <a href="/TrainingManagement.jsp" target="mainFramee">Training Management</a>
</nav>

<div id="content">
  <iframe src="/VenueSetUp.jsp" name="mainFramee"></iframe>
</div>

</body>
</html>

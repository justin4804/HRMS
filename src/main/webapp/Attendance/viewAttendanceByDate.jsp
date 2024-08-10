<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Records by Date</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        
        h1 {
            text-align: center;
            margin-top: 20px;
        }
        
        form {
            text-align: center;
            margin-bottom: 20px;
        }
        
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            border: 1px solid #ddd;
            border-radius: 8px; /* Add border radius */
    		overflow: hidden;
    		margin-bottom:20px;
        }
        
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        th {
            background-color: #4CAF50;
        }
        
        tr:hover {
            background-color: #f2f2f2;
        }
        
        td:first-child {
            font-weight: bold;
        }
        
        td:nth-child(odd) {
            background-color: #fff;
        }
        
        td:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        .container {
            max-width: 1200px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin: 0 auto; 
            background-color: #f0f0f0;
            padding: 20px;
        }
        
        .button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            text-decoration: none;
            display: inline-block;
            margin-right : 10px;     
        }
        
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Attendance Records by Date</h1>
    
    
    <%
        // Retrieve date from the request parameter
        String dateParam = request.getParameter("date");
        
        // JDBC connection details
        String jdbcUrl = "jdbc:mysql://localhost:3306/employee";
        String username = "root";
        String password = "@VKcentury100";
        
        try {
            // Establishing a connection to the database
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
            
            // Creating SQL query to retrieve attendance records for the specified date
            String sql = "SELECT e.EmployeeID, a.employeeName, a.clockInTime, a.clockOutTime FROM attendance a INNER JOIN employee e ON a.employeeName = e.FullName WHERE a.date = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, dateParam);
            
            // Executing the SQL query
            ResultSet resultSet = statement.executeQuery();
    %>
<div class="container">
    <table>
        <tr>
        	<th>Date</th>
            <th>Employee ID</th>
            <th>Employee Name</th>
            <th>Clock In Time</th>
            <th>Clock Out Time</th>
        </tr>
        
        <%
            // Displaying the attendance records
            while (resultSet.next()) {
        %>
        
        <tr>
        	<td><%= dateParam %></td>
            <td><%= resultSet.getInt("EmployeeID") %></td>
            <td><%= resultSet.getString("employeeName") %></td>
            <td><%= resultSet.getTime("clockInTime") %></td>
            <td><%= resultSet.getTime("clockOutTime") %></td>
        </tr>
        
        <%
            }
            
            // Closing JDBC objects
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
        %>
    </table>
    <a href="attendance.html" class = "button">Back to Attendance Management</a>
    <a href="../login.html" class="button">Go to Dashboard</a>
</div>
</body>
</html>

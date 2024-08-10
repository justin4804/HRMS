<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Summary Reports - HR Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            flex-direction: column;
        }
        
        h1 {
            text-align: center;
            margin-bottom: 20px;
            width: 100%;
        }
        
        .button-container1, .button-container2, .button-container3, .button-container4 {
            text-align: center;
            margin-bottom: 20px;
            width: 50%;
            display:flex;
            
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
            display: block;
            margin-bottom: 10px;
            width: 25vw;
            box-sizing: border-box;
            margin-right: 35px;
        }
       
        .button:hover {
            background-color: #45a049;
        }
        
        .input-container {
            margin-bottom: 20px;
            width: 50%;
            display: flex;
            flex-wrap: wrap;
            flex-direction: column;
        }
        
        .input-box {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 30px;
            margin-bottom: 10px;
            width: 25vw;
            box-sizing: border-box;
        }

        .form-group{
            display: flex;
            /* align-items: center; */
            justify-content: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Employee Attendance Reports</h1>
            <form action="dailyReport.jsp" method="post" class="form-group">
                <div class="button-container1">
                	<input type="hidden" name="employeeName" value="<%= request.getParameter("employeeName") %>">
                    <input type="date" class="input-box" id="dayInput" placeholder="Enter Day" name = "date">
                    <button type="submit" class="button">Daily Report</button>
                </div>
            </form>
            <form action="weeklyReport.jsp" method="post" class="form-group">
                <div class="button-container2">
                	<input type="hidden" name="employeeName" value="<%= request.getParameter("employeeName") %>">
                    <input type="week" class="input-box" id="weekInput" placeholder="Enter Week">
                    <button type="submit" class="button">Weekly Report</button>

                </div>
            </form>

            <form action="monthlyReport.jsp" method="post" class="form-group">
                <div class="button-container3">
                	<input type="hidden" name="employeeName" value="<%= request.getParameter("employeeName") %>">
                    <input type="month" class="input-box" id="monthInput" placeholder="Enter Month" name = "month">
                    <button type="submit" class="button">Monthly Report</button>
                </div>
            </form>
            <form action="yearlyReport.jsp" method="post" class="form-group">
                <div class="button-container4">
                	<input type="hidden" name="employeeName" value="<%= request.getParameter("employeeName") %>">
                    <input type="text" class="input-box" id="yearInput" placeholder="Enter Year" style="width: 26vw;" name = "year">
                    <button type="submit" class="button">Yearly Report</button>
                </div>
            </form>
    </div>
</body>
</html>
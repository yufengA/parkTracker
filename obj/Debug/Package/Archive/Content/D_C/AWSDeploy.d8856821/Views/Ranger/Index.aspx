﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import namespace="SEP_ASS3"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Index</title>
<script src="/jquery/jquery1.7.js" type="text/javascript"></script>
<script src="/jquery/block.js" type="text/javascript"></script>
<script src="/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="/bootstrap/css/bootstrap.css" rel="stylesheet">

<link href="../../css/ranger_system.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form action="/Ranger/SetSAREmailAddress" class="offset12" style="padding-top:30px;">
    <input type="email" name="SAREmailAddress" />
    <input type="submit" value="Set SAR Email" class="btn"/>
    </form>

    <div class="main">
    <a id="view_all_btn" href="/Ranger/AllTracks" style="margin-bottom:30px;">View Tracks</a>
    <a id="view_all_btn" href="/Ranger/AllVisitors">View All Visitors</a>
   
          <table id="all_visitor_list" style="margin-top:30px;">
          <tr>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Address</th>
          <th>Contact Number</th>
          <th>Started Time</th>
          <th>Purposed End Time</th>
          <th>isoverdue</th>
          <th>SEND</th>
          </tr> 
          <% foreach (visitor V in (List<visitor>) ViewData["Visitors"])
           { %>
          <tr>
          <td><%=V.firstName %></td>
          <td><%=V.lastName %></td>
          <td><%=V.address %></td>
          <td><%=V.contactNumber %></td>
          <td><%=V.group_visitor.startTime %></td>
          <td><%=V.group_visitor.endTime%></td>
          <td><%=V.isoverdue %></td>
          <td><% if(!(Boolean) V.mailSent){ %><a href="/Ranger/SendReport?GroupID=<%=V.group_visitor.group_id %>">Send Report</a>
          <%}else{ %>
          Mail Sent
          <%} %></td>
          </tr>
                   
        <%} %>     
          </table>
    </div>

</body>
</html>

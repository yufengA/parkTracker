<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import namespace="SEP_ASS3"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Index</title>
<script src="/jquery/jquery1.7.js" type="text/javascript"></script>
<script src="/jquery/block.js" type="text/javascript"></script>
<script src="/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="/bootstrap/css/bootstrap.css" rel="stylesheet">

<link href="../../css/ranger_system.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <div class="main">
    <a id="view_all_btn" href="/Ranger">Back</a>
   
          <table style="margin-top:30px;" border="1">
          <tr>
          <th>Track ID</th>
          <th>Track Starting Point</th>
          <th>Track Destination</th>
          <th>Track Visited Times</th>
          <th>Number of People overdued </th>
          <th>Duration</th>
          </tr> 
          <% foreach (track T in (List<track>)ViewData["Tracks"])
           { %>
          <tr align="center">
          <td><%=T.ID%></td>
          <td><%=T.startPoint%></td>
          <td><%=T.destination %></td>
          <td><%=T.visitedTime%></td>
          <td><%=T.overdueTime %></td> 
          <td><%=T.duration %></td>
          </tr>             
        <%} %>     
          </table>
    </div>

</body>
</html>

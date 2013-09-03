<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link href="../../css/ranger_system.css" rel="stylesheet" type="text/css" />

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Login</title>
<script src="/jquery/jquery1.7.js" type="text/javascript"></script>
<script src="/jquery/block.js" type="text/javascript"></script>
<script src="/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="/css/visitor_system.css" rel="stylesheet">
<script src="../../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</head>
<body>
     <div class="main" id="admin_login">
     <h1>Ranger System</h1>
     <div class="login_form_comtaner">
     <form action="/Ranger/Login" method="post" id="admin_login_form">
    <table>
                    <caption><h4 style="color:Black;"><%=ViewData["Error"] %></h4></caption>
						<tr>
							<td>Ranger ID</td>
							<td><input type="text" name="RangerID"
								value="1" class="required digits"><span class="small-error"></span></td>
						</tr>
						<tr>
							<td>Password</td>
							<td><input type="password" name="Password"
								value="123"/><span></span></td>
						</tr>
     </table>
                        <input type="submit" class="btn" value="Login">
                        </form>
                        </div>
    </div>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $("#admin_login_form").validate({
            success: "vaild",
            submitHandler: function () {
                form.submit();
            }
        });
    });

</script>
<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SignOut</title>
<script src="/jquery/jquery1.7.js" type="text/javascript"></script>
<script src="/jquery/block.js" type="text/javascript"></script>
<script src="/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="../../css/visitor_system.css" rel="stylesheet" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"
	type="text/javascript"></script>
<link href="/bootstrap/css/bootstrap.css" rel="stylesheet">

    <script src="../../Scripts/jquery.validate.min.js" type="text/javascript"></script>


<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css">
</head>
<body>
    <div class="main">
    <h4 class="sign_out_title">please enter your details to sign out</h4>
    <div class="sign_out_form_container">
    <form action="/Visitor/SignOut" method="post" id="sign_out_form">
    <table>
                    <caption><%=ViewData["Error"] %></caption>
						<tr>
							<td>First Name</td>
							<td><input type="text" name="firstName"
								value="" class="required"><span class="small-error"></span></td>
						</tr>
						<tr>
							<td>Last Name</td>
							<td><input type="text" name="lastName"
								value="" class="required"><span></span></td>
						</tr>
						<tr>
							<td>PhoneNumber</td>
							<td><input type="text" name="phoneNumber"
								value="" class="required digits"><span></span>
							</td>
						</tr>                      
						<tr>
							<td>Date of Birth</td>
							<td><input type="text" name="dob" id="date_field" placeholder="click to pick date"
								readonly="readonly" class="required"><span></span></td>
						</tr>
    </table>
                        <input type="submit" class="btn btn-primary" value="Sign Out" />
    </form>
    <a href="/Visitor" class="btn btn-primary offset7">Back</a>
    </div>
    </div>
</body>
<script type="text/javascript">
    $(document).ready(function () {

        $("#date_field").datepicker({
            dateFormat: "yy-mm-dd",
            yearRange: '1940:2010',
            changeYear: true
        });
        $("span").attr("class", "small-error");
        $("span").css({
            'padding-left': '10px'
        })


        $("#sign_out_form").validate({
            success: "vaild",
            submitHandler: function () {
                form.submit();
            }
        });
    });

</script>
</html>

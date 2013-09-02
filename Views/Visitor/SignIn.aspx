<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome the to the Coogee park</title>
<script src="/jquery/jquery1.7.js" type="text/javascript"></script>
<script src="/jquery/block.js" type="text/javascript"></script>
<script src="/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../../Scripts/jquery.validate.js" type="text/javascript"></script>
<link href="../../css/visitor_system.css" rel="stylesheet" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"
	type="text/javascript"></script>
<link href="/bootstrap/css/bootstrap.css" rel="stylesheet">




<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css">
</head>
<body>
<div class="main">
<h2 class="remain_people"><span class="red"> <%=Session["GroupNumber"] %> </span> person remaining to sign in</h2>
    <div class="signin_form">
        <form action="/Visitor/SignIn"  onsubmit="return check()" method="post" id="sign_in_form">               
					        <table>
                            <!--<caption><%=ViewData["Error"] %></caption>-->
						        <tr>
							        <td>First Name</td>
							        <td><input type="text" name="firstName"
								        value=""  class="required"><span class="small-error"></span></td>
						        </tr>
						        <tr>
							        <td>Last Name</td>
							        <td><input type="text" name="lastName"
								        value="" class="required"><span></span></td>
						        </tr>
						        <tr>
							        <td>Email Address</td>
							        <td><input type="email" name="emailAddress"
								        value="" class="required"><span></span>
							        </td>
						        </tr>
                                <tr>
							        <td>Address</td>
							        <td><input type="text" name="address"
								        value="" class="required"><span></span>
							        </td>
						        </tr>

                                <tr>
							        <td>Contact Number</td>
							        <td><input type="text" name="contactNumber"
								        value="" class="required digits"><span></span>
							        </td>
						        </tr>
						        <tr>
							        <td>Date of Birth</td>
							        <td><input type="text" name="dob" id="date_field" placeholder="click to pick date"
								        readonly="readonly" class="required"><span></span></td>
						        </tr>
						        <tr>
							        <td>Medical Details</td>
							        <td><% if (Int32.Parse(Session["TotalDuration"].ToString()) > 24)
                      { %><textarea name="medicalDetails" class="required"></textarea><span></span>
							            <%}
                      else
                      { %>
                                        <textarea name="medicalDetails" ></textarea><span></span>
                                        <%} %>
                                    </td>
						        </tr>
					        </table>
					        <center>
                            <a href="/Visitor" class="btn btn-primary">Cancel</a>
                            <% if (((int)Session["GroupNumber"]) > 1)
                               {%>
						        <input type="submit" class="btn btn-primary" value="Register!">
                                <%}
                               else
                               { %>
                              <input type="submit" class="btn btn-primary" value="Complete!">
                                <%} %>
					        </center>
				        </form>
                </div>
</div>
</body>
<script type="text/javascript">
    function check() {
        $("td span").empty();
        if ($("#password1").val() != $("#password2").val()) {
            $("#password1,#password2")
					.after(
							"<span class='small-error'>Two passwords are different</span>");
            return false;
        }
        return true;
    }
    $(document).ready(function () {

        $("#date_field").datepicker({
            dateFormat: "yy-mm-dd",
            yearRange: '1940:2010',
            changeYear: true
        });
        //$("span").attr("class", "small-error");
       // $("span").css({
        //    'padding-left': '10px'
        // })

        $("#sign_in_form").validate({
            success: "vaild",
            submitHandler: function () {
                alert("Sign In Successed");
                form.submit();
            }
        });
    });

</script>
</html>

<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to the the Coogee park</title>
<script src="/jquery/jquery1.7.js" type="text/javascript"></script>
<script src="/jquery/block.js" type="text/javascript"></script>
<script src="/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="/css/visitor_system.css" rel="stylesheet">
<script>

    $(document).ready(function () {
        $('#sign_in_button').click(function () {
            $.blockUI({
                message: $('#visitor-number-form'),
                css: {
                    cursor: "auto",
                    background: "rgba(0,0,0,0.8)"
                },
                overlayCSS: {
                    cursor: 'default'
                }
            });

            $('.blockOverlay').attr('title', 'Click to unblock').click($.unblockUI);
        });

        $("#single_radio").click(function () {
            $("#visitor_num").hide();
            $("#visitor_num").val("1");
        });

        $("#group_radio").click(function () {
            $("#visitor_num").show();
            $("#visitor_num").val("3");
        });

        $("#group_radio").attr('checked', false);
        $("#single_radio").attr('checked', true);

        $(".close_button").click($.unblockUI);

        $("#visitor_num_form").submit(function () {
            reg = /^[0-9]*[1-9][0-9]*$/;
            if (!reg.test($("#visitor_num").val())) {
                alert("Invalid Number");
                return false;
            }
        })
    });



    $.blockUI({ message: '<h1><img src="busy.gif" /> Just a moment...</h1>' });
</script>	
</head>
<body>
<div class="row-fluid"><div class="span2 offset8"><a href="/Ranger">Ranger Sign In</a></div></div>
<section class="main">
	<header class="index">Visitor System<a class="helper" href="#"></a></header>
	<section id="main_selection">
		<div id="sign_in_button"><a href="javascript:void(0);">Sign In</a></div>
		<div id="sign_out_button"><a href="/Visitor/SignOut">Sign Out</a></div>
	</section>	
</section>

<div id="visitor-number-form" title="Single Or Group?">
    <div class="close_button"></div>
    
    <form action="/Visitor/SignIn" method="post" id="visitor_num_form" >
    <table>
    <tr><td><h3>Pleased enter how many visitors in your group</h3></td></tr>
   <tr align="center"><td><input class="offset2" type="radio" name="visitor_type" value="single" id="single_radio" checked="checked" />Single</td></tr> 
		 <tr align="center"><td><input type="radio" class="offset2" name="visitor_type" value="group" id="group_radio">Group </td></tr>
		 <tr><td align="center"><input type="text" value="1" placeholder="How many visitor?" id="visitor_num" name="visitor_num" style="display:none" pa></td></tr>  		
		 <tr><td><input type="submit" value="Next" class="btn offset1"></td></tr>
        </table>
    </form>
   
</div>
</body>
</html>
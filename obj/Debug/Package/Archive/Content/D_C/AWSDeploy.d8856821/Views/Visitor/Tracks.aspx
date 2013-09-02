<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome the the coggee park</title>
<script src="/jquery/jquery1.7.js" type="text/javascript"></script>
<script src="/jquery/block.js" type="text/javascript"></script>
<script src="/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="../../css/visitor_system.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Tracks</title>
</head>
<body>

    <div class="main" id="tracks_form">
         <div class="confirm">
            <h4 id="totalDuration"></h4>
            <form action="/Visitor/SignIn" onsubmit="recoverData()" method="post">
            <select name="track0" id="track0">
            </select>
            <input type="hidden" name="totalDuration" />
            <input type="submit" class="btn" value="Confirm and Proceed" style="float:right; margin-right:20px;"/>
            </form>
        </div>

        <div class="add_track" >
            <button class="btn" onclick="appendNewTrack()">Add New Track</button><br /><br />
            <button class="btn offset5" onclick="reset()">Replan My Route</button>
            <a href="/Visitor" class="btn btn-primary">Cancel</a>
        </div>
          <img src="../../imgs/Map.png" width="100%" />
    </div>
  
  
<script type="text/javascript">
    var totalTracks = 0;
    var totalDuration = 0;
    var baseDuration = 0;
    var newDuration = 0;
    var trackDurations = new Array();
    $(document).ready(function () {
        setDefaultTracks();
        $("select").live("change", function () {
            if ($(this).attr("id") == "track0") {
                baseDuration = $(this).find("option:selected").attr("class");
                totalDuration = $(this).find("option:selected").attr("class");
            }
            else
                newDuration = $(this).find("option:selected").attr("class"); ;

            updateDuration();
        });
       
    });
    function setDefaultTracks() {
        $.ajax({
            url: "/Visitor/AllTracks",
            type: "get",
            dataType: "xml",
            success: function (xmlData) {
                $(xmlData).find("track").each(function (i) {
                    if (i == 0) {
                        baseDuration = $(this).find("duration").text();
                        totalDuration = $(this).find("duration").text();
                    }
                    $("#track0").append("<option class='" + $(this).find("duration").text() + "' value='" + $(this).find("ID").text() + "'>From " + $(this).find("startPoint").text() + " to " + $(this).find("destination").text() + "</option>");
                });
                updateDuration();
            }
        });
    }
    function appendNewTrack() {
        trackDurations.push(newDuration);
        var sourceID = $("#track" + totalTracks).val();
        totalDuration = parseInt(newDuration) + parseInt(totalDuration);
        $.ajax({
            url: "/Visitor/FollowingTracks?SourceID=" + sourceID,
            type: "get",
            dataType: "xml",
            success: function (xmlData) {
                $("#track" + totalTracks).attr("disabled", "disabled");
                totalTracks++;
                $("#track" + (totalTracks - 1)).after("</br><select id='track" + totalTracks + "' name='track" + totalTracks + "'></select>");
                
                $(xmlData).find("track").each(function (i) {
                    if (i == 0)
                       newDuration = $(this).find("duration").text();
                    $("#track" + totalTracks).append("<option  class='" + $(this).find("duration").text() + "' value='" + $(this).find("ID").text() + "'>From " + $(this).find("startPoint").text() + " to " + $(this).find("destination").text() + " </option>");
                });
                updateDuration();
            }
        });
    }
    function reset() {
        totalDuration = baseDuration;
        newDuration = 0;
        totalTracks = 0;
        $("select[id!='track0'],confirm br").remove();
        $("#track0").removeAttr("disabled");
        updateDuration();
    }
    function updateDuration() {
        //alert(newDuration);
        var hour = parseInt(newDuration) + parseInt(totalDuration) > 1 ? " hours" : " hour";
        $("#totalDuration").html("Total duration of your track is <span class='red'>" + (parseInt(totalDuration) + parseInt(newDuration) ) + hour)+"</span>";
        $("input[name='totalDuration']").val((parseInt(newDuration) + parseInt(totalDuration)));
    }
    function recoverData() {
        $("select").removeAttr("disabled");
    }

    function deleteOne() {
        if (totalTracks>0) {
            $("#track" + totalTracks).remove();
            totalTracks--;
            $("#track" + totalTracks).removeAttr("disabled");
            var lastID = $("select[id^='track']").length;
 
            updateDuration();
        }
    }
</script> 
</body>

</html>

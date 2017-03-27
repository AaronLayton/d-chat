<%
if session("U_Name")="" then response.redirect("default.asp")
%>
<html>

<head>
<meta http-equiv="Content-Language" content="en-gb">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>indaGalaxy.co.uk Chat V2.0</title>

<style type="text/css">
<!-- 
input { border: 1px solid #494949; background-color: #080808; color: silver; }
textarea {border: 1px solid #494949; background-color: #080808; color: silver; }


 
body
{scrollbar-face-color: #202020; 
scrollbar-shadow-color: #202020; 
scrollbar-highlight-color: #202020; 
scrollbar-3dlight-color: #000000; 
scrollbar-darkshadow-color: #000000; 
scrollbar-track-color: #202020; 
scrollbar-arrow-color: #000000}
-->
</style>

<script>
var Old_recieved = ""
xmlhttp=false;
/*@cc_on @*/
/*@if (@_jscript_version >= 5)
// JScript gives us Conditional compilation, we can cope with old IE versions.
// and security blocked creation of the objects.
 try {
  xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
 } catch (e) {
  try {
   xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  } catch (E) {
   xmlhttp = false;
  }
 }
@end @*/
if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
  xmlhttp = new XMLHttpRequest();
}

function getIt() {

Stamp = new Date();
 xmlhttp.open("GET", "update.asp?time=" + Stamp + "&U_Name=<%=session("U_Name")%>",true);
 xmlhttp.onreadystatechange=function() {
  if (xmlhttp.readyState==4) {
  
	var rText = xmlhttp.responseText
	var rText = rText.split("!#!");
   	sort_users(rText[0])
   	sort_messages(rText[1])
   
   }
 }
 xmlhttp.send(null)
 xmlhttp.close
 setTimeout("getIt()", 1000);
}

function sort_messages(my_messages) {
	
	if ((my_messages=="") || (my_messages==null)) {
  		alert("Error, Messages were not passed!");
	} else if (my_messages.indexOf("^#^")== -1) {
  		frames[0].document.body.innerHTML = my_messages
  	} else {
  		var temp_message = ""
  		var temp_old = frames[0].document.body.innerHTML
		var mes_array=my_messages.split("^#^");
		var part_num=0;
		while (part_num < mes_array.length) {
			if (Old_recieved.indexOf(mes_array[part_num])== -1) {
				temp_message = temp_message + mes_array[part_num] + "<br>"
			}
  			part_num+=1;
  		}
  		if (temp_message!="") {
  			frames[0].document.body.innerHTML = frames[0].document.body.innerHTML + temp_message	
  		}
  	}
  	Old_recieved = my_messages
}

function sort_users(my_users) {
	frames[1].document.body.innerHTML = ""
	if ((my_users=="") || (my_users==null)) {
  		alert("Error! No data returned. Please report!");
	} else if (my_users.indexOf("^#^")== -1) {
  		frames[1].document.body.innerHTML = my_users
  	} else {
		var user_array=my_users.split("^#^");
		var part_num=0;
		while (part_num < user_array.length) {
			frames[1].document.body.innerHTML = frames[1].document.body.innerHTML + user_array[part_num] + "<br>";
  			part_num+=1;
  		}
	}
}

function sendIt() {
Stamp = new Date();
 xmlhttp.open("GET", "update.asp?M_send="+document.getElementById("message").value+"&time=" + Stamp,true);
 document.getElementById("message").value = ""
 document.getElementById("message").focus()
 xmlhttp.onreadystatechange=function() {
  if (xmlhttp.readyState==4) {
  
  }
 }
 xmlhttp.send(null)
 xmlhttp.close
}
</script>

</head>

<body bgcolor="#000000" text="#6A6A6A" onload="getIt()">

<table border="0" width="100%" height="340" cellspacing="0" cellpadding="0">
	<tr>
		<td height="100%" width="100%">
		
		
		
		
		<table border="0" width="100%" height="40" cellspacing="0" cellpadding="0" style="padding-left: 0; padding-right: 0; padding-top: 0; padding-bottom: 10px">
	<tr>
		<td height="60" width="100%" align="left" valign="top">
		
		<table border="0" width="100%" height="40" cellspacing="0" cellpadding="0">
			<tr>
				<td height="20" width="12">
					<img border="0" src="http://www.indagalaxy.co.uk/images/Cleft.gif" width="12" height="20"></td>
				<td height="20" width="100%" background="http://www.indagalaxy.co.uk/images/Bar1.jpg">
				<b><font face="Verdana" size="1">Message History - idG Clan Chat v2.0</font></b></td>
				<td height="20" width="12">
					<img border="0" src="http://www.indagalaxy.co.uk/images/Cright.gif" width="12" height="20"></td>
			</tr>
			<tr>
				<td height="40" width="983" colspan="3" style="border-bottom:1px solid #444444; border-left:1px solid #444444; border-right:1px solid #444444; " bgcolor="#212121" align="left" valign="top">
					
				<iframe width=100% height=280 id=mbox style="border-style: solid; border-width: 0" name="mbox" src="pages/chat.htm" FRAMEBORDER=0></iframe>
					
				</td>
			</tr>
			</table>
		
		</td>
	</tr>
</table>

		
		
		
		</td>
		<td height="300" width="180">
		
		
		
		<table border="0" width="180" height="300" cellspacing="0" cellpadding="0" style="padding-left: 10px; padding-right: 0; padding-top: 0; padding-bottom: 10px">
	<tr>
		<td height="60" width="100%" align="left" valign="top">
		
		<table border="0" width="100%" height="40" cellspacing="0" cellpadding="0">
			<tr>
				<td height="20" width="12">
					<img border="0" src="http://www.indagalaxy.co.uk/images/Cleft.gif" width="12" height="20"></td>
				<td height="20" width="100%" background="http://www.indagalaxy.co.uk/images/Bar1.jpg"><b>
				<font face="Verdana" size="1" color="#595959">Who's Online!!</font></b></td>
				<td height="20" width="12">
					<img border="0" src="http://www.indagalaxy.co.uk/images/Cright.gif" width="12" height="20"></td>
			</tr>
			<tr>
				<td height="40" width="100%" colspan="3" style="border-bottom:1px solid #444444; border-left:1px solid #444444; border-right:1px solid #444444; " bgcolor="#212121" align="left" valign="top">
					
					<iframe width=100% height=280 id=blist style="border-style: solid; border-width: 0" name="blist" src="pages/users.htm" FRAMEBORDER=0></iframe>
					
				</td>
			</tr>
			</table>
		
		</td>
	</tr>
</table>
		
		
		
		
		
		</td>
	</tr>
	<tr>
		<td height="40" width="100%" colspan="2">
		
<table border="0" width="100%" height="40" cellspacing="0" cellpadding="0" style="padding-left: 0; padding-right: 0; padding-top: 0; padding-bottom: 10px">
	<tr>
		<td height="60" width="100%" align="left" valign="top">
		
		<table border="0" width="100%" height="40" cellspacing="0" cellpadding="0">
			<tr>
				<td height="20" width="12">
					<img border="0" src="http://www.indagalaxy.co.uk/images/Cleft.gif" width="12" height="20"></td>
				<td height="20" width="100%" background="http://www.indagalaxy.co.uk/images/Bar1.jpg">
				<b><font face="Verdana" size="1">Type your message here...</font></b></td>
				<td height="20" width="12">
					<img border="0" src="http://www.indagalaxy.co.uk/images/Cright.gif" width="12" height="20"></td>
			</tr>
			<tr>
				<td height="10" width="100%" colspan="3" style="border-bottom:1px solid #444444; border-left:1px solid #444444; border-right:1px solid #444444; " bgcolor="#212121" align="left" valign="top">
					
					<table border="0" width="100%" height="100%" cellspacing="0" cellpadding="0" style="padding: 3px">
						<tr>
							<td height="100%" width="100%" align="left" valign="top">
							<table border="0" width="100%" height="25" cellspacing="0" cellpadding="0">
								<tr>
									<td height="25" width="100%">
										<input type="text" name="message" id=message size="76" style="width: 100%; height: 25; vertical-align:text-bottom"></td>
									<td height="25" width="10">
										<input type="submit" value="Send" name="B1" style="width: 74; height: 25" onclick="sendIt()"></td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
					
				</td>
			</tr>
			</table>
		
		</td>
	</tr>
</table>

		
		
		</td>
	</tr>
</table>

</body>

</html>
<%
Session.Timeout=1
set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.Jet.OLEDB.4.0"
conn.Open server.mappath("chat.mdb")

if request.form("T1")<>"" then
	set User = server.createobject("ADODB.recordset")
	User.Open "SELECT * FROM Members WHERE U_Name='" & request.form("T1") & "'",conn
	
	if NOT User.EOF then 
		sql="UPDATE Members SET "
  		sql=sql & "U_Time='" & Now() & "',"
  		sql=sql & "U_Ip='" & Request.ServerVariables("REMOTE_ADDR") & "'"
  		sql=sql & " WHERE U_Name='" & request.form("T1") & "'"
  		
  		conn.Execute sql
  	else
  		sql = "INSERT INTO Members (U_Name,U_Time,U_Ip) VALUES ('" & request.form("T1") & "','" & Now() & "','" & Request.ServerVariables("REMOTE_ADDR") & "')"
  		conn.Execute sql
  	end if
  	
	Session("U_Name")=request.form("T1")
  	Response.Redirect("chat.asp")
end if
%>
<html>

<head>
<meta http-equiv="Content-Language" content="en-gb">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>New Page 1</title>

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

body
{
	font-family: Verdana; font-size: 10px
}
-->
</style>

</head>

<body bgcolor="#212121" text="#6A6A6A">


<center>
<table border="0" width="300" height="40" cellspacing="0" cellpadding="0" style="padding-left: 0; padding-right: 0; padding-top: 0; padding-bottom: 10px">
	<tr>
		<td height="60" width="100%" align="left" valign="top">
		
		<table border="0" width="100%" height="40" cellspacing="0" cellpadding="0">
			<tr>
				<td height="20" width="12">
					<img border="0" src="http://www.indagalaxy.co.uk/images/Cleft.gif" width="12" height="20"></td>
				<td height="20" width="100%" background="http://www.indagalaxy.co.uk/images/Bar1.jpg"><b>
				<font face="Verdana" size="1">idG Chat v2 Login!</font></b></td>
				<td height="20" width="12">
					<img border="0" src="http://www.indagalaxy.co.uk/images/Cright.gif" width="12" height="20"></td>
			</tr>
			<tr>
				<td height="40" width="100%" colspan="3" style="border-bottom:1px solid #444444; border-left:1px solid #444444; border-right:1px solid #444444; " bgcolor="#212121" align="left" valign="top">
					
					<table border="0" width="100%" height="100%" cellspacing="0" cellpadding="0" style="padding: 10px">
						<tr>
							<td height="100%" width="100%" align="left" valign="top"><font face="Verdana" size="1">
							Please enter the username you wish to use.</font><br>
							<center>
							
							<form method="POST" action="default.asp">
								<input type="text" name="T1" size="20">
								<input type="submit" value="Submit" name="B1">
							</form>
							
							</center>
							</td>
						</tr>
					</table>
					
				</td>
			</tr>
			</table>
		
		</td>
	</tr>
</table>
</center>


</body>

</html>
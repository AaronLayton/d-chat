<!--#include file ="functions.asp"-->
<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.Jet.OLEDB.4.0"
conn.Open server.mappath("chat.mdb")
	
if request.querystring("M_send")<>"" then
	sql="INSERT INTO Messages (M_message,M_time,M_user)"
	sql=sql & " VALUES "
	sql=sql & "('" & replace(Request.querystring("M_send"),"'","&#39;") & "',"
	sql=sql & "'" & Now() & "',"
	sql=sql & "'" & Session("U_Name") & "')"

on error resume next
conn.Execute sql,recaffected
if err<>0 then
  Response.Write("No update permissions!")
else 
  Response.Write("<h3>" & recaffected & " record added</h3>")
end if

end if
	
	if request.querystring("U_Name")<>"" then
		sql="UPDATE Members SET "
  		sql=sql & "U_Time='" & Now() & "',"
  		sql=sql & "U_Ip='" & Request.ServerVariables("REMOTE_ADDR") & "'"
  		sql=sql & " WHERE U_Name='" & request.querystring("U_Name") & "'"
  		
  		conn.Execute sql
  	end if

	set User = server.createobject("ADODB.recordset")
	User.Open "SELECT * FROM Members ORDER BY U_Name",conn
	isuser=false
	firstname=true
	do until User.EOF
		if DateDiff("s",User("U_Time"),Now())<5 then
			if NOT firstname then
				response.write "^#^"
			end if
			response.write User("U_Name")
			isuser=true
			firstname=false
		end if
	user.movenext
	loop
	if NOT isuser then response.write "No Users Online!"
	User.close
	set user = Nothing
	
	response.write "!#!"
	
	set chat = server.createobject("ADODB.recordset")
	chat.Open "SELECT * FROM Messages ORDER BY id DESC",conn
	temp = ""
	x=0
	firstmessage=true
	do until x=10 OR chat.EOF
		if NOT firstmessage then
			temp="^#^" & temp
		end if
		temp = "<font color='#FFFFFF'><b>" & chat("M_User") & "</b></font> - " & BBCode(replace(chat("M_message"),"&#39;","'")) & temp
		firstmessage=false
		x=x+1
	chat.movenext
	loop
	response.write temp
	if x=0 then response.write "No Chat messages!"
	
	chat.close
	set chat = Nothing
	conn.close
	set conn = Nothing
%>
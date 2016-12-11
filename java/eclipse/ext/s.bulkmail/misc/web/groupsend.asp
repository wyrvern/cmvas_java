<!--#include virtual="/iso2000gs/adovbs.inc"-->
<!--#include virtual="/iso2000gs/groupsendb.inc"-->
<!--#include virtual="/iso2000gs/groupdec.inc"-->
<%
'...................................................................
select case request("action")
'...................................................................
case "+ group"
group_buffer = request.form("contact_select") & ":" & request.form("groupspin")

case "- group"
group_buffer = request.form("contact_select") & ":" & request.form("groupspin")
jt = request.form("contact_select")
jo = ""
group_buffer = replace(group_buffer, jt, jo)

case "clear groups"
group_buffer = ""
'...................................................................
case "find selection"

if request.form("datei") = "on" then
 response.write("date_search")
 datei = true
end if

group_buffer = request.form("contact_select") & ":" & request.form("groupspin")
 jump = ":"
 chip = split(group_buffer, ":")

for each jump in chip
 if jump <> "" then
  if datei = true then
   sqlgroup = "select * from " & jump & ""
   else
   fday   = request.form("fday")
   fmonth = request.form("fmonth")
   fyear  = request.form("fyear")
   tday   = request.form("tday")
   tmonth = request.form("tmonth")
   tyear  = request.form("tyear")
   sqlgroup = "select * from " & jump & " where day >= '" & fday & "' and month >= '" & fmonth & "' and year >= fyear and day <= tday month <= tmonth year <= tyear"
   response.write(sqlgroup)
  end if
  set rs = conn.execute(sqlgroup)%>

<table border='0' cellpadding='0' width='543' style='font-size:10pt; font-family:Verdana; font-weight:bold; text-decoration:none'>
 <tr><td bgcolor="black"><form method='post' action='groupsend.asp'>
<table border='0' cellpadding='3' width='543' style='font-size:10pt; font-family:Verdana; font-weight:bold; text-decoration:none'>
 <tr><td bgcolor="A6D39A">
<%response.write(sqlgroup) & "<br>"%>
</td></tr></table>
</td></tr></table>

<table border="0" cellpadding="0" width="540" style='font-size:10pt; font-family:Verdana; font-weight:bold; text-decoration:none'><tr><td bgcolor="Black">
<table border="1" cellpadding="0" cellpadding="0" width="540" style='font-size:10pt; font-family:Verdana; font-weight:bold; text-decoration:none'>
 <tr><td bgcolor="A6D39A" colspan="25">
 <b>group listing</b></td></tr>
 <tr><td bgcolor="green" colspan="6">
 <input type="submit" name="action" value='select all'>
 <input type="submit" name="action" value='select none'>
 </td></tr>
 </td></tr>
 <tr>
 <td bgcolor="green"><b>choose</b></td>
 <td bgcolor="green"><b>state</b></td>
 <td bgcolor="green"><b>id</b></td>
 <td bgcolor="green"><b>email address</b></td>
 <td bgcolor="green"><b>change</b></td>
 </tr>
 <tr><td><input type='checkbox' name='stype' value='<%=jump%>'></td></tr>
<%'<!-- -----------------------------------------------------
'  referral resellers
'---------------------------------------------------------->
%>
<%if jump = "ReferralResellers" then%>
<% do while not rs.eof %>
<%
shift = false
if instr(wholea, rs("rremail")) <> 0 then
  shift = true
end if

if shift = false then
%><input type=hidden name=checkf value=<%=wholea%>><%
%>
 <tr>
 <td bgcolor="white"><input type="checkbox" name="group_id" value="<%= rs("rrid")%>"></b></td>
 <td bgcolor="white"><input type="checkbox" name="state<%= rs("rrid")%>"  value="<%= rs("state")%>" <%= rs("state")%>></b></td>
 <td bgcolor="white"><%= rs("rrid")%></b></td>
 <td bgcolor="white"><input type="text" name="email_address" value="<%= rs("rremail") %>"></td>
 <td bgcolor="white"><input type="submit" name="action" value="select"><input type="submit" name="action" value="deselect"></td></tr>
<%
end if

wholea = wholea & " " &_  
         wholeb & " " &_
         wholec & " " &_
         wholed & " " &_
         wholee & " " &_
         wholef & " " &_
         wholeg & " " &_
         wholeh & " " & rs("rremail")

rs.movenext
loop
%>
<%end if%>
<%'<!-- -----------------------------------------------------
'  product resellers
'---------------------------------------------------------->
%>
<%if jump = "ProductResellers" then%>
<% do while not rs.eof %>
<%
shift = false
if instr(wholeb, rs("email")) <> 0 then
  shift = true
end if

if shift = false then
%><input type=hidden name=checkf value=<%=wholeb%>><%
%>
 <tr>
 <td bgcolor="white"><input type="checkbox" name="group_id" value="<%= rs("prid")%>"></b></td>
 <td bgcolor="white"><input type="checkbox" name="state<%= rs("prid")%>"  value="<%= rs("state")%>" <%= rs("state")%>></b></td>
 <td bgcolor="white"><%= rs("prid")%></b></td>
 <td bgcolor="white"><input type="text" name="email_address" value="<%= rs("email") %>"></td>
 <td bgcolor="white"><input type="submit" name="action" value="select"><input type="submit" name="action" value="deselect"></td></tr>
<%
end if
wholeb = wholea & " " &_  
         wholeb & " " &_
         wholec & " " &_
         wholed & " " &_
         wholee & " " &_
         wholef & " " &_
         wholeg & " " &_
         wholeh & " " & rs("email")

rs.movenext
loop
%>
<%end if%>
<%'<!-- -----------------------------------------------------
'  sales
'---------------------------------------------------------->
%>
<%if jump = "Orders" then%>
<% do while not rs.eof %>
<%
shift = false
if instr(wholec, rs("customeremail")) <> 0 then
  shift = true
end if

if shift = false then
%><input type=hidden name=checkf value=<%=wholec%>><%
%>
 <tr>
 <td bgcolor="white"><input type="checkbox" name="group_id" value="<%= rs("orderid")%>"></b></td>
 <td bgcolor="white"><input type="checkbox" name="state<%= rs("orderid")%>"  value="<%= rs("state")%>" <%= rs("state")%>></b></td>
 <td bgcolor="white"><%= rs("orderid")%></b></td>
 <td bgcolor="white"><input type="text" name="email_address" value="<%= rs("customeremail") %>"></td>
 <td bgcolor="white"><input type="submit" name="action" value="select"><input type="submit" name="action" value="deselect"></td></tr>
<%
end if
wholec = wholea & " " &_  
         wholeb & " " &_
         wholec & " " &_
         wholed & " " &_
         wholee & " " &_
         wholef & " " &_
         wholeg & " " &_
         wholeh & " " & rs("customeremail")

rs.movenext
loop
%>
<%end if%>
<%'<!-- -----------------------------------------------------
'  downloads
'---------------------------------------------------------->
%>
<%if jump = "Downloads" then%>
<% do while not rs.eof %>
<%
shift = false
if instr(wholed, rs("email")) <> 0 then
  shift = true
end if

if shift = false then
%><input type=hidden name=checkf value=<%=wholed%>><%
%>
 <tr>
 <td bgcolor="white"><input type="checkbox" name="group_id" value="<%= rs("dnid")%>"></b></td>
 <td bgcolor="white"><input type="checkbox" name="state<%= rs("dnid")%>"  value="<%= rs("state")%>" <%= rs("state")%>></b></td>
 <td bgcolor="white"><%= rs("dnid")%></b></td>
 <td bgcolor="white"><input type="text" name="email_address" value="<%= rs("email") %>"></td>
 <td bgcolor="white"><input type="submit" name="action" value="select"><input type="submit" name="action" value="deselect"></td></tr>
<%
end if
wholed = wholea & " " &_  
         wholeb & " " &_
         wholec & " " &_
         wholed & " " &_
         wholee & " " &_
         wholef & " " &_
         wholeg & " " &_
         wholeh & " " & rs("email")
rs.movenext
loop
%>
<%end if%>

<%'<!-- -----------------------------------------------------
'  referred customers
'---------------------------------------------------------->
%>
<%if jump = "ReferredCustomers" then%>
<% do while not rs.eof %>
<%
shift = false
if instr(wholee, rs("rcemail")) <> 0 then
  shift = true
end if

if shift = false then
%><input type=hidden name=checkf value=<%=wholee%>><%
%>
 <tr>
 <td bgcolor="white"><input type="checkbox" name="group_id" value="<%= rs("rcid")%>"></b></td>
 <td bgcolor="white"><input type="checkbox" name="state<%= rs("rcid")%>" value="<%= rs("state")%>" <%= rs("state")%>></b></td>
 <td bgcolor="white"><%= rs("rcid")%></b></td>
 <td bgcolor="white"><input type="text" name="email_address" value="<%= rs("rcemail") %>"></td>
 <td bgcolor="white"><input type="submit" name="action" value="select"><input type="submit" name="action" value="deselect"></td></tr>
<%
end if
wholee = wholea & " " &_  
         wholeb & " " &_
         wholec & " " &_
         wholed & " " &_
         wholee & " " &_
         wholef & " " &_
         wholeg & " " &_
         wholeh & " " & rs("rcemail")
rs.movenext
loop
%>
<%end if%>
<%'<!-- -----------------------------------------------------
'  software support
'---------------------------------------------------------->
%>
<%if jump = "SSContracts" then%>
<% do while not rs.eof %>
<%
shift = false
if instr(wholef, rs("customeremail")) <> 0 then
  shift = true
end if

if shift = false then
%><input type=hidden name=checkf value=<%=wholef%>><%
%>
 <tr>
 <td bgcolor="white"><input type="checkbox" name="group_id" value="<%= rs("ssid")%>"></b></td>
 <td bgcolor="white"><input type="checkbox" name="state<%= rs("ssid")%>" value="<%= rs("state")%>" <%= rs("state")%>></b></td>
 <td bgcolor="white"><%= rs("ssid")%></b></td>
 <td bgcolor="white"><input type="text" name="email_address" value="<%= rs("customeremail") %>"></td>
 <td bgcolor="white"><input type="submit" name="action" value="select"><input type="submit" name="action" value="deselect"></td></tr>
<%
end if

wholef = wholea & " " &_  
         wholeb & " " &_
         wholec & " " &_
         wholed & " " &_
         wholee & " " &_
         wholef & " " &_
         wholeg & " " &_
         wholeh & " " & rs("customeremail")

rs.movenext
loop
%>
<%end if%>

<%'<!-- -----------------------------------------------------
'  assessments
'---------------------------------------------------------->
%>
<%if jump = "Assess" then%>
<% do while not rs.eof %>
<%
shift = false
if instr(wholeg, rs("email")) <> 0 then
  shift = true
end if

if shift = false then
%><input type=hidden name=checkf value=<%=wholeg%>><%
%>
 <tr>
 <td bgcolor="white"><input type="checkbox" name="group_id" value="<%= rs("assessid")%>"></b></td>
 <td bgcolor="white"><input type="checkbox" name="state<%= rs("assessid")%>" value="<%= rs("state")%>" <%= rs("state")%>></b></td>
 <td bgcolor="white"><%= rs("assessid")%></b></td>
 <td bgcolor="white"><input type="text" name="email_address" value="<%= rs("email") %>"></td>
 <td bgcolor="white"><input type="submit" name="action" value="select"><input type="submit" name="action" value="deselect"></td></tr>
<%
end if
wholeg = wholea & " " &_  
         wholeb & " " &_
         wholec & " " &_
         wholed & " " &_
         wholee & " " &_
         wholef & " " &_
         wholeg & " " &_
         wholeh & " " & rs("email")
rs.movenext
loop
%>
<%end if%>

<%'<!-- -----------------------------------------------------
'  registered users
'---------------------------------------------------------->
%>
<%if jump = "emailm_book" then%>
<% do while not rs.eof %>
<%
shift = false
if instr(wholeh, rs("email_address")) <> 0 then
  shift = true
end if

if shift = false then
%><input type=hidden name=checkf value=<%=wholeh%>><%
%>
 <tr>
 <td bgcolor="white"><input type="checkbox" name="group_id" value="<%= rs("book_id")%>"></b></td>
 <td bgcolor="white"><input type="checkbox" name="state<%= rs("book_id")%>" value="<%= rs("state")%>" <%= rs("state")%>></b></td>
 <td bgcolor="white"><%= rs("book_id")%></b></td>
 <td bgcolor="white"><input type="text" name="email_address" value="<%= rs("email_address") %>"></td>
 <td bgcolor="white"><input type="submit" name="action" value="select"><input type="submit" name="action" value="deselect"></td></tr>
<%
end if
wholeh = wholea & " " &_  
         wholeb & " " &_
         wholec & " " &_
         wholed & " " &_
         wholee & " " &_
         wholef & " " &_
         wholeg & " " &_
         wholeh & " " & rs("email_address")

rs.movenext
loop
%>
<%end if%>

</td></tr></table>
</td></tr></table>

<%
end if
next
'...................................................................
case "select"
state_pos = request.form("stype")

if instr(state_pos, "ProductResellers") = 1 then
 state_chk = request.form("group_id")
 state_var = "checked"
 state_chg = "update ProductResellers set state = '" & state_var & "' where prid = '" & state_chk & "'"
 conn.execute(state_chg)
end if

if instr(state_pos, "ReferralResellers") = 1 then
 state_chk = request.form("group_id")
 state_var = "checked"
 state_chg = "update ReferralResellers set state = '" & state_var & "' where rrid = '" & state_chk & "'"
 conn.execute(state_chg)
end if

if instr(state_pos, "ReferredCustomers") = 1 then
 state_chk = request.form("group_id")
 state_var = "checked"
 state_chg = "update ReferredCustomers set state = '" & state_var & "' where rcid = '" & state_chk & "'"
 conn.execute(state_chg)
end if

if instr(state_pos, "Orders") = 1 then
 state_chk = request.form("group_id")
 state_var = "checked"
 state_chg = "update Orders set state = '" & state_var & "' where orderid = '" & state_chk & "'"
 conn.execute(state_chg)
response.write(state_chg)
end if

if instr(state_pos, "Downloads") = 1 then
 state_chk = request.form("group_id")
 state_var = "checked"
 state_chg = "update Downloads set state = '" & state_var & "' where dnid = '" & state_chk & "'"
 conn.execute(state_chg)
end if

if instr(state_pos, "SSContracts") = 1 then
 state_chk = request.form("group_id")
 state_var = "checked"
 state_chg = "update SSContracts set state = '" & state_var & "' where ssid = '" & state_chk & "'"
 conn.execute(state_chg)
end if

if instr(state_pos, "Assess") = 1 then
 state_chk = request.form("group_id")
 state_var = "checked"
 state_chg = "update Assess set state = '" & state_var & "' where assessid = '" & state_chk & "'"
 conn.execute(state_chg)
end if

if instr(state_pos, "emailm_book") = 1 then
 state_chk = request.form("group_id")
 state_var = "checked"
 state_chg = "update emailm_book set state = '" & state_var & "' where book_id = '" & state_chk & "'"
 conn.execute(state_chg)
end if

case "deselect"
state_pos = request.form("stype")

if instr(state_pos, "ProductResellers") = 1 then
 state_chk = request.form("group_id")
 state_var = " "
 state_chg = "update ProductResellers set state = '" & state_var & "' where prid = '" & state_chk & "'"
 conn.execute(state_chg)
end if

if instr(state_pos, "ReferralResellers") = 1 then
 state_chk = request.form("group_id")
 state_var = " "
 state_chg = "update ReferralResellers set state = '" & state_var & "' where rrid = '" & state_chk & "'"
 conn.execute(state_chg)
end if

if instr(state_pos, "ReferredCustomers") = 1 then
 state_chk = request.form("group_id")
 state_var = " "
 state_chg = "update ReferredCustomers set state = '" & state_var & "' where rcid = '" & state_chk & "'"
 conn.execute(state_chg)
end if

if instr(state_pos, "Orders") = 1 then
 state_chk = request.form("group_id")
 state_var = " "
 state_chg = "update Orders set state = '" & state_var & "' where orderid = '" & state_chk & "'"
 conn.execute(state_chg)
end if

if instr(state_pos, "Downloads") = 1 then
 state_chk = request.form("group_id")
 state_var = " "
 state_chg = "update Downloads set state = '" & state_var & "' where dnid = '" & state_chk & "'"
 conn.execute(state_chg)
end if

if instr(state_pos, "SSContracts") = 1 then
 state_chk = request.form("group_id")
 state_var = " "
 state_chg = "update SSContracts set state = '" & state_var & "' where ssid = '" & state_chk & "'"
 conn.execute(state_chg)
end if

if instr(state_pos, "Assess") = 1 then
 state_chk = request.form("group_id")
 state_var = " "
 state_chg = "update Assess set state = '" & state_var & "' where assessid = '" & state_chk & "'"
 conn.execute(state_chg)
end if

if instr(state_pos, "emailm_book") = 1 then
 state_chk = request.form("group_id")
 state_var = " "
 state_chg = "update emailm_book set state = '" & state_var & "' where book_id = '" & state_chk & "'"
 conn.execute(state_chg)
end if

'...................................................................
case "select all"
state_pos = request.form("stype")

if instr(state_pos, "ProductResellers") = 1 then
state_var = "checked"
s_spi = "select * from ProductResellers"
set rsi = conn.execute(s_spi)
s_all = "update ProductResellers set state = '" & state_var & "'"
do while not rsi.eof
conn.execute(s_all)
rsi.movenext
loop
end if

if instr(state_pos, "ReferralResellers") = 1 then
state_var = "checked"
s_spi = "select * from ReferralResellers"
set rsi = conn.execute(s_spi)
s_all = "update ReferralResellers set state = '" & state_var & "'"
do while not rsi.eof
conn.execute(s_all)
rsi.movenext
loop
end if

if instr(state_pos, "ReferredCustomers") = 1 then
state_var = "checked"
s_spi = "select * from ReferredCustomers"
set rsi = conn.execute(s_spi)
s_all = "update ReferredCustomers set state = '" & state_var & "'"
do while not rsi.eof
conn.execute(s_all)
rsi.movenext
loop
end if

if instr(state_pos, "Orders") = 1 then
state_var = "checked"
s_spi = "select * from Orders"
set rsi = conn.execute(s_spi)
s_all = "update Orders set state = '" & state_var & "'"
do while not rsi.eof
conn.execute(s_all)
rsi.movenext
loop
end if

if instr(state_pos, "Downloads") = 1 then
state_var = "checked"
s_spi = "select * from Downloads"
set rsi = conn.execute(s_spi)
s_all = "update Downloads set state = '" & state_var & "'"
do while not rsi.eof
conn.execute(s_all)
rsi.movenext
loop
end if

if instr(state_pos, "SSContracts") = 1 then
state_var = "checked"
s_spi = "select * from SSContracts"
set rsi = conn.execute(s_spi)
s_all = "update SSContracts set state = '" & state_var & "'"
do while not rsi.eof
conn.execute(s_all)
rsi.movenext
loop
end if

if instr(state_pos, "Assess") = 1 then
state_var = "checked"
s_spi = "select * from Assess"
set rsi = conn.execute(s_spi)
s_all = "update Assess set state = '" & state_var & "'"
do while not rsi.eof
conn.execute(s_all)
rsi.movenext
loop
end if

if instr(state_pos, "emailm_book") = 1 then
state_var = "checked"
s_spi = "select * from emailm_book"
set rsi = conn.execute(s_spi)
s_all = "update emailm_book set state = '" & state_var & "'"
do while not rsi.eof
conn.execute(s_all)
rsi.movenext
loop
end if

'...................................................................
case "select none"
state_pos = request.form("stype")

if instr(state_pos, "ProductResellers") = 1 then
state_var = " "
s_spi = "select * from ProductResellers"
set rsi = conn.execute(s_spi)
s_all = "update ProductResellers set state = '" & state_var & "'"
do while not rsi.eof
conn.execute(s_all)
rsi.movenext
loop
end if

if instr(state_pos, "ReferralResellers") = 1 then
state_var = " "
s_spi = "select * from ReferralResellers"
set rsi = conn.execute(s_spi)
s_all = "update ReferralResellers set state = '" & state_var & "'"
do while not rsi.eof
conn.execute(s_all)
rsi.movenext
loop
end if

if instr(state_pos, "ReferredCustomers") = 1 then
state_var = " "
s_spi = "select * from ReferredCustomers"
set rsi = conn.execute(s_spi)
s_all = "update ReferredCustomers set state = '" & state_var & "'"
do while not rsi.eof
conn.execute(s_all)
rsi.movenext
loop
end if

if instr(state_pos, "Orders") = 1 then
state_var = " "
s_spi = "select * from Orders"
set rsi = conn.execute(s_spi)
s_all = "update Orders set state = '" & state_var & "'"
do while not rsi.eof
conn.execute(s_all)
rsi.movenext
loop
end if

if instr(state_pos, "Downloads") = 1 then
state_var = " "
s_spi = "select * from Downloads"
set rsi = conn.execute(s_spi)
s_all = "update Downloads set state = '" & state_var & "'"
do while not rsi.eof
conn.execute(s_all)
rsi.movenext
loop
end if

if instr(state_pos, "SSContracts") = 1 then
state_var = " "
s_spi = "select * from SSContracts"
set rsi = conn.execute(s_spi)
s_all = "update SSContracts set state = '" & state_var & "'"
do while not rsi.eof
conn.execute(s_all)
rsi.movenext
loop
end if

if instr(state_pos, "Assess") = 1 then
state_var = " "
s_spi = "select * from Assess"
set rsi = conn.execute(s_spi)
s_all = "update Assess set state = '" & state_var & "'"
do while not rsi.eof
conn.execute(s_all)
rsi.movenext
loop
end if

if instr(state_pos, "emailm_book") = 1 then
state_var = " "
s_spi = "select * from emailm_book"
set rsi = conn.execute(s_spi)
s_all = "update emailm_book set state = '" & state_var & "'"
do while not rsi.eof
conn.execute(s_all)
rsi.movenext
loop
end if
'...................................................................
case "send"

check = request.form("stype")

if instr(check, "ProductResellers") = 1 then
sqlgroup = "select * from ProductResellers where state = '" & "Checked" &"'"
set rss = conn.execute(sqlgroup)
response.write(sqlgroup)
do while not rss.eof
set isoMail = server.createobject("SMTPsvg.Mailer")
isoMail.RemoteHost   = "mail.isotop.net"
isoMail.FromName     = "isotop Global Partnership"
isoMail.FromAddress  = request.form("mFrom")
isoMail.AddRecipient request.form("mName"), rss("email")
isoMail.Subject      = "ISO14001 Implementation Software"
isoMail.BodyText     = request.form("mMessage")
if not isoMail.SendMail then
 mailsend = False
else
 mailsend = True
end if
set isoMail = Nothing
rss.movenext
loop
end if

if instr(check, "ReferralResellers") = 1 then
sqlgroup = "select * from ReferralResellers where state = '" & "Checked" &"'"
set rss = conn.execute(sqlgroup)
response.write(sqlgroup)
do while not rss.eof
set isoMail = server.createobject("SMTPsvg.Mailer")
isoMail.RemoteHost   = "mail.isotop.net"
isoMail.FromName     = "isotop Global Partnership"
isoMail.FromAddress  = request.form("mFrom")
isoMail.AddRecipient request.form("mName"), rss("rremail")
isoMail.Subject      = "ISO14001 Implementation Software"
isoMail.BodyText     = request.form("mMessage")
if not isoMail.SendMail then
 mailsend = False
else
 mailsend = True
end if
set isoMail = Nothing
rss.movenext
loop
end if

if instr(check, "ReferredCustomers") = 1 then
sqlgroup = "select * from ReferredCustomers where state = '" & "Checked" &"'"
set rss = conn.execute(sqlgroup)
response.write(sqlgroup)
do while not rss.eof
set isoMail = server.createobject("SMTPsvg.Mailer")
isoMail.RemoteHost   = "mail.isotop.net"
isoMail.FromName     = "isotop Global Partnership"
isoMail.FromAddress  = request.form("mFrom")
isoMail.AddRecipient request.form("mName"), rss("rcemail")
isoMail.Subject      = "ISO14001 Implementation Software"
isoMail.BodyText     = request.form("mMessage")
if not isoMail.SendMail then
 mailsend = False
else
 mailsend = True
end if
set isoMail = Nothing
rss.movenext
loop
end if

if instr(check, "Downloads") = 1 then
sqlgroup = "select * from Downloads where state = '" & "Checked" &"'"
set rss = conn.execute(sqlgroup)
response.write(sqlgroup)
do while not rss.eof
set isoMail = server.createobject("SMTPsvg.Mailer")
isoMail.RemoteHost   = "mail.isotop.net"
isoMail.FromName     = "isotop Global Partnership"
isoMail.FromAddress  = request.form("mFrom")
isoMail.AddRecipient request.form("mName"), rss("email")
isoMail.Subject      = "ISO14001 Implementation Software"
isoMail.BodyText     = request.form("mMessage")
if not isoMail.SendMail then
 mailsend = False
else
 mailsend = True
end if
set isoMail = Nothing
rss.movenext
loop
end if

if instr(check, "Orders") = 1 then
sqlgroup = "select * from Orders where state = '" & "Checked" &"'"
set rss = conn.execute(sqlgroup)
response.write(sqlgroup)
do while not rss.eof
set isoMail = server.createobject("SMTPsvg.Mailer")
isoMail.RemoteHost   = "mail.isotop.net"
isoMail.FromName     = "isotop Global Partnership"
isoMail.FromAddress  = request.form("mFrom")
isoMail.AddRecipient request.form("mName"), rss("customeremail")
isoMail.Subject      = "ISO14001 Implementation Software"
isoMail.BodyText     = request.form("mMessage")
if not isoMail.SendMail then
 mailsend = False
else
 mailsend = True
end if
set isoMail = Nothing
rss.movenext
loop
end if

if instr(check, "SSContracts") = 1 then
sqlgroup = "select * from SSContracts where state = '" & "Checked" &"'"
set rss = conn.execute(sqlgroup)
response.write(sqlgroup)
do while not rss.eof
set isoMail = server.createobject("SMTPsvg.Mailer")
isoMail.RemoteHost   = "mail.isotop.net"
isoMail.FromName     = "isotop Global Partnership"
isoMail.FromAddress  = request.form("mFrom")
isoMail.AddRecipient request.form("mName"), rss("customeremail")
isoMail.Subject      = "ISO14001 Implementation Software"
isoMail.BodyText     = request.form("mMessage")
if not isoMail.SendMail then
 mailsend = False
else
 mailsend = True
end if
set isoMail = Nothing
rss.movenext
loop
end if

if instr(check, "Assess") = 1 then
sqlgroup = "select * from Assess where state = '" & "Checked" &"'"
set rss = conn.execute(sqlgroup)
response.write(sqlgroup)
do while not rss.eof
set isoMail = server.createobject("SMTPsvg.Mailer")
isoMail.RemoteHost   = "mail.isotop.net"
isoMail.FromName     = "isotop Global Partnership"
isoMail.FromAddress  = request.form("mFrom")
isoMail.AddRecipient request.form("mName"), rss("email")
isoMail.Subject      = "ISO14001 Implementation Software"
isoMail.BodyText     = request.form("mMessage")
if not isoMail.SendMail then
 mailsend = False
else
 mailsend = True
end if
set isoMail = Nothing
rss.movenext
loop
end if

if instr(check, "emailm_book") = 1 then
sqlgroup = "select * from emailm_book where state = '" & "Checked" &"'"
set rss = conn.execute(sqlgroup)
response.write(sqlgroup)
do while not rss.eof
set isoMail = server.createobject("SMTPsvg.Mailer")
isoMail.RemoteHost   = "mail.isotop.net"
isoMail.FromName     = "isotop Global Partnership"
isoMail.FromAddress  = request.form("mFrom")
isoMail.AddRecipient request.form("mName"), rss("email")
isoMail.Subject      = "ISO14001 Implementation Software"
isoMail.BodyText     = request.form("mMessage")
if not isoMail.SendMail then
 mailsend = False
else
 mailsend = True
end if
set isoMail = Nothing
rss.movenext
loop
end if

end select
'...................................................................
%>
<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
<xsl:template match="/">

<table border='0' cellpadding='0' width='543' style='font-size:10pt; font-family:Verdana; font-weight:bold; text-decoration:none'>
 <tr><td bgcolor="white"><form method='post' action='groupsend.asp'>
<table border='0' cellpadding='3' width='543' style='font-size:10pt; font-family:Verdana; font-weight:bold; text-decoration:none'>

 <tr><td bgcolor="A6D39A">
 <img src='logo-small.gif' width='100' height='25' border="1"></td>
 <td bgcolor="A6D39A">
 <b>mail2000 - groupsend/bulk mail <b><br>
 <a href="groupsend.asp"><b>return</b></a>
 </td></tr>

 <tr><td bgcolor="green">Group Selection :<br>
 </td><td bgcolor="green">
 <input type=hidden name=groupspin value=<%= group_buffer %>>
 <select name="contact_select">
 <option value="">select</option>
 <option value="Orders">sales</option>
 <option value="Downloads">downloaders</option>
 <option value="ReferralResellers">referral resellers</option>
 <option value="ProductResellers">product resellers</option>
 <option value="ReferredCustomers">referred customers</option>
 <option value="SSContracts">software support</option>
 <option value="Assess">assessments</option>
 <option value="emailm_book">registered users</option>
 </select><br>
 <input type="submit" name="action" value="+ group">
 <input type="submit" name="action" value="- group">
 <input type="submit" name="action" value="clear groups"><br>
 </td></tr></table>

 <table border=1 cellpadding=0 cellspacing=0>
 <tr><td bgcolor=white colspan=6>search by date :
 <input type=checkbox name=datei><br></td></tr>
 <tr><td bgcolor=white>
 <b>fDay :</b></td><td bgcolor=white><input type=text size=10 name=fday></input><br>
 <td bgcolor=white><b>fMonth :</b></td><td bgcolor=white><input type=text size=10 name=fmonth></input><br>
 <td bgcolor=white><b>fYear :</b></td><td bgcolor=white><input type=text size=10 name=fyear></input><br></td></tr>
 <tr>
 <td bgcolor=white><b>tDay :</b></td><td bgcolor=white><input type=text size=10 name="tday"></input><br>
 <td bgcolor=white><b>tMonth :</b></td><td bgcolor=white><input type=text size=10 name="tmonth"></input><br>
 <td bgcolor=white><b>tYear :</b></td><td bgcolor=white><input type=text size=10 name="tyear"></input><br>
 </td></tr>
 <tr><td bgcolor=white colspan=6>
 <center>
 <b>format : dd , mm, yy</b> (ie, 04,08,1999)</center>
 </td></tr></table>

 <table><tr>
 <td bgcolor="A6D39A"><input type="submit" name="action" value="find selection"></td>
 <td bgcolor="A6D39A"><font color=red><% response.write(group_buffer) %><%=jonesey%></b></font><br></td>
 </tr>

 <tr><td bgcolor="green">To :</td><td bgcolor="green"><input type="Text" name="mName" SIZE="40"></td></tr>
 <tr><td bgcolor="green">Subject :</td><td bgcolor="green"><input type="Text" name="mSubject" SIZE="40">
 <input type="Hidden" name="group_type" VALUE="dynamic"></td></tr>
 <tr><td bgcolor="green">From :</td><td bgcolor="green">
 <select name="mFrom">
 <option selected value="Sales">Sales</option>
 <option value="Information">Information</option>
 <option value="ReferralReseller">Referral Reseller</option>
 <option value="Productreseller">Product Reseller</option>
 <option value="SoftwareSupport">Software Support</option>
 <option value="ISO14001Support">ISO14001 Support</option>
 <option value="Suggestions">Suggestions</option>
 <option value="Support">Support</option>
 <option value="MarkS">MarkS</option>
 <option value="Aron.Mb">Aron.Mb</option>
 <option value="MartinB">MartinB</option>
 <option value="Harry.Jb">Harry.Jb</option>
 <option value="B.Foreman">B.Foreman</option>
 <option value="G.Turner">G.Turner</option>
 <option value="T.Ritter">T.Ritter</option>
 </select><BR></td></tr>

 <tr><td bgcolor="green" COLSPAN="2">Message :<br>
 <textarea name="mMessage" COLS="64" ROWS="10" wrap></textarea>

<tr><td bgcolor="green" colspan="6">
<input type="submit" name="action" value='send'>
</td></tr>
</td></tr></table>
</td></tr></table>


</xsl:template>
</xsl:stylesheet>


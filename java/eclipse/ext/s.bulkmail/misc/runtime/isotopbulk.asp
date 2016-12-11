<!--#include virtual="/isotop-bulk/adovbs.inc"-->
<!--#include virtual="/isotop-bulk/groupsendb.inc"-->
<%
'...................................................................
select case request("action")
'...................................................................
case "+ group"
group_buffer  = request.form("contact_select") & ":" & request.form("groupspin")
group_choice  = request.form("contact_select")
group_history = request.form("selection")

'..............................................................Sales
if group_choice = "Orders" then
rsconn = "select * from Orders"
set rs = conn.execute(rsconn)
do while not rs.eof
shift  = false
if instr(whole, rs("customeremail")) <> 0 Then
  shift = true
end If

if shift = false then
mainStr = mainStr & "$" & rs("customeremail")
end if

whole = whole & " " & rs("customeremail")

rs.movenext
loop
end if

mainStr = mainStr & group_history

'..............................................................Down
if group_choice = "Downloads" then
rsconn = "select * from Downloads"
set rs = conn.execute(rsconn)
do while not rs.eof
shift  = false
if instr(whole, rs("email")) <> 0 Then
  shift = true
end If

if shift = false then
mainStr = mainStr & "$" & rs("email")
end if

whole = whole & " " & rs("email")

rs.movenext
loop
end if

mainStr = mainStr & group_history

'..............................................................Pr
if group_choice = "ProductResellers" then
rsconn = "select * from ProductResellers"
set rs = conn.execute(rsconn)
do while not rs.eof
shift  = false
if instr(whole, rs("email")) <> 0 Then
  shift = true
end If

if shift = false then
mainStr = mainStr & "$" & rs("email")
end if

whole = whole & " " & rs("email")

rs.movenext
loop
end if

mainStr = mainStr & group_history

'..............................................................Rc
if group_choice = "ReferredCustomers" then
rsconn = "select * from ReferredCustomers"
set rs = conn.execute(rsconn)
do while not rs.eof
shift  = false
if instr(whole, rs("rcemail")) <> 0 Then
  shift = true
end If

if shift = false then
mainStr = mainStr & "$" & rs("rcemail")
end if

whole = whole & " " & rs("rcemail")

rs.movenext
loop
end if

mainStr = mainStr & group_history
'..............................................................Rc
if group_choice = "ReferralResellers" then
rsconn = "select * from ReferralResellers"
set rs = conn.execute(rsconn)
do while not rs.eof
shift  = false
if instr(whole, rs("rremail")) <> 0 Then
  shift = true
end If

if shift = false then
mainStr = mainStr & "$" & rs("rremail")
end if

whole = whole & " " & rs("rremail")

rs.movenext
loop
end if

mainStr = mainStr & group_history
'..............................................................Sc
if group_choice = "SSContracts" then
rsconn = "select * from SSContracts"
set rs = conn.execute(rsconn)
do while not rs.eof
shift  = false
if instr(whole, rs("customeremail")) <> 0 Then
  shift = true
end If

if shift = false then
mainStr = mainStr & "$" & rs("customeremail")
end if

whole = whole & " " & rs("customeremail")

rs.movenext
loop
end if

mainStr = mainStr & group_history
'..............................................................Assess
if group_choice = "Assess" then
rsconn = "select * from Assess"
set rs = conn.execute(rsconn)
do while not rs.eof
shift  = false
if instr(whole, rs("email")) <> 0 Then
  shift = true
end If

if shift = false then
mainStr = mainStr & "$" & rs("email")
end if

whole = whole & " " & rs("email")

rs.movenext
loop
end if

mainStr = mainStr & group_history
'..............................................................Users
if group_choice = "emailm_book" then
rsconn = "select * from emailm_book"
set rs = conn.execute(rsconn)
do while not rs.eof
shift  = false
if instr(whole, rs("email_address")) <> 0 Then
  shift = true
end If

if shift = false then
mainStr = mainStr & "$" & rs("email_address")
end if

whole = whole & " " & rs("email_address")

rs.movenext
loop
end if

mainStr = mainStr & group_history
'..............................................................
case "- group"
group_buffer = request.form("contact_select") & ":" & request.form("groupspin")
jt = request.form("contact_select")
jo = ""
group_buffer = replace(group_buffer, jt, jo)

group_choice  = request.form("contact_select")
group_history = request.form("selection")
group_split   = split(group_history, "$")

'..............................................................Sales
If group_choice = "Orders" Then
rsconn = "select * from Orders"
set rs = conn.execute(rsconn)

srchPatrn = "$"
srchRepla = ""

do while not rs.eof
for each srchPatrn in group_split

if srchPatrn = rs("customeremail") then
group_history = replace(group_history, "$" & rs("customeremail"), srchRepla)
end if

next
rs.movenext
loop

mainStr = group_history
end if
'..............................................................Down
If group_choice = "Downloads" Then
rsconn = "select * from Downloads"
set rs = conn.execute(rsconn)

srchPatrn = "$"
srchRepla = ""

do while not rs.eof
for each srchPatrn in group_split

if srchPatrn = rs("email") then
group_history = replace(group_history, "$" & rs("email"), srchRepla)
end if

next
rs.movenext
loop

mainStr = group_history
end if
'.............................................................Rr
If group_choice = "ReferralResellers" Then
rsconn = "select * from ReferralResellers"
set rs = conn.execute(rsconn)

srchPatrn = "$"
srchRepla = ""

do while not rs.eof
for each srchPatrn in group_split

if srchPatrn = rs("rremail") then
group_history = replace(group_history, "$" & rs("rremail"), srchRepla)
end if

next
rs.movenext
loop

mainStr = group_history
end if
'..............................................................Pr
If group_choice = "ProductResellers" Then
rsconn = "select * from ProductResellers"
set rs = conn.execute(rsconn)

srchPatrn = "$"
srchRepla = ""

do while not rs.eof
for each srchPatrn in group_split

if srchPatrn = rs("email") then
group_history = replace(group_history, "$" & rs("email"), srchRepla)
end if

next
rs.movenext
loop

mainStr = group_history
end if
'..............................................................Rc
If group_choice = "ReferredCustomers" Then
rsconn = "select * from ReferredCustomers"
set rs = conn.execute(rsconn)

srchPatrn = "$"
srchRepla = ""

do while not rs.eof
for each srchPatrn in group_split

if srchPatrn = rs("rcemail") then
group_history = replace(group_history, "$" & rs("rcemail"), srchRepla)
end if

next
rs.movenext
loop

mainStr = group_history
end if
'..............................................................Sc
If group_choice = "SSContracts" Then
rsconn = "select * from SSContracts"
set rs = conn.execute(rsconn)

srchPatrn = "$"
srchRepla = ""

do while not rs.eof
for each srchPatrn in group_split

if srchPatrn = rs("customeremail") then
group_history = replace(group_history, "$" & rs("customeremail"), srchRepla)
end if

next
rs.movenext
loop

mainStr = group_history
end if
'..............................................................Assess
If group_choice = "Assess" Then
rsconn = "select * from Assess"
set rs = conn.execute(rsconn)

srchPatrn = "$"
srchRepla = ""

do while not rs.eof
for each srchPatrn in group_split

if srchPatrn = rs("email") then
group_history = replace(group_history, "$" & rs("email"), srchRepla)
end if

next
rs.movenext
loop

mainStr = group_history
end if
'..............................................................Users
If group_choice = "emailm_book" Then
rsconn = "select * from emailm_book"
set rs = conn.execute(rsconn)

srchPatrn = "$"
srchRepla = ""

do while not rs.eof
for each srchPatrn in group_split

if srchPatrn = rs("email_address") then
group_history = replace(group_history, "$" & rs("email_address"), srchRepla)
end if

next
rs.movenext
loop

mainStr = group_history
end if
'...................................................................
case "duplicates"

group_buffer  = request.form("contact_select") & ":" & request.form("groupspin")
group_choice  = request.form("contact_select")
group_history = request.form("selection")
group_first   = split(group_history, "$")

srchPatrn = "$"
srchRepla = ""

for each srchPatrn in group_first
shift = false
if instr(whole, srchPatrn) <> 0 Then
  shift = true
end if
if shift = true then
group_history = replace(group_history, "$" & srchPatrn, srchRepla)
end if
whole = whole & " " & srchPatrn
next

mainStr = group_history

'...................................................................
case "clear groups"

group_buffer = ""
'...................................................................
case "send"

group_buffer  = request.form("contact_select") & ":" & request.form("groupspin")
group_choice  = request.form("contact_select")
group_history = request.form("selection")
group_split   = split(group_history, "$")

srchPatrn = "$"

for each srchPatrn in group_split

set isoMail = server.createobject("SMTPsvg.Mailer")
isoMail.RemoteHost   = "mail.isotop.net"
isoMail.FromName     = "isotop Global Partnership"
isoMail.FromAddress  = request.form("mFrom")
isoMail.AddRecipient request.form("mName"), srchPatrn
isoMail.Subject      = request.form("mSubject")
isoMail.BodyText     = request.form("mMessage")

if not isoMail.SendMail then
mailsend = false
mailReason = mailReason & "<br>" & "Mail status : " & isoMail.Response
else
mailReason = mailReason & "<br>" & "Mail status : " & isoMail.Response
mailsend = true
end if

set isoMail = Nothing
next

dim fs, a
set fs = createobject("scripting.filesystemobject")
set a  = fs.createtextfile(server.mappath ("logs") & ("\log" & date & ".html"), True)
a.WriteLine(mailReason)
a.Close

end select
'...................................................................
%>
<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
<xsl:template match="/">

<table border='0' cellpadding='0' width='543' style='font-size:10pt; font-family:Verdana; font-weight:bold; text-decoration:none'>
 <tr><td bgcolor="white"><form method='post' action='isotopBulk.asp'>
<table border='0' cellpadding='3' width='543' style='font-size:10pt; font-family:Verdana; font-weight:bold; text-decoration:none'>
<input type=hidden name=selection value=<%=mainStr%>>
 <tr><td bgcolor="gray">
 <img src='logo-small.gif' width='100' height='25' border="1"></td>
 <td bgcolor="gray">
 <b>isotopMail - bulk mail <b><br>
 <a href="groupsend.asp"><b>return</b></a>
 </td></tr>

 <tr><td bgcolor="cococo">Group Selection :<br>
 </td><td bgcolor="cococo">
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
 <input type="submit" name="action" value="clear groups">
 <input type="submit" name="action" value="duplicates">
 </tr><tr>
 <td bgcolor="cococo" colspan=2><font color=red><% response.write(group_buffer) %><%=jonesey%></b></font><br></td>
 </tr>

 <tr><td bgcolor="gray">To :</td><td bgcolor="cococo"><input type="Text" name="mName" SIZE="40"></td></tr>
 <tr><td bgcolor="gray">Subject :</td><td bgcolor="cococo"><input type="Text" name="mSubject" SIZE="40">
 <input type="Hidden" name="group_type" VALUE="dynamic"></td></tr>
 <tr><td bgcolor="gray">From :</td><td bgcolor="cococo">
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

 <tr><td bgcolor="gray" COLSPAN="2">Message :<br>
 <textarea name="mMessage" COLS="64" ROWS="10" wrap></textarea>

<tr><td bgcolor="gray" colspan="6">
<input type="submit" name="action" value='send'>
</td></tr>
</td></tr></table>
</td></tr></table>


</xsl:template>
</xsl:stylesheet>


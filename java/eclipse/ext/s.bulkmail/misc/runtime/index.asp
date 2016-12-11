<!--#include virtual="/isotop-bulk/adovbs.inc"-->
<!--#include virtual="/isotop-bulk/groupsendb.inc"-->
<%
selectType = request("type")

if selectType = "datetype" then
'------------------------------------
'desc  : date/db/parser for iis4+
'author: null@null.co.za
'files : index.asp
'date  : 02/14/2001
'------------------------------------
dim formDay, formMonth, formYear
dim dbDate, shString

SformMonth = request("sformmonth")
SformDay   = request("sformday")
SformYear  = request("sformyear")

TformMonth = request("tformmonth")
TformDay   = request("tformday")
TformYear  = request("tformyear")

section    = request("section")

set conn  = server.createobject("adodb.connection")
conn.open "database=isotop;uid=isotop;pwd=isotop;dsn=isotop"
sqlopen   = "select * from " & section & ""
set rs    = conn.execute(sqlopen)

do while not rs.eof
    if section = "Assess"            then 
    dbDate = rs("currentdate")
elseif section = "Downloads"         then
    dbDate = rs("currentdate")
elseif section = "Orders"            then
    dbDate = rs("date")
elseif section = "ProductResellers"  then
    dbDate = rs("currentdate")
elseif section = "ReferralResellers" then
    dbDate = rs("rrcurrentdate")
elseif section = "ReferredCustomers" then
    dbDate = rs("rccurrentdate")
elseif section = "SSContracts"       then
    dbDate = rs("date")
end if
shString  = "/"
dbSplit   = split(dbDate, shString)
dCheck    = 0
dRem      = ""

for each shString in dbSplit
dCheck    = dCheck + 1
if dCheck = 1 then dVar   = "Month"    end if
if dCheck = 2 then dVar   = "Day" end if
if dCheck = 3 then dVar   = "Year" end if

varYear     = datepart("yyyy", date)

if shString = 1 then shString = "01" end if
if shString = 2 then shString = "02" end if
if shString = 3 then shString = "03" end if
if shString = 4 then shString = "04" end if
if shString = 5 then shString = "05" end if
if shString = 6 then shString = "06" end if
if shString = 7 then shString = "07" end if
if shString = 8 then shString = "08" end if
if shString = 9 then shString = "09" end if

if shString = 99 and dCheck = 3 then shString = "1999" end if
if shString = 00 and dCheck = 3 then shString = "2000" end if
if shString = 01 and dCheck = 3 then shString = "2001" end if

if dCheck = 1 then dMonth = shString end if
if dCheck = 2 then dDay   = shString end if
if dCheck = 3 then dYear  = shString end if

if dCheck = 3 then

if dMonth >= SformMonth and dMonth <= TformMonth and _
dDay      >= SformDay   and dDay   <= TformDay and _
dYear     >= SformYear  and dYear  <= TformYear then
dRem       = dMonth & dDay & dYear
end if

if dMonth > SformMonth and dMonth  < TformMonth and _
dYear     >= SformYear  and dYear  <= TformYear then
dRem       = dMonth & dDay & dYear
end if

if dMonth  = SformMonth and dMonth <> TformMonth and _
dDay      >= SformDay   and _
dYear     >= SformYear  and dYear  <= TformYear then
dRem       = dMonth & dDay & dYear
end if

if dMonth  = TformMonth and dMonth <> SformMonth and _
dDay      <= TformDay   and _
dYear     >= SformYear  and dYear  <= TformYear then
dRem       = dMonth & dDay & dYear
end if

end if

next

if dRem <> "" then

shift  = false

    if section = "Orders"            then
if instr(whole, rs("customeremail")) <> 0 Then
  shift = true
end If
elseif section = "Assess"            then
if instr(whole, rs("email")) <> 0 Then
  shift = true
end If
elseif section = "Downloads"         then
if instr(whole, rs("email")) <> 0 Then
  shift = true
end If
elseif section = "ProductResellers"  then
if instr(whole, rs("email")) <> 0 Then
  shift = true
end If
elseif section = "ReferralResellers" then
if instr(whole, rs("rremail")) <> 0 Then
  shift = true
end If
elseif section = "ReferredCustomers" then
if instr(whole, rs("rcemail")) <> 0 Then
  shift = true
end If
elseif section = "SSContracts"       then
if instr(whole, rs("customeremail")) <> 0 Then
  shift = true
end If
    end if

if shift = false then
set isoMail = server.createobject("SMTPsvg.Mailer")
isoMail.RemoteHost   = "mail.isotop.net"
isoMail.FromName     = "isotop Global Partnership"
isoMail.FromAddress  = request.form("mFrom")

    if section = "Orders"            then
isoMail.AddRecipient rs("firstname"), rs("customeremail")
elseif section = "Assess"            then
isoMail.AddRecipient rs("firstname"), rs("email")
elseif section = "Downloads"         then
isoMail.AddRecipient rs("firstname"), rs("email")
elseif section = "ProductResellers"  then
isoMail.AddRecipient rs("firstname"), rs("email")
elseif section = "ReferralResellers" then
isoMail.AddRecipient rs("firstname"), rs("rremail")
elseif section = "ReferredCustomers" then
isoMail.AddRecipient rs("firstname"), rs("rcemail")
elseif section = "SSContracts"       then
isoMail.AddRecipient rs("firstname"), rs("customeremail")
end if

isoMail.Subject      = request.form("mSubject")
isoMail.BodyText     = request.form("mMessage")

if not isoMail.SendMail then
mailsend = false
mailReason = mailReason & "<br><font color=red>" & "Mail status : " & isoMail.Response & ")"
else
mailReason = mailReason & "<br><font color=red>" & "Mail status : Successful)"
mailsend = true
end if
set isoMail = Nothing

end if

    if section = "Orders"            then
whole = whole & " " & rs("customeremail")
elseif section = "Assess"            then
whole = whole & " " & rs("email")
elseif section = "Downloads"         then
whole = whole & " " & rs("email")
elseif section = "ProductResellers"  then
whole = whole & " " & rs("email")
elseif section = "ReferralResellers" then
whole = whole & " " & rs("rremail")
elseif section = "ReferredCustomers" then
whole = whole & " " & rs("rcemail")
elseif section = "SSContracts"       then
whole = whole & " " & rs("customeremail")
    end if

end if
rs.movenext
loop

rs.close
conn.close

end if
%>
<%
selectType = request("type")

if selectType = "grouptype" then
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
group_split   = split(group_history, "$")

srchPatrn = "$"
srchRepla = ""

for each srchPatrn in group_split
shift = false
if instr(whole, srchPatrn) <> 0 Then
  shift = true
end if
if shift = true then
group_history = replace(group_history, "$" & srchPatrn, srchRepla)
group_history = group_history & "$" & srchPatrn
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
isoMail.AddRecipient srchPatrn, srchPatrn
isoMail.Subject      = request.form("mSubject")
isoMail.BodyText     = request.form("mMessage")

if not isoMail.SendMail then
mailsend = false
mailReason = mailReason & "<br><font color=red>" & "Mail status : (Email Address : " & srchPatrn & ")(Response:" & isoMail.Response & ")"
else
mailReason = mailReason & "<br><font color=red>" & "Mail status : (Email Address : " & srchPatrn & ")(Response: Successful)"
mailsend = true
end if

set isoMail = Nothing
next


dim fs, a
set fs = createobject("scripting.filesystemobject")
set a  = fs.opentextfile(server.mappath ("logs") & ("\log.html"), 8, True)
a.Write("#start" & date & "----------------------------------------#<br>")
a.Write(mailReason & "<br>")
a.Write("#end" & date & "------------------------------------------#<br>")
a.Close

end select
'...................................................................
end if
%>
<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
<xsl:template match="/">

<table border='0' cellpadding='0' width='543' style='font-size:10pt; font-family:Verdana; font-weight:bold; text-decoration:none'>
 <tr><td bgcolor="white"><form method='post' action='index.asp'>
<table border='0' cellpadding='3' width='543' style='font-size:10pt; font-family:Verdana; font-weight:bold; text-decoration:none'>
<input type=hidden name=selection value=<%=mainStr%>>
 <tr><td bgcolor="gray">
 <img src='logo-small.gif' width='100' height='25' border="1"></td>
 <td bgcolor="gray">
 <b>isotopMail - bulk mail <b><br>
 <a href="groupsend.asp"><b>return</b></a>
 </td></tr>

<tr><td colspan=5 bgcolor=cococo> 
Send via date : <input type=checkbox name=type value=datetype>
 <select name="section">
 <option value="">select table</option>
 <option value="Orders">sales</option>
 <option value="Downloads">downloaders</option>
 <option value="ReferralResellers">referral resellers</option>
 <option value="ProductResellers">product resellers</option>
 <option value="ReferredCustomers">referred customers</option>
 <option value="SSContracts">software support</option>
 <option value="Assess">assessments</option>
 </select><br>
<hr>
Start day : <input type=text name=sformday size=5>
Start month : <input type=text name=sformmonth size=5>
Start year : <input type=text name=sformyear size=5><br><br>
End day : <input type=text name=tformday size=5>
End month : <input type=text name=tformmonth size=5>
End year : <input type=text name=tformyear size=5><br><br>
</tr></td>

 <tr><td bgcolor="cococo">Group Selection :<br>
 </td><td bgcolor="cococo">
 Send via Group Selection : <input type=checkbox name=type value=grouptype><br>
 <input type=hidden name=groupspin value=<%= group_buffer %>>
 <select name="contact_select">
 <option value="">select table</option>
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
 <option selected value="sales@isotop.net">Sales</option>
 <option value="info@isotop.net">Information</option>
 <option value="r.reseller@isotop.net">Referral Reseller</option>
 <option value="p.reseller@isotop.net">Product Reseller</option>
 <option value="softwarecontract@isotop.net">Software Support</option>
 <option value="iso14001contract@isotop.net">ISO14001 Support</option>
 <option value="suggest@isotop.net">Suggestions</option>
 <option value="support@isotop.net">Support</option>
 <option value="marks@isotop.net">MarkS</option>
 <option value="aron.mb@isotop.net">Aron.Mb</option>
 <option value="martinb@isotop.net">MartinB</option>
 <option value="harry.jb@isotop.net">Harry.Jb</option>
 <option value="b.foreman@isotop.net">B.Foreman</option>
 <option value="g.turner@isotop.net">G.Turner</option>
 <option value="t.ritter@isotop.net">T.Ritter</option>
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



<!--#include virtual="/iso2000gs/adovbs.inc"-->
<!--#include virtual="/iso2000gs/groupsendb.inc"-->
<!--#include virtual="/iso2000gs/groupdec.inc"-->
<%
'...................................................................
select case request("action")
'...................................................................
case "+ group"
tj = request.form("tj")
ts = request.form("cselect")
ts_sql = "select * from " & ts & ""
set rs = conn.execute(ts_sql)
do while not rs.eof

if ts = "ProductResellers" or _
   ts = "Downloads" or _
   ts = "Assess" then
 tj = "$" & rs("email") & "" & tj
elseif ts = "Orders" or _
   ts = "SSContracts" then
 tj = "$" & rs("customeremail") & "" & tj
elseif ts = "ReferralResellers" then
 tj = "$" & rs("rremail") & "" & tj
elseif ts = "ReferredCustomers" then
 tj = "$" & rs("rcemail") & "" & tj
elseif ts = "emailm_book" then
 tj = "$" & rs("email_address") & "" & tj
end if

rs.movenext
loop

'...................................................................

case "- group"
ts = request.form("cselect")
tj = request.form("tj")
jump = "$"
ts_sql = "select * from " & ts & ""

set rs = conn.execute(ts_sql)
do while not rs.eof
if instr(tj, "$" & rs("email")) = 1 then
 response.write(rs("email"))
 tj = replace(tj, "$" & rs("email"), "")
end if
rs.movenext
loop

'...................................................................
case "send"

jump = "$"

for each jump in request.form("tj")
 response.write(jump & "<br>")

 set isoMail = server.createobject("SMTPsvg.Mailer")
 isoMail.RemoteHost   = "mail.isotop.net"
 isoMail.FromName     = "isotop Global Partnership"
 isoMail.FromAddress  = request.form("mFrom")
 isoMail.AddRecipient request.form("mName"), tj
 isoMail.Subject      = "ISO14001 Implementation Software"
 isoMail.BodyText     = request.form("mMessage")
 if not isoMail.SendMail then
  mailsend = False
 else
  mailsend = True
  end if
 set isoMail = Nothing
next

end select
'...................................................................
%>
<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
<xsl:template match="/">

<table border='0' cellpadding='0' width='543' style='font-size:10pt; font-family:Verdana; font-weight:bold; text-decoration:none'>
 <tr><td bgcolor="black"><form method='post' action='groupsys.asp'>
<table border='0' cellpadding='3' width='543' style='font-size:10pt; font-family:Verdana; font-weight:bold; text-decoration:none'>

 <tr><td bgcolor="cococo">
 <img src='logo-small.gif' width='100' height='25' border="1"></td>
 <td bgcolor="white">
 <b>mail2000 - groupsys/bulk mail <b>
  </td></tr>

 <tr><td bgcolor="cococo">Group Selection :<br>
 </td><td bgcolor="white">
 <input type=hidden name=tj value="<%= tj %>">
 <select name="cselect">
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
 </tr>

 <tr><td bgcolor="cococo">Subject :</td><td bgcolor="white"><input type="Text" name="mSubject" SIZE="40"></td></tr>
 <tr><td bgcolor="cococo">From :</td><td bgcolor="white">
 <select name="mFrom">
 <option selected value="sales@isotop.net">Sales</option>
 <option value="info@isotop.net">Information</option>
 <option value="r.reseller@isotop.net">Referral Reseller</option>
 <option value="p.reseller@isotop.net">Product Reseller</option>
 <option value="softwarecontract@isotop.net">Software Support</option>
 <option value="iso14001contract@isotop.net">ISO14001 Support</option>
 <option value="suggestions@isotop.net">Suggestions</option>
 <option value="support@isotop.net">Support</option>
 <option value="MarkS">MarkS</option>
 <option value="Aron.Mb">Aron.Mb</option>
 <option value="MartinB">MartinB</option>
 <option value="Harry.Jb">Harry.Jb</option>
 <option value="B.Foreman">B.Foreman</option>
 <option value="G.Turner">G.Turner</option>
 <option value="T.Ritter">T.Ritter</option>
 </select><BR></td></tr>

 <tr><td bgcolor="cococo" COLSPAN="2">Message :<br>
 <textarea name="mMessage" COLS="64" ROWS="10" wrap></textarea>

<tr><td bgcolor="cococo" colspan="6">
<input type="submit" name="action" value='send'>
</td></tr>
</td></tr></table>
</td></tr></table>


</xsl:template>
</xsl:stylesheet>


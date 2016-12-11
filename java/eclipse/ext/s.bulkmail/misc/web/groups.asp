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
case "send"

group_buffer = request.form("contact_select") & ":" & request.form("groupspin")
 jump = ":"
 chip = split(group_buffer, ":")

for each jump in chip
 if jump <> "" then
 sqlgroup = "select * from " & jump & ""
 set rs = conn.execute(sqlgroup)

 do while not rs.eof
 set isoMail = server.createobject("SMTPsvg.Mailer")
 isoMail.RemoteHost   = "mail.isotop.net"
 isoMail.FromName     = "isotop Global Partnership"
 isoMail.FromAddress  = request.form("mFrom")

if jump = "ProductResellers" or _
   jump = "Downloads" or _
   jump = "Assess" then
 isoMail.AddRecipient request.form("mName"), rs("email")
elseif jump = "ReferralResellers" then
 isoMail.AddRecipient request.form("mName"), rs("rremail")
elseif jump = "ReferredCustomers" then
 isoMail.AddRecipient request.form("mName"), rs("rcemail")
elseif jump = "Orders" or _
   jump = "SSContracts" then
 isoMail.AddRecipient request.form("mName"), rs("customeremail")
elseif jump = "emailm_book" then
 isoMail.AddRecipient request.form("mName"), rs("email_address")
end if

 isoMail.Subject      = "ISO14001 Implementation Software"
 isoMail.BodyText     = request.form("mMessage")
 if not isoMail.SendMail then
  mailsend = False
 else
  mailsend = True
  end if
 set isoMail = Nothing
 rs.movenext
 loop
end if

next

end select
'...................................................................
%>
<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
<xsl:template match="/">

<table border='0' cellpadding='0' width='543' style='font-size:10pt; font-family:Verdana; font-weight:bold; text-decoration:none'>
 <tr><td bgcolor="white"><form method='post' action='groups.asp'>
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
 <input type="submit" name="action" value="clear groups">
 </tr><tr>
 <td bgcolor="A6D39A" colspan=2><font color=red><% response.write(group_buffer) %><%=jonesey%></b></font><br></td>
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


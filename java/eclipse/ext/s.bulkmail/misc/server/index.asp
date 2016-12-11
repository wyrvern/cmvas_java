<!--#include virtual="/isotop-bulk/adovbs.inc"-->
<html>
<title>isotop Bulk Mail</title>
<table border=0 cellpadding=2 cellspacing=0><tr><td bgcolor=black>
<table border=0 cellpadding=2 cellspacing=0><tr><td bgcolor=white valign=top colspan=2>
<font face=tahoma size=3><b>isotop - server/side software ver 1.0</font>
</td></tr>
<tr><td bgcolor=white valign=top>
<object id="cmbAdd" classid="clsid:8BD21D30-EC42-11CE-9E0D-00AA006002F3" codebase="/isotop-bulk/fm20.dll" width="150" height="23"></object><br>
<object id="cmbRemove" classid="clsid:8BD21D30-EC42-11CE-9E0D-00AA006002F3" codebase="/isotop-bulk/fm20.dll" width="150" height="23"></object><br>
<object id="grdMain" classid="clsid:6262D3A0-531B-11CF-91F6-C2863C385E30" codebase="/isotop-bulk/msflxgrd.ocx" width="150" height="273"></object><br>
</td>
<td bgcolor=white valign=top>
<object id="cmdAdd" classid="clsid:D7053240-CE69-11CD-A777-00DD01143C57" codebase="/isotop-bulk/fm20.dll" width="87" height="23"></object>
<object id="cmdRemove" classid="clsid:D7053240-CE69-11CD-A777-00DD01143C57" codebase="/isotop-bulk/fm20.dll" width="87" height="23"></object>
<object id="cmdDup" classid="clsid:D7053240-CE69-11CD-A777-00DD01143C57" codebase="/isotop-bulk/fm20.dll" width="87" height="23"></object><br><br>
<font face=tahoma size=2><b>To : <object id="txtTo" classid="clsid:8BD21D10-EC42-11CE-9E0D-00AA006002F3" codebase="/isotop-bulk/fm20.dll" width="150" height="23"></object><br>
<font face=tahoma size=2><b>Subject : <object id="txtSubject" classid="clsid:8BD21D10-EC42-11CE-9E0D-00AA006002F3" codebase="/isotop-bulk/fm20.dll" width="150" height="23"></object><br>
<font face=tahoma size=2><b>From : <object id="cmbFrom" classid="clsid:8BD21D30-EC42-11CE-9E0D-00AA006002F3" codebase="/isotop-bulk/fm20.dll" width="150" height="23"></object><br><br>
<object id="txtBody" classid="clsid:8BD21D10-EC42-11CE-9E0D-00AA006002F3" codebase="/isotop-bulk/fm20.dll" width="260" height="170"></object><br>
<object id="cmdSend" classid="clsid:D7053240-CE69-11CD-A777-00DD01143C57" codebase="/isotop-bulk/fm20.dll" width="87" height="23"></object>
<object id="cmdClear" classid="clsid:D7053240-CE69-11CD-A777-00DD01143C57" codebase="/isotop-bulk/fm20.dll" width="87" height="23"></object>
</tr><tr>
<td bgcolor=white valign=top colspan=2>
<font face=tahoma size=2><b>Mail Sent : <%= mailSent %>
</td></tr></table>
</td></tr></table>
</html>

<script language="vbscript">
Public conn
Public shift
Public sendAmount

Sub window_OnLoad()

With grdMain
    .Clear
    .Rows = 2
    .Row = 0
    .Col = 0
    .ColAlignment(0) = flexAlignLeft
    .Text = "Email Address"
    .ColWidth(0) = "2150"
End With

grdMain.Cols = "1"
grdMain.FixedCols = "0"
grdMain.FixedRows = "1"

cmdAdd.Caption = "Add"
cmdAdd.Font.Name = "MS Sans Serif"
cmdAdd.Font.Bold = True
cmdAdd.Font.Size = 8
cmdAdd.ForeColor = Black

cmdRemove.Caption = "Remove"
cmdRemove.Font.Name = "MS Sans Serif"
cmdRemove.Font.Bold = True
cmdRemove.Font.Size = 8
cmdRemove.ForeColor = Black

cmdDup.Caption = "Duplicates"
cmdDup.Font.Name = "MS Sans Serif"
cmdDup.Font.Bold = True
cmdDup.Font.Size = 8
cmdDup.ForeColor = Black

cmdSend.Caption = "Send"
cmdSend.Font.Name = "MS Sans Serif"
cmdSend.Font.Bold = True
cmdSend.Font.Size = 8
cmdSend.ForeColor = Black

cmdClear.Caption = "Clear"
cmdClear.Font.Name = "MS Sans Serif"
cmdClear.Font.Bold = True
cmdClear.Font.Size = 8
cmdClear.ForeColor = Black

cmbAdd.Text = "Add - Select"
cmbAdd.AddItem ("Sales")
cmbAdd.AddItem ("Downloads")
cmbAdd.AddItem ("Referral Resellers")
cmbAdd.AddItem ("Product Resellers")
cmbAdd.AddItem ("Referred Customers")
cmbAdd.AddItem ("Software Contracts")
cmbAdd.AddItem ("Assessments")
cmbAdd.AddItem ("Registered Users")

cmbRemove.Text = "Remove - Select"
cmbRemove.AddItem ("Sales")
cmbRemove.AddItem ("Downloads")
cmbRemove.AddItem ("Referral Resellers")
cmbRemove.AddItem ("Product Resellers")
cmbRemove.AddItem ("Referred Customers")
cmbRemove.AddItem ("Software Contracts")
cmbRemove.AddItem ("Assessments")
cmbRemove.AddItem ("Registered Users")

cmbFrom.AddItem ("info@isotop.net")
cmbFrom.AddItem ("r.reseller@isotop.net")
cmbFrom.AddItem ("p.reseller@isotop.net")
cmbFrom.AddItem ("softwarecontract@isotop.net")
cmbFrom.AddItem ("iso14001contract@isotop.net")
cmbFrom.AddItem ("suggestions@isotop.net")
cmbFrom.AddItem ("support@isotop.net")
cmbFrom.AddItem ("marks@isotop.net")
cmbFrom.AddItem ("aron.mb@isotop.net")
cmbFrom.AddItem ("martinb@isotop.net")
cmbFrom.AddItem ("harry.jb@isotop.net")
cmbFrom.AddItem ("bforeman@isotop.net")
cmbFrom.AddItem ("gturner@isotop.net")
cmbFrom.AddItem ("tritter@isotop.net")

Initialized = True

End Sub

Sub cmdAdd_Click()

'________________________________________________Sales
If cmbAdd.Text = "Sales" Then
rsconn = "select * from Orders"
Set rs = conn.execute(rsconn)
Do While Not rs.EOF
shift = False
If InStr(whole, rs("CustomerEmail")) <> 0 Then
  shift = True
End If

If shift = False Then
grdMain.AddItem (rs("CustomerEmail"))
End If

whole = whole & " " & rs("CustomerEmail")

rs.Movenext
Loop
End If

'________________________________________________Downloads
If cmbAdd.Text = "Downloads" Then
rsconn = "select * from Downloads"
Set rs = conn.execute(rsconn)
Do While Not rs.EOF
shift = False
If InStr(whole, rs("Email")) <> 0 Then
  shift = True
End If

If shift = False Then
grdMain.AddItem (rs("Email"))
End If

whole = whole & " " & rs("Email")

rs.Movenext
Loop
End If

'________________________________________________Rr
If cmbAdd.Text = "Referral Resellers" Then
rsconn = "select * from ReferralResellers"
Set rs = conn.execute(rsconn)
Do While Not rs.EOF
shift = False
If InStr(whole, rs("RREmail")) <> 0 Then
  shift = True
End If

If shift = False Then
grdMain.AddItem (rs("RREmail"))
End If

whole = whole & " " & rs("RREmail")

rs.Movenext
Loop
End If

'________________________________________________Pr
If cmbAdd.Text = "Product Resellers" Then
rsconn = "select * from ProductResellers"
Set rs = conn.execute(rsconn)
Do While Not rs.EOF
shift = False
If InStr(whole, rs("Email")) <> 0 Then
  shift = True
End If

If shift = False Then
grdMain.AddItem (rs("Email"))
End If

whole = whole & " " & rs("Email")

rs.Movenext
Loop
End If

'________________________________________________Rc
If cmbAdd.Text = "Referred Customers" Then
rsconn = "select * from ReferredCustomers"
Set rs = conn.execute(rsconn)
Do While Not rs.EOF
shift = False
If InStr(whole, rs("RCEmail")) <> 0 Then
  shift = True
End If

If shift = False Then
grdMain.AddItem (rs("RCEmail"))
End If

whole = whole & " " & rs("RCEmail")

rs.Movenext
Loop
End If

'________________________________________________Sc
If cmbAdd.Text = "Software Contracts" Then
rsconn = "select * from SSContracts"
Set rs = conn.execute(rsconn)
Do While Not rs.EOF
shift = False
If InStr(whole, rs("CustomerEmail")) <> 0 Then
  shift = True
End If

If shift = False Then
grdMain.AddItem (rs("CustomerEmail"))
End If

whole = whole & " " & rs("CustomerEmail")

rs.Movenext
Loop
End If

'________________________________________________Assess
If cmbAdd.Text = "Assessments" Then
rsconn = "select * from Assess"
Set rs = conn.execute(rsconn)
Do While Not rs.EOF
shift = False
If InStr(whole, rs("Email")) <> 0 Then
  shift = True
End If

If shift = False Then
grdMain.AddItem (rs("Email"))
End If

whole = whole & " " & rs("Email")

rs.Movenext
Loop
End If

'________________________________________________Users
If cmbAdd.Text = "Registered Users" Then
rsconn = "select * from emailm_book"
Set rs = conn.execute(rsconn)
Do While Not rs.EOF
shift = False
If InStr(whole, rs("email_address")) <> 0 Then
  shift = True
End If

If shift = False Then
grdMain.AddItem (rs("email_address"))
End If

whole = whole & " " & rs("email_address")

rs.Movenext
Loop
End If

End Sub

Sub cmdClear_Click()
txtTo.Text = ""
txtSubject.Text = ""
cmbFrom.Text = ""
txtBody.Text = ""
End Sub

Sub cmdDup_Click()
rowLimit = grdMain.Rows - 1
For i = 1 To rowLimit
shift = False
If InStr(whole, grdMain.TextMatrix(i, 0)) <> 0 Then
  shift = True
End If

If shift = True Then
grdMain.TextMatrix(i, 0) = ""
End If

whole = whole & " " & grdMain.TextMatrix(i, 0)

Next

End Sub

Sub cmdRemove_Click()

'________________________________________________Sales
If cmbRemove.Text = "Sales" Then
rsconn = "select * from Orders"
Set rs = conn.execute(rsconn)

rowLimit = grdMain.Rows - 1

Do While Not rs.EOF
For i = 1 To rowLimit
 
If grdMain.TextMatrix(i, 0) = rs("CustomerEmail") Then
grdMain.TextMatrix(i, 0) = ""
End If

Next
rs.Movenext
Loop

End If

'________________________________________________Downloads
If cmbRemove.Text = "Downloads" Then
rsconn = "select * from Downloads"
Set rs = conn.execute(rsconn)

rowLimit = grdMain.Rows - 1

Do While Not rs.EOF
For i = 1 To rowLimit
 
If grdMain.TextMatrix(i, 0) = rs("Email") Then
grdMain.TextMatrix(i, 0) = ""
End If

Next
rs.Movenext
Loop

End If

'________________________________________________Downloads
If cmbRemove.Text = "Referral Resellers" Then
rsconn = "select * from ReferralResellers"
Set rs = conn.execute(rsconn)

rowLimit = grdMain.Rows - 1

Do While Not rs.EOF
For i = 1 To rowLimit
 
If grdMain.TextMatrix(i, 0) = rs("RREmail") Then
grdMain.TextMatrix(i, 0) = ""
End If

Next
rs.Movenext
Loop

End If

'________________________________________________Pr

If cmbRemove.Text = "Product Resellers" Then
rsconn = "select * from ProductResellers"
Set rs = conn.execute(rsconn)

rowLimit = grdMain.Rows - 1

Do While Not rs.EOF
For i = 1 To rowLimit
 
If grdMain.TextMatrix(i, 0) = rs("Email") Then
grdMain.TextMatrix(i, 0) = ""
End If

Next
rs.Movenext
Loop

End If

'________________________________________________Rc
If cmbRemove.Text = "Referred Customers" Then
rsconn = "select * from ReferredCustomers"
Set rs = conn.execute(rsconn)

rowLimit = grdMain.Rows - 1

Do While Not rs.EOF
For i = 1 To rowLimit
 
If grdMain.TextMatrix(i, 0) = rs("RCEmail") Then
grdMain.TextMatrix(i, 0) = ""
End If

Next
rs.Movenext
Loop

End If

'________________________________________________Sc
If cmbRemove.Text = "Software Contracts" Then
rsconn = "select * from SSContracts"
Set rs = conn.execute(rsconn)

rowLimit = grdMain.Rows - 1

Do While Not rs.EOF
For i = 1 To rowLimit
 
If grdMain.TextMatrix(i, 0) = rs("CustomerEmail") Then
grdMain.TextMatrix(i, 0) = ""
End If

Next
rs.Movenext
Loop

End If

'________________________________________________Assess
If cmbRemove.Text = "Assessments" Then
rsconn = "select * from Assess"
Set rs = conn.execute(rsconn)

rowLimit = grdMain.Rows - 1

Do While Not rs.EOF
For i = 1 To rowLimit
 
If grdMain.TextMatrix(i, 0) = rs("Email") Then
grdMain.TextMatrix(i, 0) = ""
End If

Next
rs.Movenext
Loop

End If

'________________________________________________Users
If cmbRemove.Text = "Registered Users" Then
rsconn = "select * from emailm_book"
Set rs = conn.execute(rsconn)

rowLimit = grdMain.Rows - 1

Do While Not rs.EOF
For i = 1 To rowLimit
 
If grdMain.TextMatrix(i, 0) = rs("email_address") Then
grdMain.TextMatrix(i, 0) = ""
End If

Next
rs.Movenext
Loop

End If

End Sub

Sub cmdSend_Click()
rowLimit = grdMain.Rows - 1
For i = 1 To rowLimit
shift = False
If grdMain.TextMatrix(i, 0) = "" Then
shift = True
End If

If shift = False Then

sendAmount = sendAmount + 1

send_from = cmbFrom.Text
send_to = txtTo.Text
send_subject = txtSubject.Text
send_body = txtBody.Text
send_name = "isotop User"

Set Mailer = CreateObject("SMTPsvg.Mailer")
Mailer.RemoteHost = "mail.isotop.net"
Mailer.FromName = "isotop Global Partnership"
Mailer.FromAddress = send_from
Mailer.AddRecipient send_name, grdMain.TextMatrix(i, 0)
Mailer.subject = send_subject
Mailer.BodyText = send_body
If Not Mailer.SendMail Then
mailsend = "False"
Else
mailsend = "True"
End If

Set Mailer = Nothing
End If
If i = rowLimit Then
mailSent = sendAmount & " Emails Sent"
End If
Next

End Sub

</script>

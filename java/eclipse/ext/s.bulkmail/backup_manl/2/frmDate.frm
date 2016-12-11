VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmDate 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Addition"
   ClientHeight    =   2895
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   5925
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2895
   ScaleWidth      =   5925
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4560
      TabIndex        =   9
      Top             =   2520
      Width           =   1215
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Reset"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4560
      TabIndex        =   7
      Top             =   2160
      Width           =   1215
   End
   Begin VB.CommandButton cmdRemove 
      Caption         =   "Remove"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   2520
      Width           =   1215
   End
   Begin VB.PictureBox Background 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   2895
      Left            =   0
      ScaleHeight     =   2865
      ScaleWidth      =   5865
      TabIndex        =   10
      Top             =   0
      Width           =   5895
      Begin VB.CommandButton cmdAdd 
         Caption         =   "Add"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   2160
         Width           =   1215
      End
      Begin VB.ComboBox cmbMethod 
         Height          =   315
         Left            =   1560
         TabIndex        =   21
         Top             =   120
         Width           =   2415
      End
      Begin RichTextLib.RichTextBox txtDebug 
         Height          =   375
         Left            =   3000
         TabIndex        =   20
         Top             =   1920
         Width           =   2775
         _ExtentX        =   4895
         _ExtentY        =   661
         _Version        =   393217
         Enabled         =   -1  'True
         ScrollBars      =   2
         TextRTF         =   $"frmDate.frx":0000
      End
      Begin VB.ComboBox cmbTable 
         Height          =   315
         Left            =   1560
         TabIndex        =   18
         Top             =   450
         Width           =   2415
      End
      Begin VB.TextBox Text11 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   3000
         TabIndex        =   16
         Text            =   "To Year :"
         Top             =   1560
         Width           =   1335
      End
      Begin VB.TextBox toYear 
         Height          =   285
         Left            =   4440
         TabIndex        =   5
         Top             =   1560
         Width           =   1335
      End
      Begin VB.TextBox Text9 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   3000
         TabIndex        =   15
         Text            =   "To Month :"
         Top             =   1200
         Width           =   1335
      End
      Begin VB.TextBox toMonth 
         Height          =   285
         Left            =   4440
         TabIndex        =   4
         Top             =   1200
         Width           =   1335
      End
      Begin VB.TextBox Text7 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   3000
         TabIndex        =   14
         Text            =   "To Day :"
         Top             =   840
         Width           =   1335
      End
      Begin VB.TextBox toDay 
         Height          =   285
         Left            =   4440
         TabIndex        =   3
         Top             =   840
         Width           =   1335
      End
      Begin VB.TextBox Text5 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   120
         TabIndex        =   13
         Text            =   "From Year :"
         Top             =   1560
         Width           =   1335
      End
      Begin VB.TextBox fromYear 
         Height          =   285
         Left            =   1560
         TabIndex        =   2
         Top             =   1560
         Width           =   1335
      End
      Begin VB.TextBox Text3 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   120
         TabIndex        =   12
         Text            =   "From Month :"
         Top             =   1200
         Width           =   1335
      End
      Begin VB.TextBox fromMonth 
         Height          =   285
         Left            =   1560
         TabIndex        =   1
         Top             =   1200
         Width           =   1335
      End
      Begin VB.TextBox Text1 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   120
         TabIndex        =   11
         Text            =   "From Day :"
         Top             =   840
         Width           =   1335
      End
      Begin VB.TextBox fromDay 
         Height          =   285
         Left            =   1560
         TabIndex        =   0
         Top             =   840
         Width           =   1335
      End
      Begin VB.Label Label3 
         BackColor       =   &H80000009&
         Caption         =   "Select Method :"
         Height          =   255
         Left            =   120
         TabIndex        =   22
         Top             =   150
         Width           =   2895
      End
      Begin VB.Label Label2 
         BackColor       =   &H80000009&
         Caption         =   "Select Table :"
         Height          =   255
         Left            =   120
         TabIndex        =   19
         Top             =   480
         Width           =   2895
      End
      Begin VB.Label Label1 
         BackColor       =   &H80000009&
         Caption         =   "Format : dd , mm, yy (ie, 04,08,2001)"
         Height          =   255
         Left            =   120
         TabIndex        =   17
         Top             =   1920
         Width           =   5295
      End
   End
End
Attribute VB_Name = "frmDate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

public shstring as variant
public i as integer

Private Sub cmdAdd_Click() 
   Dim sql
   Dim sqldate
   Dim fieldselect
   Dim skip

   dbSection = ( "Orders,Downloads,Assess,ReferralResellers,ReferredCustomers,ProductResellers,SSContracts,s_iso14000_org" )
   dbFieldID = ( "OrderID,DnID,RrID,RcID,PrID,SsID,AssessID,s_iso14000_org_id" )
   dbField   = ( "CustomerEmail,CustomerName,Date;Email,FirstName,LastName,CurrentDate;Email,FirstName,LastName,CurrentDate;RREmail,RRFirstName,RRLastName,RRCurrentDate;RCEmail,RCFirstName,RCLastName,RCCurrentDate;Email,FirstName,LastName,CurrentDate;CustomerEmail,CustomerName,Date;s_iso14000_org_email,s_iso14000_org_name,s_iso14000_org_date")
   dbArrayID = split(dbFieldID, ",")
   sqlDate   = "CurrentDate"

   if cmbmethod.text     = "Choose : " then
      msgbox ("Please select a desired Method")
   elseif cmbtable.text  = "Choose : " then
      msgbox ("Please select a desired Table")
   elseif cmbmethod.text = "Date Range" then

      if cmbtable.text  <> "" and _
         fromday.text   <> "" and _
         frommonth.text <> "" and _
         fromyear.text  <> "" and _
         today.text     <> "" and _
         tomonth.text   <> "" and _
         toyear.text    <> "" then

         fromMonth = frommonth.text
         fromDay   = fromday.text
         fromYear  = fromyear.text
         toMonth   = tomonth.text
         toDay     = today.text
         toYear    = toyear.text
   
   fieldselect = replace(cmbtable.text, " ", "")
   if fieldselect     = "Orders" then
      sql = "SELECT * FROM " & fieldselect & " WHERE ApprovalCode = '" & "AP/AP/Approved" & "' OR ApprovalCode = '" & "A" & "'"
   elseif fieldselect = "ProductResellers" then
      sql = "SELECT * FROM " & fieldselect & " WHERE Active = '" & "Checked" & "'"
   else
      sql = "SELECT * FROM " & fieldselect
   end if
   set rs = conn.execute(sql)
   if rs.eof then
     msgBox ("No records for Table : " & cmbtable.text)
   else

   do while not rs.eof
   on error resume next

   dbdate = rs(sqldate)
   shstring = "/"
   dbsplit = split(dbDate, shstring)
   runCheck = 0
   drem = ""

   for each shstring in dbsplit
      runCheck = runCheck + 1
      skip     = false
      varyear  = datepart("yyyy", dbdate)
  
     if runCheck = 1 then
        for i = 1 to 9
           if left(shstring, 1) = "0" then
             skip = true
           else
              if i = shstring and _
                 skip <> true then
                 shstring = "0" & shstring
              end if
           end if
        next
        dateMonth = shstring
     end if
     if runCheck = 2 then
        for i = 1 to 9
           if left(shstring, 1) = "0" then
             skip = true
           else
              if i = shstring then
                 shstring = "0" & shstring
              end if
           end if
        next
       dateday = shstring
     end if
     if runCheck = 3 then
        dateyear = varyear
     end if

     if runcheck = 3 then
        if datemonth >= frommonth and datemonth <= tomonth and _
           dateday   >= fromday   and dateday   <= today   and _
           dateyear  >= fromyear  and dateyear  <= toyear then
           drem = datemonth & dateday & dateyear
        end if
        if datemonth >  frommonth and datemonth <  tomonth and _
           dateyear  >= fromyear  and dateyear  <= toyear then
           drem = datemonth & dateday & dateyear
        end if
        if datemonth =  frommonth and datemonth <> tomonth and _
          dateday    >= fromday   and _
          dateyear   >= fromyear  and dateyear  <= toyear then
          drem = datemonth & dateday & dateyear
        end if
        if datemonth =  tomonth  and datemonth <> frommonth and _
           dateday   <= today    and _
           dateyear  >= fromyear and dateyear  <= toyear then
           drem = dateMonth & dateDay & dateYear
        end if
     end if
   next

'------------------------------------------------------------/
if drem <> "" then
'----------------------------------------------- ISO 14000
if cmbtable.text = "s_iso14000_org" then   
   frmmail.statusbar.panels(1).text = "Processing..."
   call mousechange("frmDate", "Wait")

   shift = false
   if instr(whole, lcase(rs("s_iso14000_org_email"))) <> 0 then
      shift = true
   elseif isnull(lcase(rs("s_iso14000_org_email"))) = True then
      shift = true
   end if

   if shift = false then
      if isnull(rs("s_iso14000_org_name")) = true then
         frmmail.grdmain.additem (rs(dbArrayID(7)) & chr(9) & "" & chr(9) & lcase(rs("s_iso14000_org_email")) & chr(9) & rs(sqldate) & chr(9) & rs("flags"))
      else
         frmmail.grdmain.additem (rs(dbArrayID(7)) & chr(9) & lcase(rs("s_iso14000_org_email")) & chr(9) & rs("s_iso14000_org_name") & chr(9) & rs(sqlDate) & chr(9) & rs("flags"))
      end if
   end if
   whole = whole & " " & lcase(rs("s_iso14000_org_email"))
   call mousechange("frmDate", "Normal")
   frmmail.statusbar.panels(1).Text = "Ready"
end if
'----------------------------------------------- Orders
if cmbtable.text = "Orders" then   
   frmmail.statusbar.panels(1).text = "Processing..."
   call mousechange("frmDate", "Wait")

   shift = false
   if instr(whole, lcase(rs("CustomerEmail"))) <> 0 then
      shift = true
   elseif isnull(lcase(rs("CustomerEmail"))) = True then
      shift = true
   end if

   if shift = false then
      if isnull(rs("CustomerName")) = true then
         frmmail.grdmain.additem (rs(dbArrayID(0)) & chr(9) & "" & chr(9) & lcase(rs("CustomerEmail")) & chr(9) & rs(sqldate) & chr(9) & rs("flags"))
      else
         frmmail.grdmain.additem (rs(dbArrayID(0)) & chr(9) & lcase(rs("CustomerEmail")) & chr(9) & rs("CustomerName") & chr(9) & rs(sqlDate) & chr(9) & rs("flags"))
      end if
   end if
   whole = whole & " " & lcase(rs("CustomerEmail"))
   call mousechange("frmDate", "Normal")
   frmmail.statusbar.panels(1).Text = "Ready"
end if
'----------------------------------------------- Downloads
if cmbtable.text = "Downloads" then   
   frmmail.statusbar.panels(1).text = "Processing..."
   call mousechange("frmDate", "Wait")

   shift = false
   if instr(whole, lcase(rs("Email"))) <> 0 then
      shift = true
   elseif isnull(lcase(rs("Email"))) = True then
      shift = true
   end if

   if shift = false then
      if isnull(rs("FirstName")) = true then
         frmmail.grdmain.additem (rs(dbArrayID(1)) & chr(9) & "" & chr(9) & lcase(rs("Email")) & chr(9) & rs(sqldate) & chr(9) & rs("flags"))
      else
         frmmail.grdmain.additem (rs(dbArrayID(1)) & chr(9) & lcase(rs("Email")) & chr(9) & rs("FirstName") & " " & rs("LastName") & chr(9) & rs(sqlDate) & chr(9) & rs("flags"))
      end if
   end if
   whole = whole & " " & lcase(rs("Email"))
   call mousechange("frmDate", "Normal")
   frmmail.statusbar.panels(1).Text = "Ready"
end if
'----------------------------------------------- Referral Resellers
if cmbtable.text = "Referral Resellers" then   
   frmmail.statusbar.panels(1).text = "Processing..."
   call mousechange("frmDate", "Wait")

   shift = false
   if instr(whole, lcase(rs("RREmail"))) <> 0 then
      shift = true
   elseif isnull(lcase(rs("RREmail"))) = True then
      shift = true
   end if

   if shift = false then
      if isnull(rs("RRFirstName")) = true then
         frmmail.grdmain.additem (rs(dbArrayID(2)) & chr(9) & "" & chr(9) & lcase(rs("RREmail")) & chr(9) & rs(sqldate) & chr(9) & rs("flags"))
      else
         frmmail.grdmain.additem (rs(dbArrayID(2)) & chr(9) & lcase(rs("RREmail")) & chr(9) & rs("RRFirstName") & " " & rs("RRLastName") & chr(9) & rs(sqlDate) & chr(9) & rs("flags"))
      end if
   end if
   whole = whole & " " & lcase(rs("RREmail"))
   call mousechange("frmDate", "Normal")
   frmmail.statusbar.panels(1).Text = "Ready"
end if
'----------------------------------------------- Referred Customers
if cmbtable.text = "Referred Customers" then   
   frmmail.statusbar.panels(1).text = "Processing..."
   call mousechange("frmDate", "Wait")

   shift = false
   if instr(whole, lcase(rs("RCEmail"))) <> 0 then
      shift = true
   elseif isnull(lcase(rs("RCEmail"))) = True then
      shift = true
   end if

   if shift = false then
      if isnull(rs("RRFirstName")) = true then
         frmmail.grdmain.additem (rs(dbArrayID(3)) & chr(9) & "" & chr(9) & lcase(rs("RCEmail")) & chr(9) & rs(sqldate) & chr(9) & rs("flags"))
      else
         frmmail.grdmain.additem (rs(dbArrayID(3)) & chr(9) & lcase(rs("RCEmail")) & chr(9) & rs("RCFirstName") & " " & rs("RCLastName") & chr(9) & rs(sqlDate) & chr(9) & rs("flags"))
      end if
   end if
   whole = whole & " " & lcase(rs("RCEmail"))
   call mousechange("frmDate", "Normal")
   frmmail.statusbar.panels(1).Text = "Ready"
end if
'----------------------------------------------- Product Resellers
if cmbtable.text = "Product Resellers" then   
   frmmail.statusbar.panels(1).text = "Processing..."
   call mousechange("frmDate", "Wait")

   shift = false
   if instr(whole, lcase(rs("Email"))) <> 0 then
      shift = true
   elseif isnull(lcase(rs("Email"))) = True then
      shift = true
   end if

   if shift = false then
      if isnull(rs("FirstName")) = true then
         frmmail.grdmain.additem (rs(dbArrayID(4)) & chr(9) & "" & chr(9) & lcase(rs("Email")) & chr(9) & rs(sqldate) & chr(9) & rs("flags"))
      else
         frmmail.grdmain.additem (rs(dbArrayID(4)) & chr(9) & lcase(rs("Email")) & chr(9) & rs("FirstName") & " " & rs("LastName") & chr(9) & rs(sqlDate) & chr(9) & rs("flags"))
      end if
   end if
   whole = whole & " " & lcase(rs("Email"))
   call mousechange("frmDate", "Normal")
   frmmail.statusbar.panels(1).Text = "Ready"
end if
'----------------------------------------------- Software Contracts
if cmbtable.text = "SSContracts" then   

' ----------------------------------------------- cut
   msgbox("Info: SScontracts are currently unavailable")

'   frmmail.statusbar.panels(1).text = "Processing..."
'   call mousechange("frmDate", "Wait")'
'
'   shift = false
'   if instr(whole, lcase(rs("CustomerEmail"))) <> 0 then
'      shift = true
'   elseif isnull(lcase(rs("CustomerEmail"))) = True then
'      shift = true
'   end if
'
'   if shift = false then
'      if isnull(rs("CustomerName")) = true then
'         frmmail.grdmain.additem (rs(dbArrayID(5)) & chr(9) & "" & chr(9) & lcase(rs("CustomerEmail")) & chr(9) & rs(sqldate) & chr(9) & rs("flags"))
'      else
'         frmmail.grdmain.additem (rs(dbArrayID(5)) & chr(9) & lcase(rs("CustomerEmail")) & chr(9) & rs("CustomerName") & chr(9) & rs(sqlDate) & chr(9) & rs("flags"))
'      end if
'   end if
'   whole = whole & " " & lcase(rs("CustomerEmail"))
'   call mousechange("frmDate", "Normal")
'   frmmail.statusbar.panels(1).Text = "Ready"
end if
'----------------------------------------------- Assessments
if cmbtable.text = "Assess" then   
   frmmail.statusbar.panels(1).text = "Processing..."
   call mousechange("frmDate", "Wait")

   shift = false
   if instr(whole, lcase(rs("Email"))) <> 0 then
      shift = true
   elseif isnull(lcase(rs("Email"))) = True then
      shift = true
   end if

   if shift = false then
      if isnull(rs("CustomerName")) = true then
         frmmail.grdmain.additem (rs(dbArrayID(6)) & chr(9) & "" & chr(9) & lcase(rs("Email")) & chr(9) & rs(sqldate) & chr(9) & rs("flags"))
      else
         frmmail.grdmain.additem (rs(dbArrayID(6)) & chr(9) & lcase(rs("Email")) & chr(9) & rs("FirstName") & " " & rs("LastName") & chr(9) & rs(sqlDate) & chr(9) & rs("flags"))
      end if
   end if
   whole = whole & " " & lcase(rs("Email"))
   call mousechange("frmDate", "Normal")
   frmmail.statusbar.panels(1).Text = "Ready"
end if
'------------------------------------------------------------/
          end if
          rs.movenext
          loop
       end if
    else
       msgbox ("Please fill in all date range fields")
end if
elseif cmbmethod.text = "All" then
'----------------------------------------------- ISO 14000
If cmbTable.Text = "s_iso14000_org" Then
Call MouseChange("frmMail", "Wait")
rsconn = "SELECT * FROM " & Replace(cmbTable.Text, " ", "")
Set rs = conn.Execute(rsconn)

   If rs.eof then
     MsgBox ("No records for Table : " & cmbTable.Text)
   Else

'---------------recordNo
frmMail.StatusBar.Panels(1).Text = "Processing..."
Set rsc = conn.Execute(rsconn)
Do While Not rsc.EOF
Set rc = CreateObject("ADODB.Recordset")
 rc.Open "s_iso14000_org", conn, 1, 2, 2
 recordno = recordno + 1
 rc.Close
rsc.movenext
Loop
frmMail.Progress.Max = recordno
'---------------recordNo

Do While Not rs.EOF
Shift = False
If InStr(whole, LCase(rs("s_iso14000_org_email"))) <> 0 Then
  Shift = True
  frmMail.Progress.Max = frmMail.Progress.Max - 1
End If
If IsNull(LCase(rs("s_iso14000_org_email"))) = True Then
  Shift = True
  frmMail.Progress.Max = frmMail.Progress.Max - 1
End If

If Shift = False Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
  If IsNull(rs("s_iso14000_org_name")) = True Then
    frmMail.grdMain.AddItem (rs(dbArrayID(7)) & Chr(9) & LCase(rs("s_iso14000_org_email")) & Chr(9) & LCase(rs("s_iso14000_org_email")) & Chr(9) & rs(sqlDate) & Chr(9) & rs("flags"))
  Else
    frmMail.grdMain.AddItem (rs(dbArrayID(7)) & Chr(9) & LCase(rs("s_iso14000_org_email")) & Chr(9) & rs("s_iso14000_org_name") & Chr(9) & rs(sqlDate) & Chr(9) & rs("flags"))
  End If
End If

'---------------Progress
If iProgress = frmMail.Progress.Max Then
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
End If
'---------------Progress

whole = whole & " " & LCase(rs("s_iso14000_org_email"))

rs.movenext
Loop

End If
Call MouseChange("frmMail", "Normal")
End If
'----------------------------------------------- Orders
If cmbTable.Text = "Orders" Then
Call MouseChange("frmMail", "Wait")
rsconn = "SELECT * FROM " & Replace(cmbTable.Text, " ", "") & " WHERE ApprovalCode = '" & "AP/AP/Approved" & "' OR ApprovalCode = '" & "A" & "'"
Set rs = conn.Execute(rsconn)

   If rs.EOF Then
     MsgBox ("No records for Table : " & cmbTable.Text)
   Else

'---------------recordNo
frmMail.StatusBar.Panels(1).Text = "Processing..."
Set rsc = conn.Execute(rsconn)
Do While Not rsc.EOF
Set rc = CreateObject("ADODB.Recordset")
 rc.Open "Orders", conn, 1, 2, 2
 recordno = recordno + 1
 rc.Close
rsc.movenext
Loop
frmMail.Progress.Max = recordno
'---------------recordNo

Do While Not rs.EOF
Shift = False
If InStr(whole, LCase(rs("CustomerEmail"))) <> 0 Then
  Shift = True
  frmMail.Progress.Max = frmMail.Progress.Max - 1
End If
If IsNull(LCase(rs("CustomerEmail"))) = True Then
  Shift = True
  frmMail.Progress.Max = frmMail.Progress.Max - 1
End If

If Shift = False Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
        frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
  If IsNull(rs("CustomerName")) = True Then
    frmMail.grdMain.AddItem (rs(dbArrayID(0)) & Chr(9) & LCase(rs("CustomerEmail")) & Chr(9) & LCase(rs("CustomerEmail")) & Chr(9) & rs(sqlDate) & Chr(9) & rs("flags"))
  Else
    frmMail.grdMain.AddItem (rs(dbArrayID(0)) & Chr(9) & LCase(rs("CustomerEmail")) & Chr(9) & rs("CustomerName") & Chr(9) & rs(sqlDate) & Chr(9) & rs("flags"))
  End If
End If

'---------------Progress
If iProgress = frmMail.Progress.Max Then
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
End If
'---------------Progress

whole = whole & " " & LCase(rs("CustomerEmail"))

rs.movenext
Loop

End If
Call MouseChange("frmMail", "Normal")
End If
'________________________________________________Downloads
If cmbTable.Text = "Downloads" Then
Call MouseChange("frmMail", "Wait")
rsconn = "SELECT * FROM " & Replace(cmbTable.Text, " ", "")
Set rs = conn.Execute(rsconn)

   If rs.EOF Then
     MsgBox ("No records for Table : " & cmbTable.Text)
   Else

'---------------recordNo
frmMail.StatusBar.Panels(1).Text = "Processing..."
Set rsc = conn.Execute(rsconn)
Do While Not rsc.EOF
Set rc = CreateObject("ADODB.Recordset")
 rc.Open "Downloads", conn, 1, 2, 2
 recordno = recordno + 1
 rc.Close
rsc.movenext
Loop
frmMail.Progress.Max = recordno
'---------------recordNo

Do While Not rs.EOF

Shift = False
If InStr(whole, LCase(rs("Email"))) <> 0 Then
  Shift = True
 frmMail.Progress.Max = frmMail.Progress.Max - 1
End If
If IsNull(LCase(rs("Email"))) = True Then
  Shift = True
 frmMail.Progress.Max = frmMail.Progress.Max - 1
End If
 
If Shift = False Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
        frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
  If IsNull(rs("FirstName")) = True Or _
     IsNull(rs("LastName")) = True Then
    frmMail.grdMain.AddItem (rs(dbArrayID(1)) & Chr(9) & LCase(rs("Email")) & Chr(9) & LCase(rs("Email")) & Chr(9) & rs(sqlDate) & Chr(9) & rs("flags"))
  Else
    frmMail.grdMain.AddItem (rs(dbArrayID(1)) & Chr(9) & LCase(rs("Email")) & Chr(9) & rs("FirstName") & " " & rs("LastName") & Chr(9) & rs(sqlDate) & Chr(9) & rs("flags"))
  End If
End If

'---------------Progress
If iProgress = frmMail.Progress.Max Then
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
End If
'---------------Progress

whole = whole & " " & LCase(rs("Email"))

rs.movenext
Loop
   End If

   Call MouseChange("frmMail", "Normal")

   End If
'________________________________________________Rr
If cmbTable.Text = "Referral Resellers" Then
Call MouseChange("frmMail", "Wait")
rsconn = "SELECT * FROM " & Replace(cmbTable.Text, " ", "")
Set rs = conn.Execute(rsconn)

   If rs.EOF Then
     MsgBox ("No records for Table : " & cmbTable.Text)
   Else

'---------------recordNo
frmMail.StatusBar.Panels(1).Text = "Processing..."
Set rsc = conn.Execute(rsconn)
Do While Not rsc.EOF
Set rc = CreateObject("ADODB.Recordset")
 rc.Open "ReferralResellers", conn, 1, 2, 2
 recordno = recordno + 1
 rc.Close
rsc.movenext
Loop
frmMail.Progress.Max = recordno
'---------------recordNo

Do While Not rs.EOF

Shift = False
If InStr(whole, LCase(rs("RREmail"))) <> 0 Then
  Shift = True
 frmMail.Progress.Max = frmMail.Progress.Max - 1
End If
If IsNull(LCase(rs("RREmail"))) = True Then
  Shift = True
 frmMail.Progress.Max = frmMail.Progress.Max - 1
End If

If Shift = False Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
        frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
  If IsNull(rs("RRFirstName")) = True Or _
     IsNull(rs("RRLastName")) = True Then
    frmMail.grdMain.AddItem (rs(dbArrayID(2)) & Chr(9) & LCase(rs("RREmail")) & Chr(9) & LCase(rs("RREmail")) & Chr(9) & rs(sqlDate) & Chr(9) & rs("flags"))
  Else
    frmMail.grdMain.AddItem (rs(dbArrayID(2)) & Chr(9) & LCase(rs("RREmail")) & Chr(9) & rs("RRFirstName") & " " & rs("RRLastName") & Chr(9) & rs(sqlDate) & Chr(9) & rs("flags"))
  End If
End If

'---------------Progress
If iProgress = frmMail.Progress.Max Then
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
End If
'---------------Progress

whole = whole & " " & LCase(rs("RREmail"))

rs.movenext
Loop
   End If

   Call MouseChange("frmMail", "Normal")

   End If
'________________________________________________Pr
If cmbTable.Text = "Product Resellers" Then
Call MouseChange("frmMail", "Wait")
rsconn = "SELECT * FROM " & Replace(cmbTable.Text, " ", "") & " WHERE Active = '" & "Checked" & "'"
Set rs = conn.Execute(rsconn)

   If rs.EOF Then
     MsgBox ("No records for Table : " & cmbTable.Text)
   Else

'---------------recordNo
frmMail.StatusBar.Panels(1).Text = "Processing..."
Set rsc = conn.Execute(rsconn)
Do While Not rsc.EOF
Set rc = CreateObject("ADODB.Recordset")
 rc.Open "ProductResellers", conn, 1, 2, 2
 recordno = recordno + 1
 rc.Close
rsc.movenext
Loop
frmMail.Progress.Max = recordno
'---------------recordNo

Do While Not rs.EOF

Shift = False
If InStr(whole, LCase(rs("Email"))) <> 0 Then
  Shift = True
 frmMail.Progress.Max = frmMail.Progress.Max - 1
End If
If IsNull(LCase(rs("Email"))) = True Then
  Shift = True
 frmMail.Progress.Max = frmMail.Progress.Max - 1
End If

If Shift = False Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
  If IsNull(rs("FirstName")) = True Or _
     IsNull(rs("LastName")) = True Then
    frmMail.grdMain.AddItem (rs(dbArrayID(4)) & Chr(9) & LCase(rs("Email")) & Chr(9) & LCase(rs("Email")) & Chr(9) & rs(sqlDate) & Chr(9) & rs("flags"))
  Else
    frmMail.grdMain.AddItem (rs(dbArrayID(4)) & Chr(9) & LCase(rs("Email")) & Chr(9) & rs("FirstName") & " " & rs("LastName") & Chr(9) & rs(sqlDate) & Chr(9) & rs("flags"))
  End If
End If

'---------------Progress
If iProgress = frmMail.Progress.Max Then
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
End If
'---------------Progress

whole = whole & " " & LCase(rs("Email"))

rs.movenext
Loop
   End If

   Call MouseChange("frmMail", "Normal")

   End If
'________________________________________________Rc
If cmbTable.Text = "Referred Customers" Then
Call MouseChange("frmMail", "Wait")
rsconn = "SELECT * FROM " & Replace(cmbTable.Text, " ", "")
Set rs = conn.Execute(rsconn)

   If rs.EOF Then
     MsgBox ("No records for Table : " & cmbTable.Text)
   Else

'---------------recordNo
frmMail.StatusBar.Panels(1).Text = "Processing..."
Set rsc = conn.Execute(rsconn)
Do While Not rsc.EOF
Set rc = CreateObject("ADODB.Recordset")
 rc.Open "ReferredCustomers", conn, 1, 2, 2
 recordno = recordno + 1
 rc.Close
rsc.movenext
Loop
frmMail.Progress.Max = recordno
'---------------recordNo

Do While Not rs.EOF

Shift = False
If InStr(whole, LCase(rs("RCEmail"))) <> 0 Then
  Shift = True
 frmMail.Progress.Max = frmMail.Progress.Max - 1
End If
If IsNull(LCase(rs("RCEmail"))) = True Then
  Shift = True
 frmMail.Progress.Max = frmMail.Progress.Max - 1
End If

If Shift = False Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
  If IsNull(rs("RCFirstName")) = True Or _
     IsNull(rs("RCLastName")) = True Then
    frmMail.grdMain.AddItem (rs(dbArrayID(3)) & Chr(9) & LCase(rs("RCEmail")) & Chr(9) & LCase(rs("RCEmail")) & Chr(9) & rs(sqlDate) & Chr(9) & rs("flags"))
  Else
    frmMail.grdMain.AddItem (rs(dbArrayID(3)) & Chr(9) & LCase(rs("RCEmail")) & Chr(9) & rs("RCFirstName") & " " & rs("RCLastName") & Chr(9) & rs(sqlDate) & Chr(9) & rs("flags"))
  End If
End If

'---------------Progress
If iProgress = frmMail.Progress.Max Then
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
End If
'---------------Progress

whole = whole & " " & LCase(rs("RCEmail"))

rs.movenext
Loop
   End If

   Call MouseChange("frmMail", "Normal")

   End If
'________________________________________________Sc
If cmbTable.Text = "SSContracts" Then

' ----------------------------------------------- cut
   msgbox("Info: SScontracts are currently unavailable")

'Call MouseChange("frmMail", "Wait")
'rsconn = "SELECT * FROM " & Replace(cmbTable.Text, " ", "")
'Set rs = conn.Execute(rsconn)
'
'If rs.EOF Then
'  MsgBox ("No records for Table : " & cmbTable.Text)
'Else
'
'---------------recordNo
'frmMail.StatusBar.Panels(1).Text = "Processing..."
'Set rsc = conn.Execute(rsconn)
'Do While Not rsc.EOF
'Set rc = CreateObject("ADODB.Recordset")
' rc.Open "SSContracts", conn, 1, 2, 2
' recordno = recordno + 1
' rc.Close
'rsc.movenext
'Loop
'frmMail.Progress.Max = recordno - 2
'---------------recordNo
'
'Do While Not rs.EOF
'
'Shift = False
'If InStr(whole, LCase(rs("CustomerEmail"))) <> 0 Then
'  Shift = True
' frmMail.Progress.Max = frmMail.Progress.Max - 1
'End If
'If IsNull(LCase(rs("CustomerEmail"))) = True Then
'  Shift = True
' frmMail.Progress.Max = frmMail.Progress.Max - 1
'End If
'
'If Shift = False Then
'---------------Progress
'  If iProgress < frmMail.Progress.Max Then
'    iProgress = iProgress + 1
'    frmMail.Progress.value = iProgress
'    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
'  End If
'  If iProgress = frmMail.Progress.Max Then
'    frmMail.Progress.value = 0
'    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'  End If
'---------------Progress
'  If IsNull(rs("CustomerName")) = True Then
'    frmMail.grdMain.AddItem (rs(dbArrayID(5)) & Chr(9) & LCase(rs("CustomerEmail")) & Chr(9) & LCase(rs("CustomerEmail")) & Chr(9) & rs(sqlDate) & Chr(9) & rs("flags"))
'  Else
'    frmMail.grdMain.AddItem (rs(dbArrayID(5)) & Chr(9) & LCase(rs("CustomerEmail")) & Chr(9) & rs("CustomerName") & Chr(9) & rs(sqlDate) & Chr(9) & rs("flags"))
'  End If
'End If
'
'---------------Progress
'If iProgress = frmMail.Progress.Max Then
' frmMail.Progress.value = 0
' frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'End If
'---------------Progress
'
'whole = whole & " " & LCase(rs("CustomerEmail"))
'
'rs.movenext
'Loop
'
'End If
'
'Call MouseChange("frmMail", "Normal")

End If
'________________________________________________Assess
If cmbTable.Text = "Assess" Then

Call MouseChange("frmMail", "Wait")
rsconn = "SELECT * FROM " & Replace(cmbTable.Text, " ", "")
Set rs = conn.Execute(rsconn)

   If rs.EOF Then
     MsgBox ("No records for Table : " & cmbTable.Text)
   Else

'---------------recordNo
frmMail.StatusBar.Panels(1).Text = "Processing..."
Set rsc = conn.Execute(rsconn)
Do While Not rsc.EOF
Set rc = CreateObject("ADODB.Recordset")
 rc.Open "Assess", conn, 1, 2, 2
 recordno = recordno + 1
 rc.Close
rsc.movenext
Loop
frmMail.Progress.Max = recordno
'---------------recordNo

Do While Not rs.EOF

Shift = False
If InStr(whole, LCase(rs("Email"))) <> 0 Then
  Shift = True
 frmMail.Progress.Max = frmMail.Progress.Max - 1
End If
If IsNull(LCase(rs("Email"))) = True Then
  Shift = True
 frmMail.Progress.Max = frmMail.Progress.Max - 1
End If

If Shift = False Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
  If IsNull(rs("FirstName")) = True Or _
     IsNull(rs("LastName")) = True Then
    frmMail.grdMain.AddItem (rs(dbArrayID(6)) & Chr(9) & LCase(rs("Email")) & Chr(9) & LCase(rs("Email")) & Chr(9) & rs(sqlDate) & Chr(9) & rs("flags"))
  Else
    frmMail.grdMain.AddItem (rs(dbArrayID(6)) & Chr(9) & LCase(rs("Email")) & Chr(9) & rs("FirstName") & " " & rs("LastName") & Chr(9) & rs(sqlDate) & Chr(9) & rs("flags"))
  End If
End If

'---------------Progress
If iProgress = frmMail.Progress.Max Then
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
End If
'---------------Progress

whole = whole & " " & LCase(rs("Email"))

rs.movenext
Loop
   End If

   Call MouseChange("frmMail", "Normal")

   End If

End If '//Entire

End Sub

Private Sub cmdClear_Click()
   fromDay.Text   = Empty
   fromMonth.Text = Empty
   fromYear.Text  = Empty
   toDay.Text     = Empty
   toMonth.Text   = Empty
   toYear.Text    = Empty
End Sub

Private Sub cmdClose_Click()
   Unload Me
   Call dCheck
End Sub

Private Sub cmdRemove_Click()

sqlDate = "CurrentDate"

If cmbMethod.Text = "Choose : " Then
 MsgBox ("Please select a desired Method")
ElseIf cmbTable.Text = "Choose : " Then
 MsgBox ("Please select a desired Table")
ElseIf cmbMethod.Text = "Date Range" Then

If cmbTable.Text <> "" And _
   fromDay.Text <> "" And _
   fromMonth.Text <> "" And _
   fromYear.Text <> "" And _
   toDay.Text <> "" And _
   toMonth.Text <> "" And _
   toYear.Text <> "" Then

  fromMonth = fromMonth.Text
  fromDay = fromDay.Text
  fromYear = fromYear.Text
  toMonth = toMonth.Text
  toDay = toDay.Text
  toYear = toYear.Text
   
  fieldSelect = Replace(cmbTable.Text, " ", "")

If fieldSelect = "Orders" Then
 sqlopen = "SELECT * FROM " & fieldSelect & " WHERE ApprovalCode = '" & "AP/AP/Approved" & "' OR ApprovalCode = '" & "A" & "'"
ElseIf fieldSelect = "ProductResellers" Then
 sqlopen = "SELECT * FROM " & fieldSelect & " WHERE Active = '" & "Checked" & "'"
Else
 sqlopen = "SELECT * FROM " & fieldSelect
End If
Set rs = conn.Execute(sqlopen)

Do While Not rs.EOF
On Error Resume Next

 dbDate = rs(sqlDate)
 shstring = "/"
 dbsplit = Split(dbDate, shstring)
 runCheck = 0
 drem = ""

For Each shstring In dbsplit
  runCheck = runCheck + 1

  varYear = DatePart("yyyy", dbDate)

  If runCheck = 1 Then
     For i = 1 To 9
     If i = shstring Then
      shstring = "0" & shstring
    End If
    Next
    dateMonth = shstring
  End If
  If runCheck = 2 Then
     For i = 1 To 9
     If i = shstring Then
      shstring = "0" & shstring
    End If
    Next
    dateDay = shstring
  End If
  If runCheck = 3 Then
    dateYear = varYear
  End If

If runCheck = 3 Then

  If dateMonth >= fromMonth And dateMonth <= toMonth And _
    dateDay >= fromDay And dateDay <= toDay And _
    dateYear >= fromYear And dateYear <= toYear Then
    drem = dateMonth & dateDay & dateYear
  End If

  If dateMonth > fromMonth And dateMonth < toMonth And _
    dateYear >= fromYear And dateYear <= toYear Then
    drem = dateMonth & dateDay & dateYear
  End If

  If dateMonth = fromMonth And dateMonth <> toMonth And _
    dateDay >= fromDay And _
    dateYear >= fromYear And dateYear <= toYear Then
    drem = dateMonth & dateDay & dateYear
  End If

  If dateMonth = toMonth And dateMonth <> fromMonth And _
    dateDay <= toDay And _
    dateYear >= fromYear And dateYear <= toYear Then
    drem = dateMonth & dateDay & dateYear
  End If

End If
Next

If drem <> "" Then
'_______________________________________________________________ISO 14000
If cmbTable.Text = "s_iso14000_org" Then
Call MouseChange("frmMail", "Wait")

'---------------Limit
rowLimit = frmMail.grdMain.Rows
If InStr(rowLimit / 2, ".") <> 0 Then
frmMail.Progress.Max = rowLimit / 2 + 0.5
Else: frmMail.Progress.Max = rowLimit / 2
End If
frmMail.StatusBar.Panels(1).Text = "Processing..."
'---------------Limit

For i = 1 To rowLimit

If i = rowLimit Then
Exit For
End If

'---------------Negate
If frmMail.grdMain.TextMatrix(i, 1) = LCase(rs("s_iso14000_org_email")) Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
frmMail.grdMain.RemoveItem (i)
rowLimit = rowLimit - 1
i = i - 1
End If
'---------------Negate
'---------------Progress
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'---------------Progress

Next i
Call MouseChange("frmMail", "Normal")
End If
'_______________________________________________________________Sales
If cmbTable.Text = "Orders" Then
Call MouseChange("frmMail", "Wait")

'---------------Limit
rowLimit = frmMail.grdMain.Rows
If InStr(rowLimit / 2, ".") <> 0 Then
frmMail.Progress.Max = rowLimit / 2 + 0.5
Else: frmMail.Progress.Max = rowLimit / 2
End If
frmMail.StatusBar.Panels(1).Text = "Processing..."
'---------------Limit

For i = 1 To rowLimit

If i = rowLimit Then
Exit For
End If

'---------------Negate
If frmMail.grdMain.TextMatrix(i, 1) = LCase(rs("CustomerEmail")) Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
frmMail.grdMain.RemoveItem (i)
rowLimit = rowLimit - 1
i = i - 1
End If
'---------------Negate
'---------------Progress
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'---------------Progress

Next i
Call MouseChange("frmMail", "Normal")
End If
'__________________________________________________________________________
'_______________________________________________________________Downloads
If cmbTable.Text = "Downloads" Then
Call MouseChange("frmMail", "Wait")

'---------------Limit
rowLimit = frmMail.grdMain.Rows
If InStr(rowLimit / 2, ".") <> 0 Then
frmMail.Progress.Max = rowLimit / 2 + 0.5
Else: frmMail.Progress.Max = rowLimit / 2
End If
frmMail.StatusBar.Panels(1).Text = "Processing..."
'---------------Limit

For i = 1 To rowLimit

If i = rowLimit Then
Exit For
End If

'---------------Negate
If frmMail.grdMain.TextMatrix(i, 1) = LCase(rs("Email")) Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
frmMail.grdMain.RemoveItem (i)
rowLimit = rowLimit - 1
i = i - 1
End If
'---------------Negate
Next i
'---------------Progress
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'---------------Progress
Call MouseChange("frmMail", "Normal")
End If
'__________________________________________________________________________
'_______________________________________________________________rr
If cmbTable.Text = "Referral Resellers" Then
Call MouseChange("frmMail", "Wait")

'---------------Limit
rowLimit = frmMail.grdMain.Rows
If InStr(rowLimit / 2, ".") <> 0 Then
frmMail.Progress.Max = rowLimit / 2 + 0.5
Else: frmMail.Progress.Max = rowLimit / 2
End If
frmMail.StatusBar.Panels(1).Text = "Processing..."
'---------------Limit

For i = 1 To rowLimit

If i = rowLimit Then
Exit For
End If

'---------------Negate
If frmMail.grdMain.TextMatrix(i, 1) = LCase(rs("RREmail")) Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
frmMail.grdMain.RemoveItem (i)
rowLimit = rowLimit - 1
i = i - 1
End If
'---------------Negate
'---------------Progress
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'---------------Progress

Next i
Call MouseChange("frmMail", "Normal")
End If
'__________________________________________________________________________
'_______________________________________________________________rc
If cmbTable.Text = "Referred Customers" Then
Call MouseChange("frmMail", "Wait")

'---------------Limit
rowLimit = frmMail.grdMain.Rows
If InStr(rowLimit / 2, ".") <> 0 Then
frmMail.Progress.Max = rowLimit / 2 + 0.5
Else: frmMail.Progress.Max = rowLimit / 2
End If
frmMail.StatusBar.Panels(1).Text = "Processing..."
'---------------Limit

For i = 1 To rowLimit

If i = rowLimit Then
Exit For
End If

'---------------Negate
If frmMail.grdMain.TextMatrix(i, 1) = LCase(rs("RCEmail")) Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
frmMail.grdMain.RemoveItem (i)
rowLimit = rowLimit - 1
i = i - 1
End If
'---------------Negate
'---------------Progress
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'---------------Progress

Next i
Call MouseChange("frmMail", "Normal")
End If
'__________________________________________________________________________
'_______________________________________________________________pr
If cmbTable.Text = "Product Resellers" Then
Call MouseChange("frmMail", "Wait")

'---------------Limit
rowLimit = frmMail.grdMain.Rows
If InStr(rowLimit / 2, ".") <> 0 Then
frmMail.Progress.Max = rowLimit / 2 + 0.5
Else: frmMail.Progress.Max = rowLimit / 2
End If
frmMail.StatusBar.Panels(1).Text = "Processing..."
'---------------Limit

For i = 1 To rowLimit

If i = rowLimit Then
Exit For
End If

'---------------Negate
If frmMail.grdMain.TextMatrix(i, 1) = LCase(rs("Email")) Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
frmMail.grdMain.RemoveItem (i)
rowLimit = rowLimit - 1
i = i - 1
End If
'---------------Negate
'---------------Progress
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'---------------Progress

Next i
Call MouseChange("frmMail", "Normal")
End If
'__________________________________________________________________________
'_______________________________________________________________sc
If cmbTable.Text = "SSContracts" Then

' ----------------------------------------------- cut
   msgbox("Info: SScontracts are currently unavailable")

'Call MouseChange("frmMail", "Wait")
'
''---------------Limit
'rowLimit = frmMail.grdMain.Rows
'If InStr(rowLimit / 2, ".") <> 0 Then
'frmMail.Progress.Max = rowLimit / 2 + 0.5
'Else: frmMail.Progress.Max = rowLimit / 2
'End If
'frmMail.StatusBar.Panels(1).Text = "Processing..."
''---------------Limit
'
'For i = 1 To rowLimit
'
'If i = rowLimit Then
'Exit For
'End If
'
'---------------Negate
'If frmMail.grdMain.TextMatrix(i, 1) = LCase(rs("CustomerEmail")) Then
'---------------Progress
'  If iProgress < frmMail.Progress.Max Then
'    iProgress = iProgress + 1
'    frmMail.Progress.value = iProgress
'    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
'  End If
'  If iProgress = frmMail.Progress.Max Then
'    frmMail.Progress.value = 0
'    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'  End If
'---------------Progress
'frmMail.grdMain.RemoveItem (i)
'rowLimit = rowLimit - 1
'i = i - 1
'End If
'---------------Negate
'---------------Progress
' frmMail.Progress.value = 0
' frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'---------------Progress
'
'Next i
'Call MouseChange("frmMail", "Normal")
End If
'__________________________________________________________________________
'_______________________________________________________________assess
If cmbTable.Text = "Assess" Then
Call MouseChange("frmMail", "Wait")

'---------------Limit
rowLimit = frmMail.grdMain.Rows
If InStr(rowLimit / 2, ".") <> 0 Then
frmMail.Progress.Max = rowLimit / 2 + 0.5
Else: frmMail.Progress.Max = rowLimit / 2
End If
frmMail.StatusBar.Panels(1).Text = "Processing..."
'---------------Limit

For i = 1 To rowLimit

If i = rowLimit Then
Exit For
End If

'---------------Negate
If frmMail.grdMain.TextMatrix(i, 1) = LCase(rs("Email")) Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
frmMail.grdMain.RemoveItem (i)
rowLimit = rowLimit - 1
i = i - 1
End If
'---------------Negate
'---------------Progress
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'---------------Progress

Next i
Call MouseChange("frmMail", "Normal")
End If
'__________________________________________________________________________

End If

rs.movenext
Loop

Else
 MsgBox ("Please fill in all date range fields")
End If
ElseIf cmbMethod.Text = "All" Then

'________________________________________________ISO 14000
If cmbTable.Text = "s_iso14000_org" Then
Call MouseChange("frmMail", "Wait")
rsconn = "SELECT * FROM s_iso14000_org"
Set rs = conn.Execute(rsconn)

'---------------Limit
rowLimit = frmMail.grdMain.Rows
If InStr(rowLimit / 2, ".") <> 0 Then
frmMail.Progress.Max = rowLimit / 2 + 0.5
Else: frmMail.Progress.Max = rowLimit / 2
End If
frmMail.StatusBar.Panels(1).Text = "Processing..."
'---------------Limit

Do While Not rs.EOF
For i = 1 To rowLimit

If i = rowLimit Then
Exit For
End If

'---------------Negate
If frmMail.grdMain.TextMatrix(i, 1) = LCase(rs("s_iso14000_org_email")) Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
frmMail.grdMain.RemoveItem (i)
rowLimit = rowLimit - 1
i = i - 1
End If
'---------------Negate
'---------------Progress
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'---------------Progress

Next i
rs.movenext
Loop
Call MouseChange("frmMail", "Normal")
End If

'________________________________________________Sales
If cmbTable.Text = "Orders" Then
Call MouseChange("frmMail", "Wait")
rsconn = "SELECT * FROM Orders WHERE ApprovalCode = '" & "AP/AP/Approved" & "' OR ApprovalCode = '" & "A" & "'"
Set rs = conn.Execute(rsconn)

'---------------Limit
rowLimit = frmMail.grdMain.Rows
If InStr(rowLimit / 2, ".") <> 0 Then
frmMail.Progress.Max = rowLimit / 2 + 0.5
Else: frmMail.Progress.Max = rowLimit / 2
End If
frmMail.StatusBar.Panels(1).Text = "Processing..."
'---------------Limit

Do While Not rs.EOF
For i = 1 To rowLimit

If i = rowLimit Then
Exit For
End If

'---------------Negate
If frmMail.grdMain.TextMatrix(i, 1) = LCase(rs("CustomerEmail")) Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
frmMail.grdMain.RemoveItem (i)
rowLimit = rowLimit - 1
i = i - 1
End If
'---------------Negate
'---------------Progress
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'---------------Progress

Next i
rs.movenext
Loop
Call MouseChange("frmMail", "Normal")
End If

'________________________________________________Downloads
If cmbTable.Text = "Downloads" Then
Call MouseChange("frmMail", "Wait")
rsconn = "SELECT * FROM Downloads"
Set rs = conn.Execute(rsconn)

'---------------Limit
rowLimit = frmMail.grdMain.Rows
If InStr(rowLimit / 2, ".") <> 0 Then
frmMail.Progress.Max = rowLimit / 2 + 0.5
Else: frmMail.Progress.Max = rowLimit / 2
End If
frmMail.StatusBar.Panels(1).Text = "Processing..."
'---------------Limit

Do While Not rs.EOF
For i = 1 To rowLimit

If i = rowLimit Then
Exit For
End If

'---------------Negate
If frmMail.grdMain.TextMatrix(i, 1) = LCase(rs("Email")) Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
frmMail.grdMain.RemoveItem (i)
rowLimit = rowLimit - 1
i = i - 1
End If
'---------------Negate
'---------------Progress
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'---------------Progress

Next i
rs.movenext
Loop
Call MouseChange("frmMail", "Normal")
End If

'________________________________________________rr
If cmbTable.Text = "Referral Resellers" Then
Call MouseChange("frmMail", "Wait")
rsconn = "SELECT * FROM ReferralResellers"
Set rs = conn.Execute(rsconn)

'---------------Limit
rowLimit = frmMail.grdMain.Rows
If InStr(rowLimit / 2, ".") <> 0 Then
frmMail.Progress.Max = rowLimit / 2 + 0.5
Else: frmMail.Progress.Max = rowLimit / 2
End If
frmMail.StatusBar.Panels(1).Text = "Processing..."
'---------------Limit

Do While Not rs.EOF
For i = 1 To rowLimit

If i = rowLimit Then
Exit For
End If

'---------------Negate
If frmMail.grdMain.TextMatrix(i, 1) = LCase(rs("RREmail")) Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
frmMail.grdMain.RemoveItem (i)
rowLimit = rowLimit - 1
i = i - 1
End If
'---------------Negate
'---------------Progress
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'---------------Progress

Next i
rs.movenext
Loop
Call MouseChange("frmMail", "Normal")
End If

'________________________________________________pr

If cmbTable.Text = "Product Resellers" Then
Call MouseChange("frmMail", "Wait")
rsconn = "SELECT * FROM ProductResellers WHERE Active = '" & "Checked" & "'"
Set rs = conn.Execute(rsconn)

'---------------Limit
rowLimit = frmMail.grdMain.Rows
If InStr(rowLimit / 2, ".") <> 0 Then
frmMail.Progress.Max = rowLimit / 2 + 0.5
Else: frmMail.Progress.Max = rowLimit / 2
End If
frmMail.StatusBar.Panels(1).Text = "Processing..."
'---------------Limit

Do While Not rs.EOF
For i = 1 To rowLimit

If i = rowLimit Then
Exit For
End If

'---------------Negate
If frmMail.grdMain.TextMatrix(i, 1) = LCase(rs("Email")) Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
frmMail.grdMain.RemoveItem (i)
rowLimit = rowLimit - 1
i = i - 1
End If
'---------------Negate
'---------------Progress
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'---------------Progress

Next i
rs.movenext
Loop
Call MouseChange("frmMail", "Normal")
End If

'________________________________________________rc
If cmbTable.Text = "Referred Customers" Then
Call MouseChange("frmMail", "Wait")
rsconn = "SELECT * FROM ReferredCustomers"
Set rs = conn.Execute(rsconn)

'---------------Limit
rowLimit = frmMail.grdMain.Rows
If InStr(rowLimit / 2, ".") <> 0 Then
frmMail.Progress.Max = rowLimit / 2 + 0.5
Else: frmMail.Progress.Max = rowLimit / 2
End If
frmMail.StatusBar.Panels(1).Text = "Processing..."
'---------------Limit

Do While Not rs.EOF
For i = 1 To rowLimit

If i = rowLimit Then
Exit For
End If

'---------------Negate
If frmMail.grdMain.TextMatrix(i, 1) = LCase(rs("RCEmail")) Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
frmMail.grdMain.RemoveItem (i)
rowLimit = rowLimit - 1
i = i - 1
End If
'---------------Negate
'---------------Progress
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'---------------Progress

Next i
rs.movenext
Loop
Call MouseChange("frmMail", "Normal")
End If

'________________________________________________Sc
If cmbTable.Text = "SSContracts" Then

'// ----------------------------------------------- cut
   msgbox("Info: SScontracts are currently unavailable")

'Call MouseChange("frmMail", "Wait")
'rsconn = "SELECT * FROM SSContracts"
'Set rs = conn.Execute(rsconn)
'
'---------------Limit
'rowLimit = frmMail.grdMain.Rows
'If InStr(rowLimit / 2, ".") <> 0 Then
'frmMail.Progress.Max = rowLimit / 2 + 0.5
'Else: frmMail.Progress.Max = rowLimit / 2
'End If
'frmMail.StatusBar.Panels(1).Text = "Processing..."
'---------------Limit
'
'Do While Not rs.EOF
'For i = 1 To rowLimit
'
'If i = rowLimit Then
'Exit For
'End If
'
'---------------Negate
'If frmMail.grdMain.TextMatrix(i, 1) = LCase(rs("CustomerEmail")) Then
'---------------Progress
'  If iProgress < frmMail.Progress.Max Then
'    iProgress = iProgress + 1
'    frmMail.Progress.value = iProgress
'    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
'  End If
'  If iProgress = frmMail.Progress.Max Then
'    frmMail.Progress.value = 0
'    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'  End If
'---------------Progress
'frmMail.grdMain.RemoveItem (i)
'rowLimit = rowLimit - 1
'i = i - 1
'End If
'---------------Negate
'---------------Progress
' frmMail.Progress.value = 0
' frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'---------------Progress

'Next i
'rs.movenext
'Loop
'Call MouseChange("frmMail", "Normal")
End If

'________________________________________________Assess
If cmbTable.Text = "Assess" Then
Call MouseChange("frmMail", "Wait")
rsconn = "SELECT * FROM " & Trim(cmbTable.Text)
Set rs = conn.Execute(rsconn)

'---------------Limit
rowLimit = frmMail.grdMain.Rows
If InStr(rowLimit / 2, ".") <> 0 Then
frmMail.Progress.Max = rowLimit / 2 + 0.5
Else: frmMail.Progress.Max = rowLimit / 2
End If
frmMail.StatusBar.Panels(1).Text = "Processing..."
'---------------Limit

Do While Not rs.EOF
For i = 1 To rowLimit

If i = rowLimit Then
Exit For
End If

'---------------Negate
If frmMail.grdMain.TextMatrix(i, 1) = LCase(rs("Email")) Then
'---------------Progress
  If iProgress < frmMail.Progress.Max Then
    iProgress = iProgress + 1
    frmMail.Progress.value = iProgress
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max
  End If
  If iProgress = frmMail.Progress.Max Then
    frmMail.Progress.value = 0
    frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
  End If
'---------------Progress
frmMail.grdMain.RemoveItem (i)
rowLimit = rowLimit - 1
i = i - 1
End If
'---------------Negate
'---------------Progress
 frmMail.Progress.value = 0
 frmMail.StatusBar.Panels(1).Text = iProgress & "/" & frmMail.Progress.Max & ": Ready"
'---------------Progress

Next i
rs.movenext
Loop
Call MouseChange("frmMail", "Normal")
End If

End If

End Sub

Private Sub Form_Load()

cmbMethod.Text = "Choose : "
cmbMethod.AddItem ("All")
cmbMethod.AddItem ("Date Range")

cmbTable.Text = "Choose : "
cmbTable.AddItem ("Orders")
cmbTable.AddItem ("Downloads")
cmbTable.AddItem ("Referral Resellers")
cmbTable.AddItem ("Product Resellers")
cmbTable.AddItem ("Referred Customers")
cmbTable.AddItem ("SSContracts")
cmbTable.AddItem ("Assess")
cmbTable.AddItem ("s_iso14000_org")

'-------------- Debug
txtDebug.Visible = False
txtDebug.Enabled = False
End Sub
Private Sub Form_Unload(Cancel As Integer)
Unload Me
Call dCheck
End Sub

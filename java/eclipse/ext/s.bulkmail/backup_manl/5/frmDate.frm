VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Begin VB.Form frmDate 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Addition"
   ClientHeight    =   3750
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   5895
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3750
   ScaleWidth      =   5895
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox cmbMethodS 
      Height          =   315
      Left            =   1440
      TabIndex        =   26
      Top             =   1200
      Width           =   2055
   End
   Begin VB.PictureBox Background 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   3735
      Left            =   0
      ScaleHeight     =   3705
      ScaleWidth      =   5865
      TabIndex        =   14
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
         TabIndex        =   10
         Top             =   3000
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
         TabIndex        =   11
         Top             =   3360
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
         TabIndex        =   12
         Top             =   3000
         Width           =   1215
      End
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
         TabIndex        =   13
         Top             =   3360
         Width           =   1215
      End
      Begin VB.TextBox f_date 
         Height          =   285
         Index           =   0
         Left            =   1560
         TabIndex        =   4
         Top             =   1920
         Width           =   1335
      End
      Begin VB.TextBox Text1 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   120
         TabIndex        =   21
         Text            =   "From Day :"
         Top             =   1920
         Width           =   1335
      End
      Begin VB.TextBox f_date 
         Height          =   285
         HelpContextID   =   1
         Index           =   1
         Left            =   1560
         TabIndex        =   5
         Top             =   2280
         Width           =   1335
      End
      Begin VB.TextBox Text3 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   120
         TabIndex        =   20
         Text            =   "From Month :"
         Top             =   2280
         Width           =   1335
      End
      Begin VB.TextBox f_date 
         Height          =   285
         Index           =   2
         Left            =   1560
         TabIndex        =   6
         Top             =   2640
         Width           =   1335
      End
      Begin VB.TextBox Text5 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   120
         TabIndex        =   19
         Text            =   "From Year :"
         Top             =   2640
         Width           =   1335
      End
      Begin VB.TextBox f_date 
         Height          =   285
         Index           =   3
         Left            =   4440
         TabIndex        =   7
         Top             =   1920
         Width           =   1335
      End
      Begin VB.TextBox Text7 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   3000
         TabIndex        =   18
         Text            =   "To Day :"
         Top             =   1920
         Width           =   1335
      End
      Begin VB.TextBox f_date 
         Height          =   285
         Index           =   4
         Left            =   4440
         TabIndex        =   8
         Top             =   2280
         Width           =   1335
      End
      Begin VB.TextBox Text9 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   3000
         TabIndex        =   17
         Text            =   "To Month :"
         Top             =   2280
         Width           =   1335
      End
      Begin VB.TextBox f_date 
         Height          =   285
         Index           =   5
         Left            =   4440
         TabIndex        =   9
         Top             =   2640
         Width           =   1335
      End
      Begin VB.TextBox Text11 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   3000
         TabIndex        =   16
         Text            =   "To Year :"
         Top             =   2640
         Width           =   1335
      End
      Begin VB.ComboBox cmbTable 
         Height          =   315
         Left            =   1440
         TabIndex        =   1
         Top             =   480
         Width           =   2055
      End
      Begin VB.ComboBox cmbMethod 
         Height          =   315
         Left            =   1440
         TabIndex        =   0
         Top             =   120
         Width           =   2055
      End
      Begin VB.ComboBox cmbField 
         Height          =   315
         Left            =   1440
         TabIndex        =   2
         Top             =   840
         Width           =   2055
      End
      Begin VB.TextBox f_search 
         Height          =   285
         Left            =   1440
         TabIndex        =   3
         Top             =   1560
         Width           =   2055
      End
      Begin RichTextLib.RichTextBox txtDebug 
         Height          =   615
         Left            =   1440
         TabIndex        =   15
         Top             =   3000
         Visible         =   0   'False
         Width           =   3015
         _ExtentX        =   5318
         _ExtentY        =   1085
         _Version        =   393217
         Enabled         =   0   'False
         ScrollBars      =   2
         TextRTF         =   $"frmDate.frx":0000
      End
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         BackColor       =   &H80000009&
         Caption         =   "Search Method :"
         Height          =   255
         Left            =   120
         TabIndex        =   27
         Top             =   1200
         Width           =   1215
      End
      Begin VB.Label Label2 
         BackColor       =   &H80000009&
         Caption         =   "Select Table :"
         Height          =   255
         Left            =   120
         TabIndex        =   25
         Top             =   480
         Width           =   1095
      End
      Begin VB.Label Label3 
         BackColor       =   &H80000009&
         Caption         =   "Select Method :"
         Height          =   255
         Left            =   120
         TabIndex        =   24
         Top             =   120
         Width           =   1215
      End
      Begin VB.Label Label1 
         BackColor       =   &H80000009&
         Caption         =   "Select Field :"
         Height          =   255
         Left            =   120
         TabIndex        =   23
         Top             =   840
         Width           =   1095
      End
      Begin VB.Label Label4 
         BackColor       =   &H80000009&
         Caption         =   "Search Terms :"
         Height          =   255
         Left            =   120
         TabIndex        =   22
         Top             =   1560
         Width           =   1095
      End
   End
End
Attribute VB_Name = "frmDate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'/**
'  * @info        : bulkmail.search.
'  * @build       : 1.0.0, 16/09/2002-17:13:00:GMT+2
'  * @author      : <null@null.co.za>
'  * @todo        :
'  **/

'------------------------------------------------------------------------------;
'  dbRun :
'------------------------------------------------------------------------------;
Function dbAdd(i As Integer, rs As Variant, a As Variant, b As Variant) As Boolean
   a_str = Empty

   Shift = False
   If InStr(whole, LCase(rs(a(i)))) <> 0 Then
      Shift = True
   ElseIf IsNull(LCase(rs(a(i)))) = True Then
      Shift = True
   End If

   If Shift = False Then
      j = Split(b(i), ",")
      For q = 0 To UBound(j)
         If InStr(j(q), "firstname") <> 0 Then
            a_str = a_str & rs(j(q)) & " " & rs(j(q + 1)) & Chr(9)
            q = q + 1
         Else
            a_str = a_str & rs(j(q)) & Chr(9)
         End If
      Next
      frmMail.grdMain.AddItem (a_str)
   End If
   whole = whole & " " & LCase(rs(a(i)))
End Function
'------------------------------------------------------------------------------;
'  dbRemove :
'------------------------------------------------------------------------------;
Function dbRemove(i As Integer, rs As Variant, a As Variant, b As Variant) As Boolean
   rowLimit = frmMail.grdMain.Rows
   For j = 1 To rowLimit
   If j = rowLimit Then
      Exit For
   End If
   If LCase(frmMail.grdMain.TextMatrix(j, 2)) = LCase(rs(a(i))) Then
      frmMail.grdMain.RemoveItem (j)
      rowLimit = rowLimit - 1
      j = j - 1
   End If

   Next j
End Function
'------------------------------------------------------------------------------;
'  doSearch :
'------------------------------------------------------------------------------;
Function doSearch(str As String, find As String, f_type As Integer) As Boolean

Dim f     As Integer
Dim c     As Integer
Dim s_len As Integer
Dim a_len As Integer

If Len(str) > 0 Then
   str = LCase(str)
   find = LCase(find)
   a = Split(find, " ")
   s_len = Len(str)
   a_len = UBound(a)
   If f_type = 0 Or f_type = 1 Then
      For i = 0 To a_len
      f = 0
         For x = 1 To s_len
            If InStr(Mid(str, x, s_len), a(i)) <> 0 Then
               f = 1
            End If
         Next
      c = c + f
      Next
   ElseIf f_type = 2 Then
      f = 0
      If InStr(str, find) <> 0 And Len(find) = Len(str) Then
         f = 1
      End If
      c = c + f
   End If

   If f_type = 0 Then
      If c >= a_len + 1 Then
         doSearch = True
      End If
   ElseIf f_type = 1 Or f_type = 2 Then
      If c > 0 Then
         doSearch = True
      End If
   End If

End If

End Function
'------------------------------------------------------------------------------;
'  getDate :
'------------------------------------------------------------------------------;
Function getDate(d_date As String, p_date As Variant) As Boolean
   Dim i              As Integer
   Dim rc             As Integer
   Dim z              As Integer
   Dim res            As Boolean
   Dim skip           As Boolean
   Dim str            As String
   Dim f_d            As String
   Dim f_m            As String
   Dim f_y            As String
   Dim t_d            As String
   Dim t_m            As String
   Dim t_y            As String
   Dim d_d            As String
   Dim d_m            As String
   Dim d_y            As String

   f_d = p_date(0)
   f_m = p_date(1)
   f_y = p_date(2)
   t_d = p_date(3)
   t_m = p_date(4)
   t_y = p_date(5)

   dbsplit = Split(d_date, "/")
   rc = 0
   res = False

   For z = 0 To UBound(dbsplit)
      rc = rc + 1
      skip = False
      v_year = DatePart("yyyy", d_date)
 
      If rc = 1 Then
         For i = 1 To 9
            If Left(dbsplit(z), 1) = "0" Then
               skip = True
               str = dbsplit(z)
            ElseIf i = dbsplit(z) And skip <> True Then
               str = "0" & dbsplit(z)
            End If
         Next
         d_m = str
      End If
      If rc = 2 Then
         For i = 1 To 9
            If Left(dbsplit(z), 1) = "0" Then
               skip = True
               str = dbsplit(z)
            ElseIf i = dbsplit(z) Then
               str = "0" & dbsplit(z)
            End If
         Next
         d_d = str
      End If
      If rc = 3 Then
         d_y = v_year
      End If

      If rc = 3 Then
         If d_m >= f_m And d_m <= t_m And _
            d_d >= f_d And d_d <= t_d And _
            d_y >= f_y And d_y <= t_y Then
            res = True
         End If
         If d_m > f_m And d_m < t_m And _
            d_y >= f_y And d_y <= t_y Then
            res = True
         End If
         If d_m = f_m And d_m <> t_m And _
            d_d >= f_d And _
            d_y >= f_y And d_y <= t_y Then
            res = True
         End If
         If d_m = t_m And d_m <> f_m And _
            d_d <= t_d And _
            d_y >= f_y And d_y <= t_y Then
            res = True
         End If
      End If
   Next
   
   getDate = res
End Function
'------------------------------------------------------------------------------;
'  add sub.
'------------------------------------------------------------------------------;
Private Sub cmdAdd_Click()

Dim sql         As String
Dim sqldate     As String
Dim d_date      As String
Dim f_find      As String
Dim skip        As Boolean
Dim res         As Boolean

Dim p_date      As Variant
Dim dbSection   As Variant
Dim dbFieldID   As Variant
Dim dbField     As Variant

Dim s_text      As String

Dim tableSelect As String
Dim fieldSelect As String
Dim field       As String
Dim a_str       As String

Dim t_sect      As Integer
Dim t_pos       As Integer
Dim f_sect      As Integer
Dim p_sect      As Integer
Dim s_sect      As Integer

Dim f_type      As Integer

Dim x           As Integer

dbSection = Array("orders", "downloads", "assess", "referredcustomers", "referralresellers", "productresellers", "cd_registration", "s_iso14000_org")
dbFieldID = Array("orderid", "dnid", "assessid", "rcid", "rrid", "prid", "cd_registrationid", "s_iso14000_org_id")
'dbField = Array("CustomerEmail,CustomerName,Date", "Email,FirstName,LastName,CurrentDate", "Email,FirstName,LastName,CurrentDate", "RREmail,RRFirstName,RRLastName,RRCurrentDate", "RCEmail,RCFirstName,RCLastName,RCCurrentDate", "Email,FirstName,LastName,CurrentDate", "CustomerEmail,CustomerName,Date", "s_iso14000_org_email,s_iso14000_org_name,s_iso14000_org_date")
dbCheck = Array("customeremail", "email", "email", "rcemail", "rremail", "email", "emailaddress", "s_iso14000_org_email")
'dbField = Array("orderid,customername,customeremail,customerphone,customercompany,customercountry,currentdate,flags", "dnid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "assessid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "rcid,rcfirstname,rclastname,rcemail,rcposition,rcposition,rccountry,rccurrentdate,flags", "rrid,rrfirstname,rrlastname,rremail,rrtelephone,rrcompanyname,rrcountry,rrcurrentdate,flags", "prid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "cd_registrationid,firstname,lastname,emailaddress,phone,companyname,country,registrationdate", "s_iso14000_org_id,s_iso14000_org_name,s_iso14000_org_email,s_iso14000_org_os,s_iso14000_org_country,s_iso14000_org_date,flags")
dbField = Array("orderid,customername,customeremail,customerphone,customercompany,customercountry,currentdate,flags", "dnid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "assessid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "rcid,rcfirstname,rclastname,rcemail,rcposition,rcposition,rccountry,rccurrentdate,flags", "rrid,rrfirstname,rrlastname,rremail,rrtelephone,rrcompanyname,rrcountry,currentdate,flags", "prid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "cd_registrationid,firstname,lastname,emailaddress,phone,companyname,country,currentdate", "s_iso14000_org_id,s_iso14000_org_name,s_iso14000_org_email,s_iso14000_org_phone,s_iso14000_org_os,s_iso14000_org_country,currentdate,flags")
dbDate = Array("currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate")
'dbArrayID = Split(dbFieldID, ",")

'------------------------------------------------------------------;

If cmbMethod.Text = "Choose : " Then
   MsgBox ("Please select a desired Method.")
   Exit Sub
ElseIf cmbTable.Text = "Choose : " Then
   MsgBox ("Please select a desired Table.")
   Exit Sub
ElseIf cmbField.Text = "Choose : " Then
   MsgBox ("Please select a desired Field.")
   Exit Sub
ElseIf cmbMethod.Text = "Standard" Then
   p_sect = 0
ElseIf cmbMethod.Text = "Date Range" Then
   p_date = Array(a, b, c, d, e, f)
   p_sect = 2
   For i = 0 To f_date.Count - 1
      If f_date(i).Text = Empty Then
         MsgBox ("Please fill in all date range fields.")
         Exit Sub
      Else
         p_date(i) = f_date(i).Text
      End If
   Next
End If

If Len(f_search.Text) > 0 Then
   s_text = f_search.Text
   s_sect = 1
End If

If cmbMethodS.Text = "AND" Then
   f_type = 0
ElseIf cmbMethodS.Text = "OR" Then
   f_type = 1
ElseIf cmbMethodS.Text = "Exact" Then
   f_type = 2
End If

tableSelect = Replace(cmbTable.Text, " ", "")
If tableSelect = "All" Then
   t_sect = 0
ElseIf tableSelect <> "All" Then
   t_sect = 1
   For i = 0 To UBound(dbSection)
      If InStr(LCase(dbSection(i)), LCase(tableSelect)) <> 0 Then
         t_pos = i
      End If
   Next
End If

fieldSelect = Replace(cmbField.Text, " ", "")
If fieldSelect = "All" Then
   f_sect = 0
ElseIf fieldSelect <> "All" Then
   f_sect = 1
   field = fieldSelect
End If

'===========================================================================;
If t_sect = 0 Then
   For x = 0 To UBound(dbSection)
      sql = "SELECT * FROM " & dbSection(x)
      'sql = "SELECT * FROM " & dbSection(0)
      Set rs = conn.Execute(sql)
      If rs.EOF Then
         MsgBox ("No records available in [Table : " & cmbTable.Text & "]")
         Exit Sub
      End If
'***************************************************************************;
      If p_sect = 0 And s_sect = 1 And f_sect = 0 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         s = Split(dbField(x), ",")
         For z = 0 To UBound(s)
            f_find = rs(s(z))
            If doSearch(f_find, s_text, f_type) = True Then
'---------------------------------------------------------------------------;
               Call dbAdd(x, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
            End If
         Next
      rs.movenext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 0 And s_sect = 1 And f_sect = 1 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         s = Split(dbField(x), ",")
         For z = 0 To UBound(s)
            If InStr(LCase(s(z)), LCase(field)) <> 0 Then
               f_find = rs(s(z))
               If doSearch(f_find, s_text, f_type) = True Then
'---------------------------------------------------------------------------;
               Call dbAdd(x, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
               End If
            End If
         Next
      rs.movenext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 0 And s_sect = 0 And f_sect = 0 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         s = Split(dbField(x), ",")
         For z = 0 To UBound(s)
'            f_find = rs(s(z))
'---------------------------------------------------------------------------;
               Call dbAdd(x, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
         Next
      rs.movenext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 2 And s_sect = 1 And f_sect = 1 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         d_date = rs(dbDate(x))
         If getDate(d_date, p_date) = True Then
         s = Split(dbField(x), ",")
         For z = 0 To UBound(s)
            If InStr(LCase(s(z)), LCase(field)) <> 0 Then
               f_find = rs(s(z))
               If doSearch(f_find, s_text, f_type) = True Then
'---------------------------------------------------------------------------;
               Call dbAdd(x, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
               End If
            End If
         Next
         End If
      rs.movenext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 2 And s_sect = 0 And f_sect = 0 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         d_date = rs(dbDate(x))
         If getDate(d_date, p_date) = True Then
'---------------------------------------------------------------------------;
               Call dbAdd(x, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
         End If
      rs.movenext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 2 And s_sect = 1 And f_sect = 0 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         d_date = rs(dbDate(x))
         If getDate(d_date, p_date) = True Then
            s = Split(dbField(x), ",")
            For z = 0 To UBound(s)
               f_find = rs(s(z))
               If doSearch(f_find, s_text, f_type) = True Then
'---------------------------------------------------------------------------;
               Call dbAdd(x, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
               End If
            Next
         End If
      rs.movenext
      Loop
      Call MouseChange("frmDate", "Normal")
      End If
   Next
'***************************************************************************;
ElseIf t_sect = 1 Then
   If tableSelect = "Orders" Then
      sql = "SELECT * FROM " & dbSection(t_pos) & " WHERE ApprovalCode = '" & "AP/AP/Approved" & "' OR ApprovalCode = '" & "A" & "'"
   ElseIf tableSelect = "ProductResellers" Then
      sql = "SELECT * FROM " & dbSection(t_pos) & " WHERE Active = '" & "Checked" & "'"
   Else
      sql = "SELECT * FROM " & dbSection(t_pos)
   End If
   Set rs = conn.Execute(sql)
   If rs.EOF Then
      MsgBox ("No records available in [Table : " & cmbTable.Text & "]")
      Exit Sub
   End If
'***************************************************************************;
      If p_sect = 0 And s_sect = 1 And f_sect = 0 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         s = Split(dbField(t_pos), ",")
         For z = 0 To UBound(s)
            f_find = rs(s(z))
            If doSearch(f_find, s_text, f_type) = True Then
'---------------------------------------------------------------------------;
               Call dbAdd(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
            End If
         Next
      rs.movenext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 0 And s_sect = 1 And f_sect = 1 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         s = Split(dbField(t_pos), ",")
         For z = 0 To UBound(s)
            If InStr(LCase(s(z)), LCase(field)) <> 0 Then
               f_find = rs(s(z))
               If doSearch(f_find, s_text, f_type) = True Then
'---------------------------------------------------------------------------;
               Call dbAdd(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
               End If
            End If
         Next
      rs.movenext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 0 And s_sect = 0 And f_sect = 0 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         s = Split(dbField(t_pos), ",")
         For z = 0 To UBound(s)
            f_find = rs(s(z))
'---------------------------------------------------------------------------;
               Call dbAdd(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
         Next
      rs.movenext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 0 And s_sect = 0 And f_sect = 1 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         s = Split(dbField(t_pos), ",")
         For z = 0 To UBound(s)
            If InStr(LCase(s(z)), LCase(field)) <> 0 Then
               f_find = rs(s(z))
'---------------------------------------------------------------------------;
               Call dbAdd(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
            End If
          Next
      rs.movenext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 2 And s_sect = 1 And f_sect = 1 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         d_date = rs(dbDate(t_pos))
         If getDate(d_date, p_date) = True Then
         s = Split(dbField(t_pos), ",")
         For z = 0 To UBound(s)
            If InStr(LCase(s(z)), LCase(field)) <> 0 Then
               f_find = rs(s(z))
               If doSearch(f_find, s_text, f_type) = True Then
'---------------------------------------------------------------------------;
               Call dbAdd(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
               End If
            End If
         Next
         End If
      rs.movenext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 2 And s_sect = 0 And f_sect = 0 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         d_date = rs(dbDate(t_pos))
         If getDate(d_date, p_date) = True Then
'---------------------------------------------------------------------------;
               Call dbAdd(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
         End If
      rs.movenext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 2 And s_sect = 1 And f_sect = 0 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         d_date = rs(dbDate(t_pos))
         If getDate(d_date, p_date) = True Then
            s = Split(dbField(t_pos), ",")
            For z = 0 To UBound(s)
               f_find = rs(s(z))
               If doSearch(f_find, s_text, f_type) = True Then
'---------------------------------------------------------------------------;
               Call dbAdd(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
               End If
            Next
         End If
      rs.movenext
      Loop
      Call MouseChange("frmDate", "Normal")
      End If
End If
'***************************************************************************;

End Sub
Private Sub cmdRemove_Click()

Dim sql         As String
Dim sqldate     As String
Dim d_date      As String
Dim f_find      As String
Dim skip        As Boolean
Dim res         As Boolean

Dim p_date      As Variant
Dim dbSection   As Variant
Dim dbFieldID   As Variant
Dim dbField     As Variant

Dim s_text      As String

Dim tableSelect As String
Dim fieldSelect As String
Dim field       As String
Dim a_str       As String

Dim t_sect      As Integer
Dim t_pos       As Integer
Dim f_sect      As Integer
Dim p_sect      As Integer
Dim s_sect      As Integer

Dim f_type      As Integer

Dim x           As Integer

dbSection = Array("orders", "downloads", "assess", "referredcustomers", "referralresellers", "productresellers", "cd_registration", "s_iso14000_org")
dbFieldID = Array("orderid", "dnid", "assessid", "rcid", "rrid", "prid", "cd_registrationid", "s_iso14000_org_id")
'dbField = Array("CustomerEmail,CustomerName,Date", "Email,FirstName,LastName,CurrentDate", "Email,FirstName,LastName,CurrentDate", "RREmail,RRFirstName,RRLastName,RRCurrentDate", "RCEmail,RCFirstName,RCLastName,RCCurrentDate", "Email,FirstName,LastName,CurrentDate", "CustomerEmail,CustomerName,Date", "s_iso14000_org_email,s_iso14000_org_name,s_iso14000_org_date")
dbCheck = Array("customeremail", "email", "email", "rcemail", "rremail", "email", "emailaddress", "s_iso14000_org_email")
'dbField = Array("orderid,customername,customeremail,customerphone,customercompany,customercountry,currentdate,flags", "dnid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "assessid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "rcid,rcfirstname,rclastname,rcemail,rcposition,rcposition,rccountry,rccurrentdate,flags", "rrid,rrfirstname,rrlastname,rremail,rrtelephone,rrcompanyname,rrcountry,rrcurrentdate,flags", "prid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "cd_registrationid,firstname,lastname,emailaddress,phone,companyname,country,registrationdate", "s_iso14000_org_id,s_iso14000_org_name,s_iso14000_org_email,s_iso14000_org_os,s_iso14000_org_country,s_iso14000_org_date,flags")
dbField = Array("orderid,customername,customeremail,customerphone,customercompany,customercountry,currentdate,flags", "dnid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "assessid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "rcid,rcfirstname,rclastname,rcemail,rcposition,rcposition,rccountry,rccurrentdate,flags", "rrid,rrfirstname,rrlastname,rremail,rrtelephone,rrcompanyname,rrcountry,currentdate,flags", "prid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "cd_registrationid,firstname,lastname,emailaddress,phone,companyname,country,registrationdate", "s_iso14000_org_id,s_iso14000_org_name,s_iso14000_org_email,s_iso14000_org_os,s_iso14000_org_country,currentdate,flags")
dbDate = Array("currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate")
'dbArrayID = Split(dbFieldID, ",")

'------------------------------------------------------------------;

If cmbMethod.Text = "Choose : " Then
   MsgBox ("Please select a desired Method.")
   Exit Sub
ElseIf cmbTable.Text = "Choose : " Then
   MsgBox ("Please select a desired Table.")
   Exit Sub
ElseIf cmbField.Text = "Choose : " Then
   MsgBox ("Please select a desired Field.")
   Exit Sub
ElseIf cmbMethod.Text = "Standard" Then
   p_sect = 0
ElseIf cmbMethod.Text = "Date Range" Then
   p_date = Array(a, b, c, d, e, f)
   p_sect = 2
   For i = 0 To f_date.Count - 1
      If f_date(i).Text = Empty Then
         MsgBox ("Please fill in all date range fields.")
         Exit Sub
      Else
         p_date(i) = f_date(i).Text
      End If
   Next
End If

If Len(f_search.Text) > 0 Then
   s_text = f_search.Text
   s_sect = 1
End If

If cmbMethodS.Text = "AND" Then
   f_type = 0
ElseIf cmbMethodS.Text = "OR" Then
   f_type = 1
ElseIf cmbMethodS.Text = "Exact" Then
   f_type = 2
End If

tableSelect = Replace(cmbTable.Text, " ", "")
If tableSelect = "All" Then
   t_sect = 0
ElseIf tableSelect <> "All" Then
   t_sect = 1
   For i = 0 To UBound(dbSection)
      If InStr(LCase(dbSection(i)), LCase(tableSelect)) <> 0 Then
         t_pos = i
      End If
   Next
End If

fieldSelect = Replace(cmbField.Text, " ", "")
If fieldSelect = "All" Then
   f_sect = 0
ElseIf fieldSelect <> "All" Then
   f_sect = 1
   field = fieldSelect
End If

'===========================================================================;
If t_sect = 0 Then
   For x = 0 To UBound(dbSection)
      sql = "SELECT * FROM " & dbSection(x)
      'sql = "SELECT * FROM " & dbSection(0)
      Set rs = conn.Execute(sql)
      If rs.EOF Then
         MsgBox ("No records available in [Table : " & cmbTable.Text & "]")
         Exit Sub
      End If
'***************************************************************************;
      If p_sect = 0 And s_sect = 1 And f_sect = 0 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         s = Split(dbField(x), ",")
         For z = 0 To UBound(s)
            f_find = rs(s(z))
            If doSearch(f_find, s_text, f_type) = True Then
'---------------------------------------------------------------------------;
               Call dbRemove(x, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
            End If
         Next
      rs.movenext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 0 And s_sect = 1 And f_sect = 1 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         s = Split(dbField(x), ",")
         For z = 0 To UBound(s)
            If InStr(LCase(s(z)), LCase(field)) <> 0 Then
               f_find = rs(s(z))
               If doSearch(f_find, s_text, f_type) = True Then
'---------------------------------------------------------------------------;
               Call dbRemove(x, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
               End If
            End If
         Next
      rs.movenext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 0 And s_sect = 0 And f_sect = 0 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         s = Split(dbField(x), ",")
         For z = 0 To UBound(s)
'            f_find = rs(s(z))
'---------------------------------------------------------------------------;
               Call dbRemove(x, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
         Next
      rs.movenext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 2 And s_sect = 1 And f_sect = 1 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         d_date = rs(dbDate(x))
         If getDate(d_date, p_date) = True Then
         s = Split(dbField(x), ",")
         For z = 0 To UBound(s)
            If InStr(LCase(s(z)), LCase(field)) <> 0 Then
               f_find = rs(s(z))
               If doSearch(f_find, s_text, f_type) = True Then
'---------------------------------------------------------------------------;
               Call dbRemove(x, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
               End If
            End If
         Next
         End If
      rs.movenext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 2 And s_sect = 0 And f_sect = 0 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         d_date = rs(dbDate(x))
         If getDate(d_date, p_date) = True Then
'---------------------------------------------------------------------------;
               Call dbRemove(x, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
         End If
      rs.movenext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 2 And s_sect = 1 And f_sect = 0 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         d_date = rs(dbDate(x))
         If getDate(d_date, p_date) = True Then
         s = Split(dbField(x), ",")
         For z = 0 To UBound(s)
            f_find = rs(s(z))
            If doSearch(f_find, s_text, f_type) = True Then
'---------------------------------------------------------------------------;
               Call dbRemove(x, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
            End If
         Next
         End If
      rs.movenext
      Loop
      Call MouseChange("frmDate", "Normal")
      End If
   Next
'***************************************************************************;
ElseIf t_sect = 1 Then
   If tableSelect = "Orders" Then
      sql = "SELECT * FROM " & dbSection(t_pos) & " WHERE ApprovalCode = '" & "AP/AP/Approved" & "' OR ApprovalCode = '" & "A" & "'"
   ElseIf tableSelect = "ProductResellers" Then
      sql = "SELECT * FROM " & dbSection(t_pos) & " WHERE Active = '" & "Checked" & "'"
   Else
      sql = "SELECT * FROM " & dbSection(t_pos)
   End If

   'MsgBox (sql)
   Set rs = conn.Execute(sql)

   If rs.EOF Then
      MsgBox ("No records available in [Table : " & cmbTable.Text & "]")
      Exit Sub
   End If
'***************************************************************************;
      If p_sect = 0 And s_sect = 1 And f_sect = 0 Then
      Do While Not rs.EOF
      On Error Resume Next
         s = Split(dbField(t_pos), ",")
         For z = 0 To UBound(s)
            f_find = rs(s(z))
            If doSearch(f_find, s_text, f_type) = True Then
'---------------------------------------------------------------------------;
               Call dbRemove(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
            End If
         Next
      rs.movenext
      Loop
      ElseIf p_sect = 0 And s_sect = 1 And f_sect = 1 Then
      Do While Not rs.EOF
      On Error Resume Next
         s = Split(dbField(t_pos), ",")
         For z = 0 To UBound(s)
            If InStr(LCase(s(z)), LCase(field)) <> 0 Then
               f_find = rs(s(z))
               If doSearch(f_find, s_text, f_type) = True Then
'---------------------------------------------------------------------------;
               Call dbRemove(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
               End If
            End If
         Next
      rs.movenext
      Loop
      ElseIf p_sect = 0 And s_sect = 0 And f_sect = 0 Then
      Do While Not rs.EOF
      On Error Resume Next
         s = Split(dbField(t_pos), ",")
         For z = 0 To UBound(s)
'            f_find = rs(s(z))
'---------------------------------------------------------------------------;
               Call dbRemove(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
         Next
      rs.movenext
      Loop
      ElseIf p_sect = 2 And s_sect = 1 And f_sect = 1 Then
      Do While Not rs.EOF
      On Error Resume Next
         d_date = rs(dbDate(t_pos))
         If getDate(d_date, p_date) = True Then
         s = Split(dbField(t_pos), ",")
         For z = 0 To UBound(s)
            If InStr(LCase(s(z)), LCase(field)) <> 0 Then
               f_find = rs(s(z))
               If doSearch(f_find, s_text, f_type) = True Then
'---------------------------------------------------------------------------;
               Call dbRemove(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
               End If
            End If
         Next
         End If
      rs.movenext
      Loop
      ElseIf p_sect = 2 And s_sect = 0 And f_sect = 0 Then
      Do While Not rs.EOF
      On Error Resume Next
         d_date = rs(dbDate(t_pos))
         If getDate(d_date, p_date) = True Then
'---------------------------------------------------------------------------;
               Call dbRemove(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
         End If
      rs.movenext
      Loop
      ElseIf p_sect = 2 And s_sect = 1 And f_sect = 0 Then
      Do While Not rs.EOF
      On Error Resume Next
         d_date = rs(dbDate(t_pos))
         If getDate(d_date, p_date) = True Then
         s = Split(dbField(t_pos), ",")
         For z = 0 To UBound(s)
            f_find = rs(s(z))
            If doSearch(f_find, s_text, f_type) = True Then
'---------------------------------------------------------------------------;
               Call dbRemove(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
            End If
         Next
         End If
      rs.movenext
      Loop
      End If
End If
'***************************************************************************;
End Sub
Private Sub cmdClear_Click()
   f_d.Text = Empty
   f_m.Text = Empty
   f_y.Text = Empty
   t_d.Text = Empty
   t_m.Text = Empty
   t_y.Text = Empty
End Sub
Private Sub cmdClose_Click()
   Unload Me
End Sub
Private Sub Form_Load()

Dim a As Variant
Dim b As Variant
Dim c As Variant
Dim d As Variant

a = Array("Standard", "Date Range")
b = Array("All", "Orders", "Downloads", "Referral Resellers", "Product Resellers", "Referred Customers", "SSContracts", "Assess", "s_iso14000_org", "cd_registration")
c = Array("All", "Name", "Email", "Company", "Fax", "Phone", "Zip", "State", "Country")
d = Array("AND", "OR", "Exact")

debugMode = 1

For i = 0 To UBound(b)
On Error Resume Next
   cmbMethod.Text = "Choose : "
   cmbMethod.AddItem (a(i))
   cmbTable.Text = "Choose : "
   cmbTable.AddItem (b(i))
   cmbField.Text = "Choose : "
   cmbField.AddItem (c(i))
   cmbMethodS.Text = "Choose : "
   cmbMethodS.AddItem (d(i))
Next

'------------------------------------------------------------------; Debug
If debugMode = 1 Then
   txtDebug.Visible = True
   txtDebug.Enabled = True
End If
End Sub
Private Sub Form_Unload(Cancel As Integer)
   Unload Me
   Call dCheck
End Sub

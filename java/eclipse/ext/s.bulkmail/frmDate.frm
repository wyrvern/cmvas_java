VERSION 5.00
Begin VB.Form frmDate 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Addition"
   ClientHeight    =   4095
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5895
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4095
   ScaleWidth      =   5895
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Background 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   4095
      Left            =   0
      ScaleHeight     =   4065
      ScaleWidth      =   5865
      TabIndex        =   14
      Top             =   0
      Width           =   5895
      Begin VB.ComboBox cmbMethodS 
         Height          =   315
         Left            =   1560
         TabIndex        =   29
         Top             =   1560
         Width           =   2055
      End
      Begin VB.TextBox txtDebug 
         Height          =   615
         Left            =   1440
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   28
         Top             =   3360
         Width           =   3015
      End
      Begin VB.ComboBox cmbDatabase 
         Height          =   315
         Left            =   1560
         TabIndex        =   27
         Top             =   120
         Width           =   2055
      End
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
         Top             =   3360
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
         Top             =   3720
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
         Top             =   3360
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
         Top             =   3720
         Width           =   1215
      End
      Begin VB.TextBox f_date 
         Height          =   285
         Index           =   0
         Left            =   1560
         TabIndex        =   4
         Top             =   2280
         Width           =   1335
      End
      Begin VB.TextBox Text1 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   120
         TabIndex        =   20
         Text            =   "From Day :"
         Top             =   2280
         Width           =   1335
      End
      Begin VB.TextBox f_date 
         Height          =   285
         HelpContextID   =   1
         Index           =   1
         Left            =   1560
         TabIndex        =   5
         Top             =   2640
         Width           =   1335
      End
      Begin VB.TextBox Text3 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   120
         TabIndex        =   19
         Text            =   "From Month :"
         Top             =   2640
         Width           =   1335
      End
      Begin VB.TextBox f_date 
         Height          =   285
         Index           =   2
         Left            =   1560
         TabIndex        =   6
         Top             =   3000
         Width           =   1335
      End
      Begin VB.TextBox Text5 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   120
         TabIndex        =   18
         Text            =   "From Year :"
         Top             =   3000
         Width           =   1335
      End
      Begin VB.TextBox f_date 
         Height          =   285
         Index           =   3
         Left            =   4440
         TabIndex        =   7
         Top             =   2280
         Width           =   1335
      End
      Begin VB.TextBox Text7 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   3000
         TabIndex        =   17
         Text            =   "To Day :"
         Top             =   2280
         Width           =   1335
      End
      Begin VB.TextBox f_date 
         Height          =   285
         Index           =   4
         Left            =   4440
         TabIndex        =   8
         Top             =   2640
         Width           =   1335
      End
      Begin VB.TextBox Text9 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   3000
         TabIndex        =   16
         Text            =   "To Month :"
         Top             =   2640
         Width           =   1335
      End
      Begin VB.TextBox f_date 
         Height          =   285
         Index           =   5
         Left            =   4440
         TabIndex        =   9
         Top             =   3000
         Width           =   1335
      End
      Begin VB.TextBox Text11 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   3000
         TabIndex        =   15
         Text            =   "To Year :"
         Top             =   3000
         Width           =   1335
      End
      Begin VB.ComboBox cmbTable 
         Height          =   315
         Left            =   1560
         TabIndex        =   1
         Top             =   840
         Width           =   2055
      End
      Begin VB.ComboBox cmbMethod 
         Height          =   315
         Left            =   1560
         TabIndex        =   0
         Top             =   480
         Width           =   2055
      End
      Begin VB.ComboBox cmbField 
         Height          =   315
         Left            =   1560
         TabIndex        =   2
         Top             =   1200
         Width           =   2055
      End
      Begin VB.TextBox f_search 
         Height          =   285
         Left            =   1560
         TabIndex        =   3
         Top             =   1920
         Width           =   2055
      End
      Begin VB.Label Label5 
         BackColor       =   &H80000005&
         Caption         =   "Select Database  :"
         Height          =   255
         Left            =   120
         TabIndex        =   26
         Top             =   120
         Width           =   1335
      End
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         BackColor       =   &H80000005&
         Caption         =   "Search Method :"
         Height          =   255
         Left            =   120
         TabIndex        =   25
         Top             =   1560
         Width           =   1215
      End
      Begin VB.Label Label2 
         BackColor       =   &H80000005&
         Caption         =   "Select Table :"
         Height          =   255
         Left            =   120
         TabIndex        =   24
         Top             =   840
         Width           =   1095
      End
      Begin VB.Label Label3 
         BackColor       =   &H80000005&
         Caption         =   "Select Method :"
         Height          =   255
         Left            =   120
         TabIndex        =   23
         Top             =   480
         Width           =   1215
      End
      Begin VB.Label Label1 
         BackColor       =   &H80000005&
         Caption         =   "Select Field :"
         Height          =   255
         Left            =   120
         TabIndex        =   22
         Top             =   1200
         Width           =   1095
      End
      Begin VB.Label Label4 
         BackColor       =   &H80000005&
         Caption         =   "Search Terms :"
         Height          =   255
         Left            =   120
         TabIndex        =   21
         Top             =   1920
         Width           =   1095
      End
   End
End
Attribute VB_Name = "frmDate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'------------------------------------------------------------------------------;
'  dbRun :
'------------------------------------------------------------------------------;
Function dbAdd(i As Integer, rs As Variant, a As Variant, b As Variant) As Boolean
   'a_str = Empty
   
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
           'txtDebug.Text = txtDebug.Text & rs(j(q)) & vbCrLf
           'txtDebug.Text = txtDebug.Text & rs(j(q)) & vbCrLf
         End If
      'txtDebug.Text = txtDebug.Text & a_str & vbCrLf
      'txtDebug.Text = txtDebug.Text & UBound(j) & ":" & q & ":" & vbCrLf
      Next
         
      'txtDebug.Text = a_str & vbCrLf
      'a_str = "a" & Chr(9) & "b"
      frmMail.grdMain.AddItem (a_str)
      'iCount = iCount + 1
      iCount = frmMail.grdMain.Rows - 2
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
      iCount = iCount - 1
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

If db_selection = 1 Then
   dbSection = Array("s_wp_sales", "s_dl_download", "assess", "s_rs_reseller", "s_cd_upgrade", "cd_registration", "s_iso14000_org", "dblog")
   dbFieldID = Array("s_wp_id", "s_dl_id", "assessid", "s_rs_id", "s_cd_id", "cd_registrationid", "s_iso14000_org_id", "log_id")
   dbCheck = Array("s_wp_email", "s_dl_email", "email", "s_rs_email", "s_cd_email", "emailaddress", "s_iso14000_org_email", "email")
   dbField = Array("s_wp_id,s_wp_id,s_wp_name,s_wp_email,s_wp_phone,s_wp_company,s_wp_country,s_ss_flags,s_wp_date", "s_dl_id,s_dl_type,s_dl_name,s_dl_email,s_dl_phone,s_dl_company,s_dl_country,s_ss_flags,s_dl_date,s_dl_q1,s_dl_q2,s_dl_q3,s_dl_bin", "assessid,assessid,firstname,lastname,email,telephone,companyname,country,flags,currentdate", "s_rs_id,s_rs_id,s_rs_name,s_rs_email,s_rs_phone,s_rs_country,s_rs_country,s_ss_flags,s_rs_date", "s_cd_id,s_cd_id,s_cd_name,s_cd_email,s_cd_phone,s_cd_company,s_cd_country,s_ss_flags,s_cd_date", "cd_registrationid,cd_registrationid,firstname,lastname,emailaddress,phone,companyname,flags,country,registrationdate", "s_iso14000_org_id,s_iso14000_org_id,s_iso14000_org_name,s_iso14000_org_email,s_iso14000_org_phone,s_iso14000_org_os,s_iso14000_org_country,flags,s_iso14000_org_date", "log_id,log_id,full_name,email,date,date,date,s_ss_flags")
'  dbDate = Array("currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate")
   dbDate = Array("s_wp_date", "s_dl_date", "currentdate", "s_rs_date", "s_cd_upgrade", "registrationdate", "s_iso14000_org_date", "date")
ElseIf db_selection = 2 Then
   dbSection = Array("s_lc_contact", "s_lc_download", "s_lc_book")
   dbFieldID = Array("s_lc_id", "s_lc_id", "s_lc_id")
   dbCheck = Array("s_lc_email", "s_lc_email", "s_lc_email")
   dbField = Array("s_lc_id,s_lc_id,s_lc_name,s_lc_email,s_lc_company,s_lc_city,s_lc_country,s_lc_flags,s_lc_phone,s_lc_os,s_lc_date", "s_lc_id,s_lc_section,s_lc_name,s_lc_email,s_lc_company,s_lc_city,s_lc_country,s_lc_flags,s_lc_phone,s_lc_os,s_lc_date,s_lc_register", "s_lc_id,s_lc_id,s_lc_name,s_lc_email,s_lc_name,s_lc_name,s_lc_name,s_lc_flags")
   dbDate = Array("currentdate", "currentdate", "currentdate")
End If

' dbSection = Array("orders", "downloads", "assess", "referredcustomers", "referralresellers", "productresellers", "cd_registration", "s_iso14000_org")
' dbFieldID = Array("orderid", "dnid", "assessid", "rcid", "rrid", "prid", "cd_registrationid", "s_iso14000_org_id")
' dbCheck = Array("customeremail", "email", "email", "rcemail", "rremail", "email", "emailaddress", "s_iso14000_org_email")
' dbField = Array("orderid,customername,customeremail,customerphone,customercompany,customercountry,currentdate,flags", "dnid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "assessid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "rcid,rcfirstname,rclastname,rcemail,rcposition,rcposition,rccountry,rccurrentdate,flags", "rrid,rrfirstname,rrlastname,rremail,rrtelephone,rrcompanyname,rrcountry,currentdate,flags", "prid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "cd_registrationid,firstname,lastname,emailaddress,phone,companyname,country,currentdate,flags", "s_iso14000_org_id,s_iso14000_org_name,s_iso14000_org_email,s_iso14000_org_phone,s_iso14000_org_os,s_iso14000_org_country,currentdate,flags")
' dbDate = Array("currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate")

' dbField = Array("CustomerEmail,CustomerName,Date", "Email,FirstName,LastName,CurrentDate", "Email,FirstName,LastName,CurrentDate", "RREmail,RRFirstName,RRLastName,RRCurrentDate", "RCEmail,RCFirstName,RCLastName,RCCurrentDate", "Email,FirstName,LastName,CurrentDate", "CustomerEmail,CustomerName,Date", "s_iso14000_org_email,s_iso14000_org_name,s_iso14000_org_date")
' dbField = Array("orderid,customername,customeremail,customerphone,customercompany,customercountry,currentdate,flags", "dnid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "assessid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "rcid,rcfirstname,rclastname,rcemail,rcposition,rcposition,rccountry,rccurrentdate,flags", "rrid,rrfirstname,rrlastname,rremail,rrtelephone,rrcompanyname,rrcountry,rrcurrentdate,flags", "prid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "cd_registrationid,firstname,lastname,emailaddress,phone,companyname,country,registrationdate", "s_iso14000_org_id,s_iso14000_org_name,s_iso14000_org_email,s_iso14000_org_os,s_iso14000_org_country,s_iso14000_org_date,flags")
' dbArrayID = Split(dbFieldID, ",")

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
ElseIf cmbMethodS.Text = "None" Then
   f_type = 3
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

'MsgBox (t_sect & ":" & p_sect & ":" & s_sect & ":" & f_type & ":" & f_sect)

'===========================================================================;
If t_sect = 0 Then
   For x = 0 To UBound(dbSection)

      sql = "SELECT * FROM " & dbSection(x)
    ' sql = "SELECT * FROM " & dbSection(0)
    ' Set rs = conn.Execute(sql)

      Set rs = New ADODB.Recordset
      rs.CursorType = adOpenStatic
      rs.Open dbSection(x), conn, , , adCmdTable
      iTotal = rs.RecordCount

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
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
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
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 0 And s_sect = 0 And f_sect = 0 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF

      On Error Resume Next
         s = Split(dbField(x), ",")
         For z = 0 To UBound(s)
            If InStr(LCase(s(z)), LCase(field)) <> 0 Then
               
'              f_find = rs(s(z))
'---------------------------------------------------------------------------;
               
               Call dbAdd(x, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
            End If
         Next
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
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
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
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
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
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
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
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

   Set rs = New ADODB.Recordset
   rs.CursorType = adOpenStatic
   rs.Open dbSection(t_pos), conn, , , adCmdTable
   iTotal = rs.RecordCount
   
   'Set rs = conn.Execute(sql)
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
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
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
'#####################################################################
      'p = p + 1
      
      'txtDebug.Text = txtDebug.Text & ":" & f_find
      'If p = 10 Then
      'Exit Do
      'End If
'#####################################################################
               If doSearch(f_find, s_text, f_type) = True Then
'---------------------------------------------------------------------------;
               
               Call dbAdd(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
               End If
            End If
         Next
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
      Loop
      Call MouseChange("frmDate", "Normal")

      ElseIf p_sect = 0 And s_sect = 0 And f_sect = 0 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF

'#####################################################################
      'p = p + 1
      'txtDebug.Text = txtDebug.Text & p
      'If p = 10 Then
      'Exit Do
      'End If
'#####################################################################
      
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
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
'---------------------------------------------------------------------------;

'---------------------------------------------------------------------------;
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
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
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
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 2 And s_sect = 0 And f_sect = 0 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF

      On Error Resume Next
         d_date = rs(dbDate(t_pos))
         'txtDebug.Text = txtDebug.Text & rs("s_wp_email") & vbCrLf
         If getDate(d_date, p_date) = True Then
               'txtDebug.Text = "!"
'---------------------------------------------------------------------------;
               
               Call dbAdd(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
         End If
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
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
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
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

' dbSection = Array("s_wp_sales", "s_dl_download", "assess", "s_rs_reseller", "s_cd_upgrade", "cd_registration", "s_iso14000_org", "dblog")
' dbFieldID = Array("s_wp_id", "s_dl_id", "assessid", "s_rs_id", "s_cd_id", "cd_registrationid", "s_iso14000_org_id", "log_id")
' dbCheck = Array("s_wp_email", "s_dl_email", "email", "s_rs_email", "s_cd_email", "emailaddress", "s_iso14000_org_email", "email")
' dbField = Array("s_wp_id,s_wp_name,s_wp_email,s_wp_phone,s_wp_company,s_wp_country,currentdate,s_ss_flags", "s_dl_id,s_dl_name,s_dl_email,s_dl_phone,s_dl_company,s_dl_country,currentdate,s_ss_flags", "assessid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "s_rs_id,s_rs_name,s_rs_email,s_rs_phone,s_rs_country,s_rs_country,currentdate,s_ss_flags", "s_cd_id,s_cd_name,s_cd_email,s_cd_phone,s_cd_company,s_cd_country,currentdate,s_ss_flags", "cd_registrationid,firstname,lastname,emailaddress,phone,companyname,country,currentdate,flags", "s_iso14000_org_id,s_iso14000_org_name,s_iso14000_org_email,s_iso14000_org_phone,s_iso14000_org_os,s_iso14000_org_country,currentdate,flags", "log_id,action_type,full_name,email,currentdate")
' dbField = Array("s_wp_id,s_wp_name,s_wp_email,s_wp_phone,s_wp_company,s_wp_country,currentdate,s_ss_flags", "s_dl_id,s_dl_name,s_dl_email,s_dl_phone,s_dl_company,s_dl_country,currentdate,s_ss_flags,s_dl_q1,s_dl_q2,s_dl_q3", "assessid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "s_rs_id,s_rs_name,s_rs_email,s_rs_phone,s_rs_country,s_rs_country,currentdate,s_ss_flags", "s_cd_id,s_cd_name,s_cd_email,s_cd_phone,s_cd_company,s_cd_country,currentdate,s_ss_flags", "cd_registrationid,firstname,lastname,emailaddress,phone,companyname,country,currentdate,flags", "s_iso14000_org_id,s_iso14000_org_name,s_iso14000_org_email,s_iso14000_org_phone,s_iso14000_org_os,s_iso14000_org_country,currentdate,flags", "log_id,full_name,email,currentdate,s_ss_flags")
' dbDate = Array("currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate")
 
If db_selection = 1 Then
   dbSection = Array("s_wp_sales", "s_dl_download", "assess", "s_rs_reseller", "s_cd_upgrade", "cd_registration", "s_iso14000_org", "dblog")
   dbFieldID = Array("s_wp_id", "s_dl_id", "assessid", "s_rs_id", "s_cd_id", "cd_registrationid", "s_iso14000_org_id", "log_id")
   dbCheck = Array("s_wp_email", "s_dl_email", "email", "s_rs_email", "s_cd_email", "emailaddress", "s_iso14000_org_email", "email")
   dbField = Array("s_wp_id,s_wp_name,s_wp_email,s_wp_phone,s_wp_company,s_wp_country,s_wp_date,s_ss_flags", "s_dl_id,s_dl_name,s_dl_email,s_dl_phone,s_dl_company,s_dl_country,s_dl_date,s_ss_flags,s_dl_q1,s_dl_q2,s_dl_q3,s_dl_bin", "assessid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "s_rs_id,s_rs_name,s_rs_email,s_rs_phone,s_rs_country,s_rs_country,s_rs_date,s_ss_flags", "s_cd_id,s_cd_name,s_cd_email,s_cd_phone,s_cd_company,s_cd_country,s_cd_date,s_ss_flags", "cd_registrationid,firstname,lastname,emailaddress,phone,companyname,country,flags,registrationdate", "s_iso14000_org_id,s_iso14000_org_name,s_iso14000_org_email,s_iso14000_org_phone,s_iso14000_org_os,s_iso14000_org_country,s_iso14000_org_date,flags", "log_id,full_name,email,date,currentdate,currentdate,currentdate,s_ss_flags")
'  dbDate = Array("currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate")
   dbDate = Array("s_wp_date", "s_dl_date", "currentdate", "s_rs_date", "s_cd_upgrade", "registrationdate", "s_iso14000_org_date", "date")
ElseIf db_selection = 2 Then
   dbSection = Array("s_lc_contact", "s_lc_download", "s_lc_book")
   dbFieldID = Array("s_lc_id", "s_lc_id", "s_lc_id")
   dbCheck = Array("s_lc_email", "s_lc_email", "s_lc_email")
   dbField = Array("s_lc_id,s_lc_name,s_lc_email,s_lc_company,s_lc_city,s_lc_country,s_lc_phone,s_lc_flags,s_lc_os,s_lc_date", "s_lc_id,s_lc_name,s_lc_email,s_lc_company,s_lc_city,s_lc_country,s_lc_phone,s_lc_flags,s_lc_os,s_lc_date,s_lc_register", "s_lc_id,s_lc_name,s_lc_email,s_lc_name,s_lc_name,s_lc_name,s_lc_name,s_lc_flags")
   dbDate = Array("currentdate", "currentdate", "currentdate")
End If

' dbSection = Array("orders", "downloads", "assess", "referredcustomers", "referralresellers", "productresellers", "cd_registration", "s_iso14000_org")
' dbFieldID = Array("orderid", "dnid", "assessid", "rcid", "rrid", "prid", "cd_registrationid", "s_iso14000_org_id")
' dbCheck = Array("customeremail", "email", "email", "rcemail", "rremail", "email", "emailaddress", "s_iso14000_org_email")
' dbField = Array("orderid,customername,customeremail,customerphone,customercompany,customercountry,currentdate,flags", "dnid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "assessid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "rcid,rcfirstname,rclastname,rcemail,rcposition,rcposition,rccountry,rccurrentdate,flags", "rrid,rrfirstname,rrlastname,rremail,rrtelephone,rrcompanyname,rrcountry,currentdate,flags", "prid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "cd_registrationid,firstname,lastname,emailaddress,phone,companyname,country,currentdate,flags", "s_iso14000_org_id,s_iso14000_org_name,s_iso14000_org_email,s_iso14000_org_phone,s_iso14000_org_os,s_iso14000_org_country,currentdate,flags")
' dbDate = Array("currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate")

' dbField = Array("CustomerEmail,CustomerName,Date", "Email,FirstName,LastName,CurrentDate", "Email,FirstName,LastName,CurrentDate", "RREmail,RRFirstName,RRLastName,RRCurrentDate", "RCEmail,RCFirstName,RCLastName,RCCurrentDate", "Email,FirstName,LastName,CurrentDate", "CustomerEmail,CustomerName,Date", "s_iso14000_org_email,s_iso14000_org_name,s_iso14000_org_date")
' dbField = Array("orderid,customername,customeremail,customerphone,customercompany,customercountry,currentdate,flags", "dnid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "assessid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "rcid,rcfirstname,rclastname,rcemail,rcposition,rcposition,rccountry,rccurrentdate,flags", "rrid,rrfirstname,rrlastname,rremail,rrtelephone,rrcompanyname,rrcountry,rrcurrentdate,flags", "prid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "cd_registrationid,firstname,lastname,emailaddress,phone,companyname,country,registrationdate", "s_iso14000_org_id,s_iso14000_org_name,s_iso14000_org_email,s_iso14000_org_os,s_iso14000_org_country,s_iso14000_org_date,flags")
' dbArrayID = Split(dbFieldID, ",")

'dbSection = Array("orders", "downloads", "assess", "referredcustomers", "referralresellers", "productresellers", "cd_registration", "s_iso14000_org")
'dbFieldID = Array("orderid", "dnid", "assessid", "rcid", "rrid", "prid", "cd_registrationid", "s_iso14000_org_id")
'dbField = Array("CustomerEmail,CustomerName,Date", "Email,FirstName,LastName,CurrentDate", "Email,FirstName,LastName,CurrentDate", "RREmail,RRFirstName,RRLastName,RRCurrentDate", "RCEmail,RCFirstName,RCLastName,RCCurrentDate", "Email,FirstName,LastName,CurrentDate", "CustomerEmail,CustomerName,Date", "s_iso14000_org_email,s_iso14000_org_name,s_iso14000_org_date")
'dbCheck = Array("customeremail", "email", "email", "rcemail", "rremail", "email", "emailaddress", "s_iso14000_org_email")
'dbField = Array("orderid,customername,customeremail,customerphone,customercompany,customercountry,currentdate,flags", "dnid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "assessid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "rcid,rcfirstname,rclastname,rcemail,rcposition,rcposition,rccountry,rccurrentdate,flags", "rrid,rrfirstname,rrlastname,rremail,rrtelephone,rrcompanyname,rrcountry,rrcurrentdate,flags", "prid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "cd_registrationid,firstname,lastname,emailaddress,phone,companyname,country,registrationdate", "s_iso14000_org_id,s_iso14000_org_name,s_iso14000_org_email,s_iso14000_org_os,s_iso14000_org_country,s_iso14000_org_date,flags")
'dbField = Array("orderid,customername,customeremail,customerphone,customercompany,customercountry,currentdate,flags", "dnid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "assessid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "rcid,rcfirstname,rclastname,rcemail,rcposition,rcposition,rccountry,rccurrentdate,flags", "rrid,rrfirstname,rrlastname,rremail,rrtelephone,rrcompanyname,rrcountry,currentdate,flags", "prid,firstname,lastname,email,telephone,companyname,country,currentdate,flags", "cd_registrationid,firstname,lastname,emailaddress,phone,companyname,country,registrationdate", "s_iso14000_org_id,s_iso14000_org_name,s_iso14000_org_email,s_iso14000_org_os,s_iso14000_org_country,currentdate,flags")
'dbDate = Array("currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate", "currentdate")
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
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
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
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
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
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
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
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
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
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
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
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
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
               Call dbRemove(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
            End If
         Next
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
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
               Call dbRemove(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
               End If
            End If
         Next
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 0 And s_sect = 0 And f_sect = 0 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         s = Split(dbField(t_pos), ",")
         For z = 0 To UBound(s)
'            f_find = rs(s(z))
'---------------------------------------------------------------------------;
               Call dbRemove(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
         Next
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 0 And s_sect = 0 And f_sect = 1 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         s = Split(dbField(t_pos), ",")
         For z = 0 To UBound(s)
'            f_find = rs(s(z))
'---------------------------------------------------------------------------;
               Call dbRemove(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
         Next
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
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
               Call dbRemove(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
               End If
            End If
         Next
         End If
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
      Loop
      Call MouseChange("frmDate", "Normal")
      ElseIf p_sect = 2 And s_sect = 0 And f_sect = 0 Then
      Call MouseChange("frmDate", "Wait")
      Do While Not rs.EOF
      On Error Resume Next
         d_date = rs(dbDate(t_pos))
         If getDate(d_date, p_date) = True Then
'---------------------------------------------------------------------------;
               Call dbRemove(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
         End If
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
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
               Call dbRemove(t_pos, rs, dbCheck, dbField)
'---------------------------------------------------------------------------;
            End If
         Next
         End If
      frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal
      rs.MoveNext
      Loop
      Call MouseChange("frmDate", "Normal")
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
a = Array("isotop", "Crystal Clear")

For i = 0 To UBound(a)
On Error Resume Next
   cmbDatabase.Text = "Choose : "
   cmbDatabase.AddItem (a(i))
Next

'------------------------------------------------------------------; Debug
If debugMode = 1 Then
   txtDebug.Visible = True
   txtDebug.Enabled = True
End If

End Sub
Private Sub cmbDatabase_Click()

cmbMethod.Clear
cmbTable.Clear
cmbField.Clear
cmbField.Clear
cmbMethodS.Clear

If cmbDatabase.Text = "isotop" Then
   dbfile = "\isotop.mdb"
   db_selection = 1
ElseIf cmbDatabase.Text = "Crystal Clear" Then
   dbfile = "\crystalclear.mdb"
   db_selection = 2
End If

Dim a As Variant
Dim b As Variant
Dim c As Variant
Dim d As Variant

a = Array("Standard", "Date Range")
'b = Array("All", "Orders", "Downloads", "Referral Resellers", "Product Resellers", "Referred Customers", "SSContracts", "Assess", "s_iso14000_org", "cd_registration")
'c = Array("All", "Name", "Email", "Company", "Fax", "Phone", "Zip", "State", "Country")

If db_selection = 0 Then
   b = Array("Select Database")
ElseIf db_selection = 1 Then
   b = Array("All", "s_wp_sales", "s_dl_download", "s_rs_reseller", "assess", "s_cd_upgrade", "cd_registration", "s_iso14000_org", "dblog")
   c = Array("All", "Type", "Name", "Email", "Company", "Fax", "Phone", "Zip", "State", "Country", "s_dl_q1", "s_dl_q2", "s_dl_q3", "s_dl_bin")
ElseIf db_selection = 2 Then
   b = Array("s_lc_contact", "s_lc_download", "s_lc_book")
   c = Array("All", "Section", "Name", "Email", "Company", "Fax", "Phone", "Zip", "State", "Country", "s_dl_q1", "s_dl_q2", "s_dl_q3", "s_dl_bin")
End If
   
d = Array("AND", "OR", "Exact", "None")

debugMode = 0

For i = 0 To UBound(c)
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

'//--------- Db options

If db_selection <> 0 Then
   Set conn = CreateObject("ADODB.Connection")
   With conn
      .Provider = "Microsoft.Jet.OLEDB.4.0"
      .ConnectionString = App.Path & dbfile
      .Open
   End With
End If

Call Set_Grid

End Sub
Private Sub Form_Unload(Cancel As Integer)
   Unload Me
   Call dCheck
End Sub
Private Sub Set_Grid()


If db_selection = 1 Then
   With frmMail.grdMain
      .Clear
      .Rows = 2
      .FormatString = "<ID |<Type |<Name |<Email |<Telephone |<Company |<Country |<Flags |<Date "
      .ColWidth(0) = 1000
      .ColWidth(1) = 1500
      .ColWidth(2) = 1500
      .ColWidth(3) = 1500
      .ColWidth(4) = 1500
      .ColWidth(5) = 1500
      .ColWidth(6) = 1500
      .ColWidth(7) = 1500
      .ColWidth(8) = 1500
   End With
ElseIf db_selection = 2 Then
   With frmMail.grdMain
      .Clear
      .Rows = 2
      .FormatString = "<ID |<Section |<Name |<Email |<Company |<City |<Country |<Phone |<Date |<Flags "
      .ColWidth(0) = 1000
      .ColWidth(1) = 1500
      .ColWidth(2) = 1500
      .ColWidth(3) = 1500
      .ColWidth(4) = 1500
      .ColWidth(5) = 1500
      .ColWidth(6) = 1500
      .ColWidth(7) = 1500
      .ColWidth(8) = 1500
   End With
End If


End Sub

Private Sub Picture2_Click()

End Sub

VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Begin VB.Form frmDate 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Addition"
   ClientHeight    =   3375
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   5895
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3375
   ScaleWidth      =   5895
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Background 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   3375
      Left            =   0
      ScaleHeight     =   3345
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
         Top             =   2640
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
         Top             =   3000
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
         Top             =   2640
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
         Top             =   3000
         Width           =   1215
      End
      Begin VB.TextBox f_date 
         Height          =   285
         Index           =   0
         Left            =   1560
         TabIndex        =   4
         Top             =   1560
         Width           =   1335
      End
      Begin VB.TextBox Text1 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   120
         TabIndex        =   21
         Text            =   "From Day :"
         Top             =   1560
         Width           =   1335
      End
      Begin VB.TextBox f_date 
         Height          =   285
         HelpContextID   =   1
         Index           =   1
         Left            =   1560
         TabIndex        =   5
         Top             =   1920
         Width           =   1335
      End
      Begin VB.TextBox Text3 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   120
         TabIndex        =   20
         Text            =   "From Month :"
         Top             =   1920
         Width           =   1335
      End
      Begin VB.TextBox f_date 
         Height          =   285
         Index           =   2
         Left            =   1560
         TabIndex        =   6
         Top             =   2280
         Width           =   1335
      End
      Begin VB.TextBox Text5 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   120
         TabIndex        =   19
         Text            =   "From Year :"
         Top             =   2280
         Width           =   1335
      End
      Begin VB.TextBox f_date 
         Height          =   285
         Index           =   3
         Left            =   4440
         TabIndex        =   7
         Top             =   1560
         Width           =   1335
      End
      Begin VB.TextBox Text7 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   3000
         TabIndex        =   18
         Text            =   "To Day :"
         Top             =   1560
         Width           =   1335
      End
      Begin VB.TextBox f_date 
         Height          =   285
         Index           =   4
         Left            =   4440
         TabIndex        =   8
         Top             =   1920
         Width           =   1335
      End
      Begin VB.TextBox Text9 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   3000
         TabIndex        =   17
         Text            =   "To Month :"
         Top             =   1920
         Width           =   1335
      End
      Begin VB.TextBox f_date 
         Height          =   285
         Index           =   5
         Left            =   4440
         TabIndex        =   9
         Top             =   2280
         Width           =   1335
      End
      Begin VB.TextBox Text11 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   3000
         TabIndex        =   16
         Text            =   "To Year :"
         Top             =   2280
         Width           =   1335
      End
      Begin VB.ComboBox cmbTable 
         Height          =   315
         Left            =   1440
         TabIndex        =   1
         Top             =   480
         Width           =   2415
      End
      Begin VB.ComboBox cmbMethod 
         Height          =   315
         Left            =   1440
         TabIndex        =   0
         Top             =   120
         Width           =   2415
      End
      Begin VB.ComboBox cmbField 
         Height          =   315
         Left            =   1440
         TabIndex        =   2
         Top             =   840
         Width           =   2415
      End
      Begin VB.TextBox f_search 
         Height          =   285
         Left            =   1440
         TabIndex        =   3
         Top             =   1200
         Width           =   2415
      End
      Begin RichTextLib.RichTextBox txtDebug 
         Height          =   615
         Left            =   1440
         TabIndex        =   15
         Top             =   2640
         Width           =   3015
         _ExtentX        =   5318
         _ExtentY        =   1085
         _Version        =   393217
         Enabled         =   -1  'True
         ScrollBars      =   2
         TextRTF         =   $"frmDate.frx":0000
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
         Top             =   150
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
         Top             =   1200
         Width           =   1095
      End
   End
End
Attribute VB_Name = "frmDate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Function doSearch(str As String, find As String, f_type As Integer) As Boolean

Dim f     As Integer
Dim c     As Integer
Dim s_len As Integer
Dim nf    As Integer

If str <> "" Then
   s = LCase(str)
   s_len = Len(s)
   If f_type = 0 Then
      For x = 0 To s_len
         c = c + 1
         If InStr(Mid(s, c, s_len), find) <> 0 Then
            f = 1
            nf = nf + 1
         End If
      Next
      c = 0
   ElseIf f_type = 1 Then
      If InStr(s, find) <> 0 Then
         f = 1
         nf = nf + 1
      End If
   End If
   
   If f = 1 Then
      doSearch = True
   End If
End If

End Function
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

Dim p_search    As String

Dim tableSelect As String
Dim fieldSelect As String
Dim field       As String

Dim t_sect      As Integer
Dim t_pos       As Integer
Dim f_sect      As Integer
Dim p_sect      As Integer

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
ElseIf cmbMethod.Text = "Search" Then
   If f_search.Text = "" Then
      MsgBox ("Please enter a search parameter.")
   Exit Sub
   End If
   p_search = f_search.Text
   p_sect = 1
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

tableSelect = Replace(cmbTable.Text, " ", "")
If tableSelect = "All" Then
   t_sect = 0
ElseIf tableSelect <> "All" Then
   t_sect = 1
   For i = 0 To UBound(dbSection)
      If InStr(dbSection(i), tableSelect) <> 0 Then
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

Dim a_str As String

'------------------------------------------------------------------;
If t_sect = 0 Then
   For x = 0 To UBound(dbSection)
      sql = "SELECT * FROM " & dbSection(x)
      'sql = "SELECT * FROM " & dbSection(0)
      Set rs = conn.Execute(sql)
      If rs.EOF Then
         MsgBox ("No records available in [Table : " & cmbTable.Text & "]")
         Exit Sub
      End If

      If p_sect = 0 Then
         Do While Not rs.EOF
         On Error Resume Next
         '----------------------------------------------- //
         a_str = Empty
         frmMail.StatusBar.Panels(1).Text = "Processing..."
         Call MouseChange("frmDate", "Wait")

         Shift = False
         If InStr(whole, LCase(rs(dbCheck(x)))) <> 0 Then
            Shift = True
         ElseIf IsNull(LCase(rs(dbCheck(x)))) = True Then
            Shift = True
         End If

         If Shift = False Then
            j = Split(dbField(x), ",")
            For q = 0 To UBound(j)
               If j(q) = "firstname" Then
                  a_str = a_str & rs(j(q)) & " " & rs(j(q + 1)) & Chr(9)
                  q = q + 1
               Else
                  a_str = a_str & rs(j(q)) & Chr(9)
               End If
            Next
            frmMail.grdMain.AddItem (a_str)
         End If
         whole = whole & " " & LCase(rs(dbCheck(x)))
         Call MouseChange("frmDate", "Normal")
         frmMail.StatusBar.Panels(1).Text = "Ready"
         '----------------------------------------------- //
         rs.movenext
         Loop
      ElseIf p_sect = 1 Then
         Do While Not rs.EOF
         On Error Resume Next
         s_find = f_search.Text
         If f_sect = 0 Then
            s = Split(dbField(x), ",")
            For z = 0 To UBound(s)
               f_find = rs(s(z))
               If doSearch(f_find, p_search, 0) = True Then
               '----------------------------------------------- //
               a_str = Empty
               frmMail.StatusBar.Panels(1).Text = "Processing..."
               Call MouseChange("frmDate", "Wait")

               Shift = False
               If InStr(whole, LCase(rs(dbCheck(x)))) <> 0 Then
                  Shift = True
               ElseIf IsNull(LCase(rs(dbCheck(x)))) = True Then
                  Shift = True
               End If

               If Shift = False Then
                  j = Split(dbField(x), ",")
                  For q = 0 To UBound(j)
                     If j(q) = "firstname" Then
                        a_str = a_str & rs(j(q)) & " " & rs(j(q + 1)) & Chr(9)
                        q = q + 1
                     Else
                        a_str = a_str & rs(j(q)) & Chr(9)
                     End If
                  Next
                  frmMail.grdMain.AddItem (a_str)
               End If
               whole = whole & " " & LCase(rs(dbCheck(x)))
               Call MouseChange("frmDate", "Normal")
               frmMail.StatusBar.Panels(1).Text = "Ready"
               '----------------------------------------------- //
'------------------------------------------------------------------;
               End If
            Next
         ElseIf f_sect = 1 Then
            s = Split(dbField(x), ",")
            For z = 0 To UBound(s)
               If InStr(0, s(z), field) <> 0 Then
                  f_find = rs(s(z))
                  If doSearch(f_find, p_search, 0) = True Then
               '----------------------------------------------- //
               a_str = Empty
               frmMail.StatusBar.Panels(1).Text = "Processing..."
               Call MouseChange("frmDate", "Wait")

               Shift = False
               If InStr(whole, LCase(rs(dbCheck(x)))) <> 0 Then
                  Shift = True
               ElseIf IsNull(LCase(rs(dbCheck(x)))) = True Then
                  Shift = True
               End If

               If Shift = False Then
                  j = Split(dbField(x), ",")
                  For q = 0 To UBound(j)
                     If j(q) = "firstname" Then
                        a_str = a_str & rs(j(q)) & " " & rs(j(q + 1)) & Chr(9)
                        q = q + 1
                     Else
                        a_str = a_str & rs(j(q)) & Chr(9)
                     End If
                  Next
                  frmMail.grdMain.AddItem (a_str)
               End If
               whole = whole & " " & LCase(rs(dbCheck(x)))
               Call MouseChange("frmDate", "Normal")
               frmMail.StatusBar.Panels(1).Text = "Ready"
               '----------------------------------------------- //
'------------------------------------------------------------------;
                  End If
               End If
            Next
         End If
         rs.movenext
         Loop
      ElseIf p_sect = 2 Then
         Do While Not rs.EOF
         On Error Resume Next

         d_date = rs(dbDate(x))
         If getDate(d_date, p_date) = True Then
            '----------------------------------------------- //
            a_str = Empty
            frmMail.StatusBar.Panels(1).Text = "Processing..."
            Call MouseChange("frmDate", "Wait")

            Shift = False
            If InStr(whole, LCase(rs(dbCheck(x)))) <> 0 Then
               Shift = True
            ElseIf IsNull(LCase(rs(dbCheck(x)))) = True Then
               Shift = True
            End If

            If Shift = False Then
               j = Split(dbField(x), ",")
               For q = 0 To UBound(j)
                  If j(q) = "firstname" Then
                     a_str = a_str & rs(j(q)) & " " & rs(j(q + 1)) & Chr(9)
                     q = q + 1
                  Else
                     a_str = a_str & rs(j(q)) & Chr(9)
                  End If
               Next
               frmMail.grdMain.AddItem (a_str)
            End If
            whole = whole & " " & LCase(rs(dbCheck(x)))
            Call MouseChange("frmDate", "Normal")
            frmMail.StatusBar.Panels(1).Text = "Ready"
            '----------------------------------------------- //
         End If

         rs.movenext
         Loop
      End If
   Next
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
   If p_sect = 0 Then
      Do While Not rs.EOF
      On Error Resume Next
'------------------------------------------------------------------;
            '----------------------------------------------- //
            a_str = Empty
            frmMail.StatusBar.Panels(1).Text = "Processing..."
            Call MouseChange("frmDate", "Wait")

            Shift = False
            If InStr(whole, LCase(rs(dbCheck(t_pos)))) <> 0 Then
               Shift = True
            ElseIf IsNull(LCase(rs(dbCheck(t_pos)))) = True Then
               Shift = True
            End If

            If Shift = False Then
               j = Split(dbField(t_pos), ",")
               For q = 0 To UBound(j)
                  If j(q) = "firstname" Then
                     a_str = a_str & rs(j(q)) & " " & rs(j(q + 1)) & Chr(9)
                     q = q + 1
                  Else
                     a_str = a_str & rs(j(q)) & Chr(9)
                  End If
               Next
               frmMail.grdMain.AddItem (a_str)
            End If
            whole = whole & " " & LCase(rs(dbCheck(t_pos)))
            Call MouseChange("frmDate", "Normal")
            frmMail.StatusBar.Panels(1).Text = "Ready"
            '----------------------------------------------- //
      rs.movenext
      Loop
   ElseIf p_sect = 1 Then
      Do While Not rs.EOF
      On Error Resume Next
      s_find = f_search.Text
      If f_sect = 0 Then
         s = Split(dbField(t_pos), ",")
         For z = 0 To UBound(s)
            f_find = rs(s(z))
            If doSearch(f_find, p_search, 0) = True Then
'------------------------------------------------------------------;
            '----------------------------------------------- //
            a_str = Empty
            frmMail.StatusBar.Panels(1).Text = "Processing..."
            Call MouseChange("frmDate", "Wait")

            Shift = False
            If InStr(whole, LCase(rs(dbCheck(t_pos)))) <> 0 Then
               Shift = True
            ElseIf IsNull(LCase(rs(dbCheck(t_pos)))) = True Then
               Shift = True
            End If

            If Shift = False Then
               j = Split(dbField(t_pos), ",")
               For q = 0 To UBound(j)
                  If j(q) = "firstname" Then
                     a_str = a_str & rs(j(q)) & " " & rs(j(q + 1)) & Chr(9)
                     q = q + 1
                  Else
                     a_str = a_str & rs(j(q)) & Chr(9)
                  End If
               Next
               frmMail.grdMain.AddItem (a_str)
            End If
            whole = whole & " " & LCase(rs(dbCheck(t_pos)))
            Call MouseChange("frmDate", "Normal")
            frmMail.StatusBar.Panels(1).Text = "Ready"
            '----------------------------------------------- //
            End If
         Next
      ElseIf f_sect = 1 Then
         s = Split(dbField(t_pos), ",")
         For z = 0 To UBound(s)
            If InStr(0, s(z), field) <> 0 Then
               f_find = rs(s(z))
               If doSearch(f_find, p_search, 0) = True Then
            '----------------------------------------------- //
            a_str = Empty
            frmMail.StatusBar.Panels(1).Text = "Processing..."
            Call MouseChange("frmDate", "Wait")

            Shift = False
            If InStr(whole, LCase(rs(dbCheck(t_pos)))) <> 0 Then
               Shift = True
            ElseIf IsNull(LCase(rs(dbCheck(t_pos)))) = True Then
               Shift = True
            End If

            If Shift = False Then
               j = Split(dbField(t_pos), ",")
               For q = 0 To UBound(j)
                  If j(q) = "firstname" Then
                     a_str = a_str & rs(j(q)) & " " & rs(j(q + 1)) & Chr(9)
                     q = q + 1
                  Else
                     a_str = a_str & rs(j(q)) & Chr(9)
                  End If
               Next
               frmMail.grdMain.AddItem (a_str)
            End If
            whole = whole & " " & LCase(rs(dbCheck(t_pos)))
            Call MouseChange("frmDate", "Normal")
            frmMail.StatusBar.Panels(1).Text = "Ready"
'------------------------------------------------------------------;
               End If
            End If
         Next
      End If
      rs.movenext
      Loop
   ElseIf p_sect = 2 Then
      Do While Not rs.EOF
      On Error Resume Next
      d_date = rs("CurrentDate")
      If getDate(d_date, p_date) = True Then
            '----------------------------------------------- //
            a_str = Empty
            frmMail.StatusBar.Panels(1).Text = "Processing..."
            Call MouseChange("frmDate", "Wait")

            Shift = False
            If InStr(whole, LCase(rs(dbCheck(t_pos)))) <> 0 Then
               Shift = True
            ElseIf IsNull(LCase(rs(dbCheck(t_pos)))) = True Then
               Shift = True
            End If

            If Shift = False Then
               j = Split(dbField(t_pos), ",")
               For q = 0 To UBound(j)
                  If j(q) = "firstname" Then
                     a_str = a_str & rs(j(q)) & " " & rs(j(q + 1)) & Chr(9)
                     q = q + 1
                  Else
                     a_str = a_str & rs(j(q)) & Chr(9)
                  End If
               Next
               frmMail.grdMain.AddItem (a_str)
            End If
            whole = whole & " " & LCase(rs(dbCheck(x)))
            Call MouseChange("frmDate", "Normal")
            frmMail.StatusBar.Panels(1).Text = "Ready"
            '----------------------------------------------- //
'------------------------------------------------------------------;
      End If
      rs.movenext
      Loop
   End If
End If
'------------------------------------------------------------------;

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

Dim p_search    As String

Dim tableSelect As String
Dim fieldSelect As String
Dim field       As String

Dim t_sect      As Integer
Dim t_pos       As Integer
Dim f_sect      As Integer
Dim p_sect      As Integer

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
ElseIf cmbMethod.Text = "Search" Then
   If f_search.Text = "" Then
      MsgBox ("Please enter a search parameter.")
   Exit Sub
   End If
   p_search = f_search.Text
   p_sect = 1
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

tableSelect = Replace(cmbTable.Text, " ", "")
If tableSelect = "All" Then
   t_sect = 0
ElseIf tableSelect <> "All" Then
   t_sect = 1
   For i = 0 To UBound(dbSection)
      If InStr(dbSection(i), tableSelect) <> 0 Then
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

Dim a_str As String

'------------------------------------------------------------------;
If t_sect = 0 Then
   For x = 0 To UBound(dbSection)
      sql = "SELECT * FROM " & dbSection(x)
      'sql = "SELECT * FROM " & dbSection(0)
      Set rs = conn.Execute(sql)
      If rs.EOF Then
         MsgBox ("No records available in [Table : " & cmbTable.Text & "]")
         Exit Sub
      End If

      If p_sect = 0 Then
         Do While Not rs.EOF
         On Error Resume Next
'------------------------------------------------------------------;
   frmMail.StatusBar.Panels(1).Text = "Processing..."
   Call MouseChange("frmMail", "Wait")

   rowLimit = frmMail.grdMain.Rows
   For i = 1 To rowLimit
   If i = rowLimit Then
      Exit For
   End If

   If LCase(frmMail.grdMain.TextMatrix(i, 1)) = LCase(rs(dbCheck(x))) Then
      frmMail.grdMain.RemoveItem (i)
      rowLimit = rowLimit - 1
      i = i - 1
   End If

   Next i
   Call MouseChange("frmMail", "Normal")
   frmMail.StatusBar.Panels(1).Text = "Ready"
'------------------------------------------------------------------;
         rs.movenext
         Loop
      ElseIf p_sect = 1 Then
         Do While Not rs.EOF
         On Error Resume Next
         s_find = f_search.Text
         If f_sect = 0 Then
            s = Split(dbField(x), ",")
            For z = 0 To UBound(s)
               f_find = rs(s(z))
               If doSearch(f_find, p_search, 0) = True Then
'------------------------------------------------------------------;
   frmMail.StatusBar.Panels(1).Text = "Processing..."
   Call MouseChange("frmMail", "Wait")

   rowLimit = frmMail.grdMain.Rows
   For i = 1 To rowLimit
   If i = rowLimit Then
      Exit For
   End If

   If LCase(frmMail.grdMain.TextMatrix(i, 1)) = LCase(rs(dbCheck(x))) Then
      frmMail.grdMain.RemoveItem (i)
      rowLimit = rowLimit - 1
      i = i - 1
   End If

   Next i
   Call MouseChange("frmMail", "Normal")
   frmMail.StatusBar.Panels(1).Text = "Ready"
'------------------------------------------------------------------;
'------------------------------------------------------------------;
               End If
            Next
         ElseIf f_sect = 1 Then
            s = Split(dbField(x), ",")
            For z = 0 To UBound(s)
               If InStr(0, s(z), field) <> 0 Then
                  f_find = rs(s(z))
                  If doSearch(f_find, p_search, 0) = True Then
'------------------------------------------------------------------;
   frmMail.StatusBar.Panels(1).Text = "Processing..."
   Call MouseChange("frmMail", "Wait")

   rowLimit = frmMail.grdMain.Rows
   For i = 1 To rowLimit
   If i = rowLimit Then
      Exit For
   End If

   If LCase(frmMail.grdMain.TextMatrix(i, 1)) = LCase(rs(dbCheck(x))) Then
      frmMail.grdMain.RemoveItem (i)
      rowLimit = rowLimit - 1
      i = i - 1
   End If

   Next i
   Call MouseChange("frmMail", "Normal")
   frmMail.StatusBar.Panels(1).Text = "Ready"
'------------------------------------------------------------------;
'------------------------------------------------------------------;
                  End If
               End If
            Next
         End If
         rs.movenext
         Loop
      ElseIf p_sect = 2 Then
         Do While Not rs.EOF
         On Error Resume Next

         d_date = rs(dbDate(x))
         If getDate(d_date, p_date) = True Then
'------------------------------------------------------------------;
   frmMail.StatusBar.Panels(1).Text = "Processing..."
   Call MouseChange("frmMail", "Wait")

   rowLimit = frmMail.grdMain.Rows
   For i = 1 To rowLimit
   If i = rowLimit Then
      Exit For
   End If

   If LCase(frmMail.grdMain.TextMatrix(i, 1)) = LCase(rs(dbCheck(x))) Then
      frmMail.grdMain.RemoveItem (i)
      rowLimit = rowLimit - 1
      i = i - 1
   End If

   Next i
   Call MouseChange("frmMail", "Normal")
   frmMail.StatusBar.Panels(1).Text = "Ready"
'------------------------------------------------------------------;
         End If

         rs.movenext
         Loop
      End If
   Next
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
   If p_sect = 0 Then
      Do While Not rs.EOF
      On Error Resume Next
'------------------------------------------------------------------;
'------------------------------------------------------------------;
   frmMail.StatusBar.Panels(1).Text = "Processing..."
   Call MouseChange("frmMail", "Wait")

   rowLimit = frmMail.grdMain.Rows
   For i = 1 To rowLimit
   If i = rowLimit Then
      Exit For
   End If

   If LCase(frmMail.grdMain.TextMatrix(i, 1)) = LCase(rs(dbCheck(t_pos))) Then
      frmMail.grdMain.RemoveItem (i)
      rowLimit = rowLimit - 1
      i = i - 1
   End If

   Next i
   Call MouseChange("frmMail", "Normal")
   frmMail.StatusBar.Panels(1).Text = "Ready"
'------------------------------------------------------------------;
      rs.movenext
      Loop
   ElseIf p_sect = 1 Then
      Do While Not rs.EOF
      On Error Resume Next
      s_find = f_search.Text
      If f_sect = 0 Then
         s = Split(dbField(t_pos), ",")
         For z = 0 To UBound(s)
            f_find = rs(s(z))
            If doSearch(f_find, p_search, 0) = True Then
'------------------------------------------------------------------;
'------------------------------------------------------------------;
   frmMail.StatusBar.Panels(1).Text = "Processing..."
   Call MouseChange("frmMail", "Wait")

   rowLimit = frmMail.grdMain.Rows
   For i = 1 To rowLimit
   If i = rowLimit Then
      Exit For
   End If

   If LCase(frmMail.grdMain.TextMatrix(i, 1)) = LCase(rs(dbCheck(t_pos))) Then
      frmMail.grdMain.RemoveItem (i)
      rowLimit = rowLimit - 1
      i = i - 1
   End If

   Next i
   Call MouseChange("frmMail", "Normal")
   frmMail.StatusBar.Panels(1).Text = "Ready"
'------------------------------------------------------------------;
            End If
         Next
      ElseIf f_sect = 1 Then
         s = Split(dbField(t_pos), ",")
         For z = 0 To UBound(s)
            If InStr(0, s(z), field) <> 0 Then
               f_find = rs(s(z))
               If doSearch(f_find, p_search, 0) = True Then
'------------------------------------------------------------------;
   frmMail.StatusBar.Panels(1).Text = "Processing..."
   Call MouseChange("frmMail", "Wait")

   rowLimit = frmMail.grdMain.Rows
   For i = 1 To rowLimit
   If i = rowLimit Then
      Exit For
   End If

   If LCase(frmMail.grdMain.TextMatrix(i, 1)) = LCase(rs(dbCheck(t_pos))) Then
      frmMail.grdMain.RemoveItem (i)
      rowLimit = rowLimit - 1
      i = i - 1
   End If

   Next i
   Call MouseChange("frmMail", "Normal")
   frmMail.StatusBar.Panels(1).Text = "Ready"
'------------------------------------------------------------------;
               End If
            End If
         Next
      End If
      rs.movenext
      Loop
   ElseIf p_sect = 2 Then
      Do While Not rs.EOF
      On Error Resume Next
      d_date = rs("CurrentDate")
      If getDate(d_date, p_date) = True Then
'------------------------------------------------------------------;
      End If
      rs.movenext
      Loop
   End If
End If
'------------------------------------------------------------------;

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

a = Array("Standard", "Date Range", "Search")
b = Array("All", "Orders", "Downloads", "Referral Resellers", "Product Resellers", "Referred Customers", "SSContracts", "Assess", "s_iso14000_org", "cd_registration")
c = Array("All", "Name", "Email", "Company", "Fax", "Telephone", "Zip", "State", "Country")

For i = 0 To UBound(c)
On Error Resume Next
   cmbMethod.Text = "Choose : "
   cmbMethod.AddItem (a(i))
   cmbTable.Text = "Choose : "
   cmbTable.AddItem (b(i))
   cmbField.Text = "Choose : "
   cmbField.AddItem (c(i))
Next

'------------------------------------------------------------------; Debug
txtDebug.Visible = False
txtDebug.Enabled = False
End Sub
Private Sub Form_Unload(Cancel As Integer)
   Unload Me
   Call dCheck
End Sub


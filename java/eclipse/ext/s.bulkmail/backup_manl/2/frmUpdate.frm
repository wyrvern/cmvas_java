VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form frmUpdate 
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   3645
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   6375
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3645
   ScaleWidth      =   6375
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   3615
      Left            =   0
      ScaleHeight     =   3585
      ScaleWidth      =   6345
      TabIndex        =   0
      Top             =   0
      Width           =   6375
      Begin VB.Frame Frame1 
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
         Height          =   3570
         Left            =   0
         TabIndex        =   1
         Top             =   0
         Width           =   6360
         Begin InetCtlsObjects.Inet connInternet 
            Left            =   5520
            Top             =   2520
            _ExtentX        =   1005
            _ExtentY        =   1005
            _Version        =   393216
         End
         Begin VB.CommandButton cmdCancel 
            Caption         =   "Cancel"
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
            Left            =   3960
            TabIndex        =   16
            Top             =   3240
            Width           =   1215
         End
         Begin VB.CommandButton cmdFinish 
            Caption         =   "Finish"
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
            Left            =   2640
            TabIndex        =   15
            Top             =   3240
            Width           =   1215
         End
         Begin VB.Timer tmrCancel 
            Enabled         =   0   'False
            Interval        =   3000
            Left            =   5640
            Top             =   3120
         End
         Begin VB.PictureBox Picture2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Enabled         =   0   'False
            ForeColor       =   &H80000008&
            Height          =   1575
            Left            =   2400
            ScaleHeight     =   1545
            ScaleWidth      =   3225
            TabIndex        =   7
            Top             =   480
            Width           =   3255
            Begin VB.CheckBox chkConnected 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Connected to Server"
               ForeColor       =   &H80000008&
               Height          =   255
               Left            =   120
               TabIndex        =   11
               TabStop         =   0   'False
               Top             =   480
               Width           =   2175
            End
            Begin VB.CheckBox chkSuccess 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Update Successful"
               ForeColor       =   &H80000008&
               Height          =   255
               Left            =   120
               TabIndex        =   10
               TabStop         =   0   'False
               Top             =   960
               Width           =   2895
            End
            Begin VB.CheckBox chkProgress 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Update in Progress"
               ForeColor       =   &H80000008&
               Height          =   255
               Left            =   120
               TabIndex        =   9
               TabStop         =   0   'False
               Top             =   720
               Width           =   2175
            End
            Begin VB.CheckBox chkContacting 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Contacting Server"
               ForeColor       =   &H80000008&
               Height          =   255
               Left            =   120
               TabIndex        =   8
               TabStop         =   0   'False
               Top             =   240
               Width           =   2175
            End
         End
         Begin VB.TextBox Hub 
            Height          =   285
            Left            =   2400
            MultiLine       =   -1  'True
            TabIndex        =   6
            TabStop         =   0   'False
            Top             =   2040
            Visible         =   0   'False
            Width           =   735
         End
         Begin VB.TextBox txtState 
            Height          =   285
            Left            =   3120
            TabIndex        =   5
            TabStop         =   0   'False
            Text            =   "State"
            Top             =   2040
            Visible         =   0   'False
            Width           =   1335
         End
         Begin VB.TextBox txtStatus 
            Height          =   285
            Left            =   3720
            TabIndex        =   4
            Top             =   2760
            Width           =   1575
         End
         Begin VB.TextBox Debug 
            Height          =   285
            Left            =   4440
            TabIndex        =   3
            TabStop         =   0   'False
            Text            =   "Debug"
            Top             =   2040
            Visible         =   0   'False
            Width           =   1335
         End
         Begin VB.PictureBox Picture3 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            ForeColor       =   &H80000008&
            Height          =   3060
            Left            =   240
            Picture         =   "frmUpdate.frx":0000
            ScaleHeight     =   3030
            ScaleWidth      =   1785
            TabIndex        =   2
            Top             =   360
            Width           =   1815
         End
         Begin VB.Label lblStatus 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Status :"
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
            Left            =   2520
            TabIndex        =   13
            Top             =   2760
            Width           =   855
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "bulkMail is receiving any available updates"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   255
            Left            =   720
            TabIndex        =   12
            Top             =   0
            Width           =   5055
         End
      End
   End
   Begin RichTextLib.RichTextBox Data 
      Height          =   1095
      Left            =   0
      TabIndex        =   14
      Top             =   2520
      Width           =   6255
      _ExtentX        =   11033
      _ExtentY        =   1931
      _Version        =   393217
      Enabled         =   -1  'True
      TextRTF         =   $"frmUpdate.frx":11C54
   End
End
Attribute VB_Name = "frmUpdate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Public debugMode As Integer

Private Sub cmdCancel_Click()
   Unload frmuspdate
   Exit Sub
End Sub

Private Sub cmdFinish_Click()
   Unload frmUpdate
   Exit Sub
End Sub

Private Sub Form_Load()
   debugMode = 0

   cmdFinish.Enabled = False
   cmdCancel.Enabled = True
   txtState.Visible  = False
   Hub.Visible       = False
   Data.Visible      = True
End Sub

Private Sub Form_Unload(Cancel As Integer)
   Unload frmUpdate
End Sub

Private Sub tmrCancel_Timer()
  tmrCancel.Enabled = False
End Sub

Private Sub form_activate()
'#--------------------------------------------
'req:
'- dbSection : Table
'- dbPos     : Last field ID
'- dbFieldID : Table field ID
'- dbField   : Table field ID to update
'#--------------------------------------------

Dim dbSection, dbFieldID, dbField As Variant
   Dim sqlStatement As String
   Dim sqlCount     As Integer
   Dim sqlPersist   As Integer
   Dim updateStr    As String
   Dim resultStr    As String
   Dim idParm       As Variant
   Dim skipInit     As Boolean

   Dim updateComp   As Variant
   Dim updateFind   As Variant
   Dim updateData   As String
   Dim updateSpin   As Variant
   Dim updateSql    As String
   Dim findParm     As Variant
   Dim dbSpace      As Variant

   Dim dbAdd        As Variant

   Set conns = CreateObject("ADODB.Connection")
   With conns
      .Provider = "Microsoft.Jet.OLEDB.4.0"
      .ConnectionString = App.Path & dbfile
      .Open
   End With

   'dbSection = Array("Orders", "Downloads", "Assess", "ReferralResellers", "ReferredCustomers", "ProductResellers", "SSContracts", "s_iso14000_org")
   'dbFieldID = Array("OrderID", "DnID", "AssessID", "RrID", "RcID", "PrID", "SsID", "s_iso14000_org_id")
   'dbField = Array("OrderID,CustomerEmail,CustomerName,Date,ApprovalCode,flags", "DnID,Email,FirstName,LastName,CurrentDate,flags", "AssessID,Email,FirstName,LastName,CurrentDate,flags", "RrID,RREmail,RRFirstName,RRLastName,RRCurrentDate,flags", "RcID,RCEmail,RCFirstName,RCLastName,RCCurrentDate,flags", "PrID,Email,FirstName,LastName,CurrentDate,Active,flags", "SsID,CustomerEmail,CustomerName,Date,flags", "s_iso14000_org_id,s_iso14000_org_email,s_iso14000_org_name,s_iso14000_org_date,flags")

   'sendSection = "Orders,Downloads,Assess,ReferralResellers,ReferredCustomers,ProductResellers,SSContracts,s_iso14000_org"
   'sendFieldID = "OrderID,DnID,AssessID,RrID,RcID,PrID,SsID,s_iso14000_org_id"
   'sendField = "OrderID,CustomerEmail,CustomerName,Date,ApprovalCode,flags;DnID,Email,FirstName,LastName,CurrentDate,flags;AssessID,Email,FirstName,LastName,CurrentDate,flags;RrID,RREmail,RRFirstName,RRLastName,RRCurrentDate,flags;RcID,RCEmail,RCFirstName,RCLastName,RCCurrentDate,flags;PrID,Email,FirstName,LastName,CurrentDate,Active,flags;SsID,CustomerEmail,CustomerName,Date,flags;s_iso14000_org_id,s_iso14000_org_email,s_iso14000_org_name,s_iso14000_org_date,flags"

   dbSection = Array("Orders", "Downloads", "Assess", "ReferralResellers", "ReferredCustomers", "ProductResellers", "SSContracts", "s_iso14000_org")
   dbFieldID = Array("OrderID", "DnID", "AssessID", "RrID", "RcID", "PrID", "SsID", "s_iso14000_org_id")
   dbField = Array("OrderID,CustomerEmail,CustomerName,Date,ApprovalCode,flags", "DnID,Email,FirstName,LastName,CurrentDate,flags", "AssessID,Email,FirstName,LastName,CurrentDate,flags", "RrID,RREmail,RRFirstName,RRLastName,RRCurrentDate,flags", "RcID,RCEmail,RCFirstName,RCLastName,RCCurrentDate,flags", "PrID,Email,FirstName,LastName,CurrentDate,Active,flags", "SsID,CustomerEmail,CustomerName,Date,flags", "s_iso14000_org_id,s_iso14000_org_email,s_iso14000_org_name,s_iso14000_org_date,flags")

   sendSection = "Orders,Downloads,Assess,ReferralResellers,ReferredCustomers,ProductResellers,SSContracts,s_iso14000_org"
   sendFieldID = "OrderID,DnID,AssessID,RrID,RcID,PrID,SsID,s_iso14000_org_id"
   sendField = "OrderID,CustomerEmail,CustomerName,Date,ApprovalCode,flags;DnID,Email,FirstName,LastName,CurrentDate,flags;AssessID,Email,FirstName,LastName,CurrentDate,flags;RrID,RREmail,RRFirstName,RRLastName,RRCurrentDate,flags;RcID,RCEmail,RCFirstName,RCLastName,RCCurrentDate,flags;PrID,Email,FirstName,LastName,CurrentDate,Active,flags;SsID,CustomerEmail,CustomerName,Date,flags;s_iso14000_org_id,s_iso14000_org_email,s_iso14000_org_name,s_iso14000_org_date,flags"

   dbPosition = 0
   posArray = Empty

'/*---- current/record_amount

   For i = 0 To UBound(dbSection)
      sqlStatement = "SELECT * FROM " & dbSection(i)
      Set rs = conns.Execute(sqlStatement)

      sqlPersist = Empty
      Do While Not rs.EOF
         sqlPersist = rs(dbFieldID(sqlCount))
         rs.movenext
      Loop
      If IsEmpty(posArray) = True Then
         posArray = sqlPersist
      ElseIf IsEmpty(posArray) = False Then
         posArray = posArray & "," & sqlPersist
      End If
      sqlCount = sqlCount + 1
      rs.Close
   Next i

'/*---- Microsoft Internet Control - Properties
   connInternet.RequestTimeout = 900

   If debugMode = 0 Then
      connInternet.URL = "www.isotop.net"
   ElseIf debugMode = 1 Then
      connInternet.URL = "null"
   End If

   updateStr = "/isotop-execute/hubrun.aspx?dbSection=" & sendSection & "&dbPosition=" & posArray & "&dbFieldID=" & sendFieldID & "&dbField=" & sendField & ""
   connInternet.RemotePort = 80
   connInternet.Protocol = icHTTP
   chkContacting.value = 1
   tmrCancel.Enabled = True
   txtStatus.Text = "Contacting..."
   connInternet.Document = updateStr
   Hub = connInternet.OpenURL
   chkConnected.value = 1
   tmrCancel.Enabled = True
   txtStatus.Text = "Contacted"
   resultStr = connInternet.OpenURL
   connInternet.Cancel

   Debug.Print connInternet.URL

   If InStr(resultStr, "(d)") = 0 Then
      skipInit = True
      MsgBox ("Your records are up to date")
      Unload frmUpdate
      Exit Sub
   End If
   
   chkProgress.value = 1
   tmrCancel.Enabled = True
   txtStatus.Text = "Updating..."
   fCount = Empty
   sqlCount = Empty

   For i = 0 To UBound(dbSection)
      sqlStatement = "SELECT * FROM " & dbSection(i)
      Set rs = conns.Execute(sqlStatement)
      sqlPersist = Empty
      dbPosition = Empty
      Do While Not rs.EOF
         sqlPersist = rs(dbFieldID(fCount))
         rs.movenext
      Loop
      dbPosition = sqlPersist
      rs.Close

      updateComp = Split(resultStr, "(s)")
      updateFind = "(d)"
      updataData = Split(updateComp(fCount), "(d)")

      For Each updateFind In updataData
         findParm = "[;]"
         updateSpin = Split(updateFind, "[;]")
         dbFieldS = Split(dbField(fCount), ",")
    
         For Each findParm In updateSpin
            If sqlCount < 1 Then
               dbPosition = findParm
            ElseIf sqlCount = 1 Then
               dbAdd = Replace(dbFieldS(sqlCount), "s_iso14000_org_date", "CurrentDate")
               dbAdd = Replace(dbFieldS(sqlCount), "Date", "CurrentDate")
               If Len(findParm) = 0 Then
                  findParm = " "
               End If
               updateSql = "insert into " & dbSection(i) & _
                           "(" & dbFieldID(fCount) & _
                           "," & dbAdd & _
                           ") " & "values('" & dbPosition & _
                           "', '" & Replace(findParm, "'", "''") & "')"
               msgbox(updateSql)
               conns.Execute (updateSql)
            ElseIf sqlCount > 0 Then
               If sqlCount < UBound(dbFieldS) + 1 Then
                  If InStr(dbFieldS(sqlCount), "Date") <> 0 Then
                     If Len(findParm) = 0 Then
                        findParm = " "
                     End If
                     updateSql = "update " & dbSection(i) & " set " & _
                               Replace(dbFieldS(sqlCount), dbFieldS(sqlCount), "CurrentDate") & " = '" & _
                               Replace(findParm, "'", "''") & _
                              "' where " & dbFieldID(fCount) & _
                              " = " & dbPosition
                  Else
                     dbAdd = Replace(dbFieldS(sqlCount), "s_iso14000_org_date", "CurrentDate")
                     If Len(findParm) = 0 Then
                        findParm = " "
                     End If
                     updateSql = "update " & dbSection(i) & " set " & _
                                 dbAdd & " = '" & _
                                 Replace(findParm, "'", "''") & _
                                 "' where " & dbFieldID(fCount) & _
                                 " = " & dbPosition
                  End If
                  conns.Execute (updateSql)
               ElseIf sqlCount > UBound(dbFieldS) + 1 Then
                  Exit For
               End If
            End If
            sqlCount = sqlCount + 1
         Next findParm
         sqlCount = Empty
      Next updateFind
      fCount = fCount + 1
   Next i

   dbPosition = Empty

   chkSuccess.value = 1
   tmrCancel.Enabled = True
   txtStatus.Text = "Update Complete"
   cmdFinish.Enabled = True
   cmdCancel.Enabled = False
   Set conns = Nothing
 
End Sub

Private Sub connInternet_StateChanged(ByVal State As Integer)
   txtState = State
   Debug.Print State
  
   If State = 9 Then
      'MsgBox "Disconnecting", 48, "Disconnected"
   End If
  
   If State = 11 Then
      MsgBox ("No Internet Connectivity Found")
      Connval = False
   End If
  
End Sub

VERSION 5.00
Object = "{0BA686C6-F7D3-101A-993E-0000C0EF6F5E}#1.0#0"; "threed32.ocx"
Begin VB.Form frmUpSelect 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Update Selection"
   ClientHeight    =   2580
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4110
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2580
   ScaleWidth      =   4110
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000009&
      ForeColor       =   &H80000008&
      Height          =   2535
      Left            =   0
      ScaleHeight     =   2505
      ScaleWidth      =   4065
      TabIndex        =   0
      Top             =   0
      Width           =   4095
      Begin VB.CheckBox chkSC 
         BackColor       =   &H80000009&
         Caption         =   "Check1"
         Height          =   195
         Left            =   120
         TabIndex        =   17
         Top             =   1920
         Width           =   255
      End
      Begin VB.PictureBox Picture2 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000004&
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         ScaleHeight     =   225
         ScaleWidth      =   3825
         TabIndex        =   14
         Top             =   120
         Width           =   3855
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            BackColor       =   &H80000004&
            Caption         =   "Please select which fields to update :"
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
            Left            =   240
            TabIndex        =   15
            Top             =   0
            Width           =   3375
         End
      End
      Begin VB.CheckBox chkAssess 
         BackColor       =   &H80000009&
         Caption         =   "Check1"
         Height          =   195
         Left            =   120
         TabIndex        =   6
         Top             =   960
         Width           =   255
      End
      Begin VB.CheckBox chkRC 
         BackColor       =   &H80000009&
         Caption         =   "Check1"
         Height          =   195
         Left            =   120
         TabIndex        =   5
         Top             =   1680
         Width           =   255
      End
      Begin VB.CheckBox chkPR 
         BackColor       =   &H80000009&
         Caption         =   "Check1"
         Height          =   195
         Left            =   120
         TabIndex        =   4
         Top             =   1440
         Width           =   255
      End
      Begin VB.CheckBox chkSales 
         BackColor       =   &H80000009&
         Caption         =   "Check1"
         Height          =   195
         Left            =   120
         TabIndex        =   3
         Top             =   480
         Width           =   255
      End
      Begin VB.CheckBox chkRR 
         BackColor       =   &H80000009&
         Caption         =   "Check1"
         Height          =   195
         Left            =   120
         TabIndex        =   2
         Top             =   1200
         Width           =   255
      End
      Begin VB.CheckBox chkDown 
         BackColor       =   &H80000009&
         Caption         =   "Check1"
         Height          =   195
         Left            =   120
         TabIndex        =   1
         Top             =   720
         Width           =   255
      End
      Begin Threed.SSCommand cmdNext 
         Height          =   315
         Left            =   1440
         TabIndex        =   13
         Top             =   2160
         Width           =   1275
         _Version        =   65536
         _ExtentX        =   2249
         _ExtentY        =   556
         _StockProps     =   78
         Caption         =   "Next >"
         ForeColor       =   16777215
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BevelWidth      =   0
         RoundedCorners  =   0   'False
         Outline         =   0   'False
         AutoSize        =   2
         Picture         =   "frmUpSelect.frx":0000
      End
      Begin Threed.SSCommand cmdCancel 
         Height          =   315
         Left            =   2760
         TabIndex        =   16
         Top             =   2160
         Width           =   1275
         _Version        =   65536
         _ExtentX        =   2249
         _ExtentY        =   556
         _StockProps     =   78
         Caption         =   "Cancel"
         ForeColor       =   16777215
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BevelWidth      =   0
         RoundedCorners  =   0   'False
         Outline         =   0   'False
         AutoSize        =   2
         Picture         =   "frmUpSelect.frx":1306
      End
      Begin VB.Label lblSC 
         BackColor       =   &H80000009&
         Caption         =   "Software Contracts"
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
         Left            =   360
         TabIndex        =   18
         Top             =   1920
         Width           =   1815
      End
      Begin VB.Label lblAssess 
         BackColor       =   &H80000009&
         Caption         =   "Assessments"
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
         Left            =   360
         TabIndex        =   12
         Top             =   960
         Width           =   1695
      End
      Begin VB.Label lblRC 
         BackColor       =   &H80000009&
         Caption         =   "Referred Customers"
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
         Left            =   360
         TabIndex        =   11
         Top             =   1680
         Width           =   1815
      End
      Begin VB.Label Label1 
         BackColor       =   &H80000009&
         Caption         =   "Product Resellers"
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
         Left            =   360
         TabIndex        =   10
         Top             =   1440
         Width           =   1815
      End
      Begin VB.Label lblRR 
         BackColor       =   &H80000009&
         Caption         =   "Referral Resellers"
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
         Left            =   360
         TabIndex        =   9
         Top             =   1200
         Width           =   1695
      End
      Begin VB.Label lblDownloads 
         BackColor       =   &H80000009&
         Caption         =   "Downloads"
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
         Left            =   360
         TabIndex        =   8
         Top             =   720
         Width           =   1215
      End
      Begin VB.Label lblSales 
         BackColor       =   &H80000009&
         Caption         =   "Sales"
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
         Left            =   360
         TabIndex        =   7
         Top             =   480
         Width           =   1215
      End
   End
End
Attribute VB_Name = "frmUpSelect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
Unload frmUpSelect
End Sub
Private Sub cmdNext_Click()
Set conns = CreateObject("ADODB.Connection")
With conns
    .Provider = "Microsoft.Jet.OLEDB.4.0"
    .ConnectionString = App.Path & dbfile
    .Open
End With
Set rs = CreateObject("adodb.recordset")

chkAmount = 0

'If chkSales.value = 1 Then
dbSection = "Orders,Downloads,Assess,ReferralResellers,ReferredCustomers,ProductResellers,SSContracts"
dbArraySection = Array("Orders", "Downloads", "Assess", "ReferralResellers", "ReferredCustomers", "ProductResellers", "SSContracts")
dbFieldID = "OrderID,DnID,AssessID,RrID,RcID,PrID,SsID"
dbArray = Array("CustomerEmail,CustomerName,Date,ApprovalCode", "Email,FirstName,LastName,CurrentDate", "Email,FirstName,LastName,CurrentDate", "RREmail,RRFirstName,RRLastName,RRCurrentDate", "RCEmail,RCFirstName,RCLastName,RCCurrentDate", "Email,FirstName,LastName,CurrentDate,Active", "CustomerEmail,CustomerName,Date")
dbField = ("CustomerEmail,CustomerName,Date;Email,FirstName,LastName,CurrentDate;Email,FirstName,LastName,CurrentDate;RREmail,RRFirstName,RRLastName,RRCurrentDate;RCEmail,RCFirstName,RCLastName,RCCurrentDate;Email,FirstName,LastName,CurrentDate;CustomerEmail,CustomerName,Date")

dbFieldAdd = "ApprovalCode"
rs.Open dbSection, conn, 1, 2, 2
dbPos = rs.RecordCount
rs.Close
chk_Amount = chk_Amount + 1
'End If

'If chkDown.value = 1 Then
'dbSection = "Downloads"
'dbFieldID = "DnID"
'dbField = ("Email,FirstName,LastName,CurrentDate")
'dbArray = Array("Email", "FirstName", "LastName", "CurrentDate")
'rs.Open dbSection, conn, 1, 2, 2
'dbPos = rs.RecordCount
'rs.Close
'chk_Amount = chk_Amount + 1
'End If

'If chkAssess.value = 1 Then
'dbSection = "Assess"
'dbFieldID = "AssessID"
'dbField = ("Email,FirstName,LastName,CurrentDate")
'dbArray = Array("Email", "FirstName", "LastName", "CurrentDate")
'rs.Open dbSection, conn, 1, 2, 2
'dbPos = rs.RecordCount
'rs.Close
'chk_Amount = chk_Amount + 1
'End If

'If chkRR.value = 1 Then
'dbSection = "ReferralResellers"
'dbFieldID = "RrID"
'dbField = ("RREmail,RRFirstName,RRLastName,RRCurrentDate")
'dbArray = Array("RREmail", "RRFirstName", "RRLastName", "RRCurrentDate")
'rs.Open dbSection, conn, 1, 2, 2
'dbPos = rs.RecordCount
'rs.Close
'chk_Amount = chk_Amount + 1
'End If

'If chkRC.value = 1 Then
'dbSection = "ReferredCustomers"
'dbFieldID = "RcID"
'dbField = ("RCEmail,RCFirstName,RCLastName,RCCurrentDate")
'dbArray = Array("RCEmail", "RCFirstName", "RCLastName", "RCCurrentDate")
'rs.Open dbSection, conn, 1, 2, 2
'dbPos = rs.RecordCount
'rs.Close
'chk_Amount = chk_Amount + 1
'End If

'If chkPR.value = 1 Then
'dbSection = "ProductResellers"
'dbFieldID = "PrId"
'dbField = ("Email,FirstName,LastName,CurrentDate")
'dbArray = Array("Email", "FirstName", "LastName", "CurrentDate")
'dbFieldAdd = "Active"
'rs.Open dbSection, conn, 1, 2, 2
'dbPos = rs.RecordCount
'rs.Close
'chk_Amount = chk_Amount + 1
'End If

'If chkSC.value = 1 Then
'dbSection = "SSContracts"
'dbFieldID = "SsID"
'dbField = ("CustomerEmail,CustomerName,Date")
'dbArray = Array("CustomerEmail", "CustomerName", "Date")
'rs.Open dbSection, conn, 1, 2, 2
'dbPos = rs.RecordCount
'rs.Close
'chk_Amount = chk_Amount + 1
'End If

'If chk_Amount > 1 Then
'MsgBox ("Only one Section may be updated at a time")
'Exit Sub
'ElseIf chk_Amount = "" Then
'MsgBox ("Please select a category")
'Exit Sub
'End If

Set conns = Nothing
Set rs = Nothing
Unload Me
frmUpdate.Show vbModal
End Sub


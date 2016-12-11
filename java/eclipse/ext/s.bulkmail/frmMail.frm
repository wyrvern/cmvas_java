VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "comctl32.ocx"
Begin VB.Form frmMail 
   BackColor       =   &H80000016&
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   6270
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   8325
   Icon            =   "frmMail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   6270
   ScaleWidth      =   8325
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdDebug 
      Caption         =   "Debug"
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
      Left            =   6840
      TabIndex        =   8
      Top             =   2040
      Width           =   1215
   End
   Begin VB.CommandButton cmdMessage 
      Caption         =   "Compose"
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
      Left            =   6840
      TabIndex        =   6
      Top             =   480
      Width           =   1215
   End
   Begin ComctlLib.StatusBar StatusBar 
      Align           =   2  'Align Bottom
      Height          =   255
      Left            =   0
      TabIndex        =   2
      Top             =   6015
      Width           =   8325
      _ExtentX        =   14684
      _ExtentY        =   450
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   1
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Object.Width           =   3528
            MinWidth        =   3528
            Key             =   ""
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComDlg.CommonDialog cmd 
      Left            =   7560
      Top             =   2400
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSFlexGridLib.MSFlexGrid grdMain 
      Height          =   5775
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   6615
      _ExtentX        =   11668
      _ExtentY        =   10186
      _Version        =   393216
      Cols            =   10
      FixedCols       =   0
      GridLines       =   2
      Appearance      =   0
      FormatString    =   $"frmMail.frx":0442
   End
   Begin VB.PictureBox Background 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   6015
      Left            =   0
      ScaleHeight     =   5985
      ScaleWidth      =   8265
      TabIndex        =   1
      Top             =   0
      Width           =   8295
      Begin VB.CommandButton cmdPause 
         Caption         =   "Pause"
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
         Left            =   6840
         TabIndex        =   10
         Top             =   5280
         Width           =   1215
      End
      Begin VB.CommandButton cmdReset 
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
         Left            =   6840
         TabIndex        =   9
         Top             =   840
         Width           =   1215
      End
      Begin VB.CommandButton cmdDup 
         Caption         =   "Duplicates"
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
         Left            =   6840
         TabIndex        =   7
         Top             =   1200
         Visible         =   0   'False
         Width           =   1215
      End
      Begin VB.CommandButton cmdBuild 
         Caption         =   "Build"
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
         Left            =   6840
         TabIndex        =   5
         Top             =   120
         Width           =   1215
      End
      Begin VB.TextBox boxVer 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   6840
         TabIndex        =   3
         Top             =   5600
         Width           =   1335
      End
      Begin RichTextLib.RichTextBox txtRes 
         Height          =   2055
         Left            =   6840
         TabIndex        =   4
         Top             =   3000
         Visible         =   0   'False
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   3625
         _Version        =   393217
         ScrollBars      =   2
         TextRTF         =   $"frmMail.frx":0448
      End
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuImport 
         Caption         =   "Import"
         Begin VB.Menu mnuComma 
            Caption         =   "Comma Delimited..."
         End
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "Help"
      Begin VB.Menu mnuHelpFile 
         Caption         =   "Help File"
      End
      Begin VB.Menu mnuAbout 
         Caption         =   "About"
      End
   End
End
Attribute VB_Name = "frmMail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public debugMode As Integer
Private Sub cmdBuild_Click()
   frmDate.Show vbModal
End Sub
Private Sub cmdClear_Click()
   txtSubject.Text = Empty
   cmbFrom.Text = Empty
   txtBody.Text = Empty
End Sub
Private Sub cmdMessage_Click()
   frmMessage.Show vbModal
End Sub
Private Sub cmdDebug_Click()
   ' MsgBox (DataVar)
End Sub
Private Sub cmdPause_Click()
   frmPause.Show
End Sub
Private Sub cmdReset_Click()
   With grdMain
      .Clear
      .Rows = 2
      .FormatString = "<ID |<Name |<Email |<Telephone |<Company |<Country |<Date |<Flags "
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

End Sub
Private Sub Form_Load()

'//-------------Package Options

   Version = "1.5(b)"
   Revision = Now
   frmMail.Caption = "bulkMail ver " & Version
   boxVer.Text = Revision

'//-------------Debug Options

   debugMode = 0
   cmdDebug.Visible = False

   If debugMode = 1 Then
      frmAssist.Show
   End If

'//--------- Visibility options

   txtRes.Visible = False
   txtRes.Enabled = False
   frmSingle.cmdDebug.Enabled = False
   frmSingle.cmdDebug.Visible = False
   
'//--------- Db options
   
   db_selection = 0

'//--------- Grid options

   With grdMain
      .FormatString = "<ID |<Name |<Email |<Telephone |<Company |<Country |<Date |<Flags  |<q1  |<q2  |<q3 |bin "
      .ColWidth(0) = 1000
      .ColWidth(1) = 1500
      .ColWidth(2) = 1500
      .ColWidth(3) = 1500
      .ColWidth(4) = 1500
      .ColWidth(5) = 1500
      .ColWidth(6) = 1500
      .ColWidth(7) = 1500
      .ColWidth(8) = 1500
      .ColWidth(9) = 1500
      .ColWidth(10) = 1500
   End With
   
   pause = False
End Sub
Private Sub Form_Unload(Cancel As Integer)
   Unload frmSingle
   Unload frmAssist
   Unload frmMessage
   Unload frmUpdate
   Unload frmMail
End Sub
Private Sub mnuColor_Click()
   cmd.ShowColor
   SelColor = cmd.Color

   If frmMessage.txtBody.SelText <> "" Then
      frmMessage.txtBody.SelColor = SelColor
      Call Encode("Color", SelColor)
   End If
End Sub
Private Sub mnuAbout_Click()
   MsgBox ("bulkMail Mailer " & Version & vbCrLf & _
           "Author: null@null.co.za" & vbCrLf & _
           "Revision: " & Revision)
End Sub
Private Sub mnuComma_Click()
   Call importInit
End Sub

Private Sub mnuHelpFile_Click()
   Call ShellExecute(hwnd, "Open", App.Path & "\help.txt", "", App.Path, 1)
End Sub
Private Sub mnuUpdate_Click()
   frmUpdate.Show vbModal
End Sub

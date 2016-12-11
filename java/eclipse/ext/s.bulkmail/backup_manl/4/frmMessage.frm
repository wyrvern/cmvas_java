VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form frmMessage 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "bulkMail Message"
   ClientHeight    =   6870
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   6255
   Icon            =   "frmMessage.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6870
   ScaleWidth      =   6255
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdSend 
      Caption         =   "Send Mail"
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
      Top             =   6240
      Width           =   1215
   End
   Begin ComctlLib.ProgressBar Progress 
      Height          =   225
      Left            =   1560
      TabIndex        =   9
      Top             =   6650
      Width           =   4695
      _ExtentX        =   8281
      _ExtentY        =   397
      _Version        =   327682
      Appearance      =   0
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   6615
      Left            =   0
      ScaleHeight     =   6585
      ScaleWidth      =   6225
      TabIndex        =   0
      Top             =   0
      Width           =   6255
      Begin VB.ComboBox cmbContent 
         Height          =   315
         Left            =   1440
         TabIndex        =   13
         TabStop         =   0   'False
         Top             =   840
         Width           =   2175
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
         Left            =   1440
         TabIndex        =   12
         Top             =   6240
         Width           =   1215
      End
      Begin VB.CommandButton cmdSingle 
         Caption         =   "Single"
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
         Left            =   4920
         TabIndex        =   10
         Top             =   1200
         Width           =   1215
      End
      Begin VB.ComboBox cmbFrom 
         Height          =   315
         Left            =   1440
         TabIndex        =   6
         TabStop         =   0   'False
         Top             =   480
         Width           =   2175
      End
      Begin VB.TextBox txtSubject 
         Height          =   285
         Left            =   1440
         TabIndex        =   5
         TabStop         =   0   'False
         Top             =   120
         Width           =   2175
      End
      Begin RichTextLib.RichTextBox txtBody 
         Height          =   3600
         Left            =   120
         TabIndex        =   4
         TabStop         =   0   'False
         Top             =   1560
         Width           =   6000
         _ExtentX        =   10583
         _ExtentY        =   6350
         _Version        =   393217
         ScrollBars      =   2
         TextRTF         =   $"frmMessage.frx":0442
      End
      Begin RichTextLib.RichTextBox txtDebug 
         Height          =   975
         Left            =   120
         TabIndex        =   7
         TabStop         =   0   'False
         Top             =   5160
         Width           =   6015
         _ExtentX        =   10610
         _ExtentY        =   1720
         _Version        =   393217
         ScrollBars      =   2
         TextRTF         =   $"frmMessage.frx":04C4
      End
      Begin MSComDlg.CommonDialog cmd 
         Left            =   5640
         Top             =   6120
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Content :"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   14
         Top             =   840
         Width           =   1215
      End
      Begin VB.Label lblMessage 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Message :"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   1200
         Width           =   1215
      End
      Begin VB.Label lblSubject 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Subject :"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   120
         Width           =   1215
      End
      Begin VB.Label lblFrom 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "From :"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   480
         Width           =   1215
      End
   End
   Begin ComctlLib.StatusBar StatusBar 
      Align           =   2  'Align Bottom
      Height          =   255
      Left            =   0
      TabIndex        =   8
      Top             =   6615
      Width           =   6255
      _ExtentX        =   11033
      _ExtentY        =   450
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   1
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuFont 
      Caption         =   "&Font"
   End
   Begin VB.Menu mnuInfo 
      Caption         =   "Info"
      Visible         =   0   'False
      Begin VB.Menu mnuHead 
         Caption         =   "Information"
      End
      Begin VB.Menu seperator 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFontInfo 
         Caption         =   "Font"
      End
   End
End
Attribute VB_Name = "frmMessage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdClear_Click()
txtSubject.Text = ""
cmbFrom.Text = ""
txtBody.Text = ""
txtDebug.Text = ""
DataVar = ""

Call ClearMessage
End Sub
Private Sub cmdSend_Click()

Dim htmlFooter As String
Dim txtFooter As String
Dim txtRequest As String
Dim htmlRequest As String
Dim debugMode As Integer

debugMode = 0

If frmMail.grdMain.Rows > 2 Then
   If frmMessage.cmbContent.Text <> "" Then
      If frmMessage.cmbFrom.Text <> "" Then
         If frmMessage.txtSubject.Text <> "" Then
sendAmount = 0
Call MouseChange("frmMessage", "Wait")

xmain (DataVar)
rowLimit = frmMail.grdMain.Rows - 2
Progress.Max = rowLimit
StatusBar.Panels(1).Text = "Processing..."

If frmMessage.cmbContent.Text = "plain/text" Then
 contentType = "plain/text"
ElseIf frmMessage.cmbContent.Text = "text/html" Then
 contentType = "text/html"
End If

For i = 1 To rowLimit

Shift = False

If frmMail.grdMain.TextMatrix(i, 1) = "" Or _
  InStr(frmMail.grdMain.TextMatrix(i, 1), "@") = 0 Or _
  InStr(frmMail.grdMain.TextMatrix(i, 4), "I") <> 0 Then
  Shift = True
  Progress.Max = Progress.Max - 1
End If

If Shift = False Then

   txtRequest = "<br><br>" & _
   "If you wish to receive your next 'isotop' email in text (plain/text) please click " & _
   "<a href='http://www.isotop.net/isotop-execute/flags.aspx?a=2&e=" & frmMail.grdMain.TextMatrix(i, 1) & "'>here</a>" & vbCrLf

   htmlRequest = vbCrLf & vbCrLf & _
   "If you wish to receive your next 'isotop' email in color (html) please click " & vbCrLf & _
   "http://www.isotop.net/isotop-execute/flags.aspx?a=1&e=" & frmMail.grdMain.TextMatrix(i, 1)

   htmlFooter = "<br>" & _
   "To unsubscribe from this email list click <a href='http://www.isotop.net/isotop-execute/flags.aspx?a=0&e=" & frmMail.grdMain.TextMatrix(i, 1) & "'>here</a>"

   txtFooter = vbCrLf & _
   "To unsubscribe from this email list click" & vbCrLf & "http://www.isotop.net/isotop-execute/flags.aspx?a=0&e=" & frmMail.grdMain.TextMatrix(i, 1)

send_from = frmMessage.cmbFrom.Text
send_subject = frmMessage.txtSubject.Text
send_body = zit & txtRequest & htmlFooter
send_text = frmMessage.txtBody.Text & htmlRequest & txtFooter

Set Mailer = CreateObject("SMTPsvg.Mailer")
   If debugMode = 0 Then
      Mailer.RemoteHost = "mail.isotop.net"
   ElseIf debugMode = 1 Then
      Mailer.RemoteHost = "null"
   End If
Mailer.FromName = "isotop Global Partnership"
Mailer.FromAddress = send_from
   If debugMode = 0 Then
      Mailer.AddRecipient frmMail.grdMain.TextMatrix(i, 2), frmMail.grdMain.TextMatrix(i, 1)
   ElseIf debugMode = 1 Then
      Mailer.AddRecipient frmMail.grdMain.TextMatrix(i, 2), "null@null"
   End If
Mailer.Subject = send_subject

If contentType = "text/html" Then
   If frmMail.grdMain.TextMatrix(i, 4) = "H" Then
      Mailer.contentType = "text/html"
      Mailer.BodyText = send_body
   ElseIf frmMail.grdMain.TextMatrix(i, 4) = "P" Then
      Mailer.BodyText = send_text
   Else
      Mailer.BodyText = send_text
   End If
ElseIf contentType = "plain/text" Then
      Mailer.BodyText = send_text
End If
 
If Not Mailer.SendMail Then
   mailsend = False
Else
 sendAmount = sendAmount + 1
'---------------Progress
If iProgress < rowLimit Then
 iProgress = iProgress + 1
 Progress.value = iProgress
 StatusBar.Panels(1).Text = iProgress & "/" & Progress.Max
End If
If iProgress = Progress.Max Then
 Progress.value = 0
 StatusBar.Panels(1).Text = sendAmount & "/" & Progress.Max & ": Sent"
End If
'---------------Progress
 mailsend = True
End If

End If
Next i

If mailsend = False Then
 MsgBox ("Mail Send Failure : " & Mailer.response)
ElseIf mailsend = True Then
 MsgBox ("Mail Send Success : " & sendAmount)
End If
Set Mailer = Nothing
Call MouseChange("frmMessage", "Normal")

         Else
            MsgBox ("Please supply a Subject header")
         End If
      Else
         MsgBox ("Please select a From address")
      End If
   Else
      MsgBox ("Please select a Content type")
   End If
Else
   MsgBox ("Please add table entries below")
End If

End Sub

Private Sub cmdSingle_Click()
frmSingle.Show vbModal
End Sub

Private Sub Form_Load()
frmMessage.cmbFrom.AddItem ("info@isotop.net")
frmMessage.cmbFrom.AddItem ("r.reseller@isotop.net")
frmMessage.cmbFrom.AddItem ("p.reseller@isotop.net")
frmMessage.cmbFrom.AddItem ("softwarecontract@isotop.net")
frmMessage.cmbFrom.AddItem ("iso14001contract@isotop.net")
frmMessage.cmbFrom.AddItem ("suggestions@isotop.net")
frmMessage.cmbFrom.AddItem ("support@isotop.net")
frmMessage.cmbFrom.AddItem ("aron.mb@isotop.net")
frmMessage.cmbFrom.AddItem ("bforeman@isotop.net")
frmMessage.cmbFrom.AddItem ("gturner@isotop.net")
frmMessage.cmbFrom.AddItem ("tritter@isotop.net")

frmMessage.cmbContent.AddItem ("plain/text")
frmMessage.cmbContent.AddItem ("text/html")
End Sub
Private Sub Form_Terminate()
ClearMessage
End Sub
Private Sub Form_Unload(Cancel As Integer)
ClearMessage
End Sub
Private Sub mnuFont_Click()
Call FillFonts

frmFont.Show vbModal
End Sub

Private Sub txtBody_KeyDown(KeyCode As Integer, Shift As Integer)

Call Convert(KeyCode, Shift)

End Sub
Private Sub txtBody_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

'If Button = 2 Then
'PopupMenu mnuInfo
'End If
'
'If DataVar <> "" Then
'
'cpos = 0
''-determine array positions
'skip = False
'sv = ","
'msplit = Split(larray, sv)
'For Each sv In msplit
'If sv = "" Then
'skip = True
'End If
'If skip = False Then
'pns_s = InStr(sv, "(") + 1
'pls_s = InStr(sv, "[") + 1
'pns_e = InStr(sv, ")") - pns_s
'pls_e = InStr(sv, "]") - pls_s
'num_n = Mid(sv, pns_s, pns_e)
'num_l = Mid(sv, pls_s, pls_e)
'
'If num_n <= yPos Then
'noChar = noChar + num_l + 6
'End If
'
'End If
'Next

'cpos = noChar + xPos
'End If

End Sub
Private Sub mnuFontInfo_Click()
Call FontInfo
End Sub
Private Sub txtBody_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)

yDiv = y / 2
xDiv = x / 0.85
yRnd = Round(yDiv)
xRnd = Round(xDiv)

 If yRnd < 100 Then
 yt = 0
 ElseIf Len(yRnd) = 3 Then
 yt = Left(yRnd, 1)
 ElseIf Len(yRnd) = 4 Then
 yt = Left(yRnd, 2)
 End If

 If xRnd < 100 Then
 xt = 0
 ElseIf Len(xRnd) = 3 Then
 xt = Left(xRnd, 1)
 ElseIf Len(xRnd) = 4 Then
 xt = Left(xRnd, 2)
 End If

xPos = xt
yPos = yt

End Sub

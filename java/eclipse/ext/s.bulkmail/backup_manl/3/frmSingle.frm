VERSION 5.00
Begin VB.Form frmSingle 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Single message"
   ClientHeight    =   1230
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4215
   Icon            =   "frmSingle.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1230
   ScaleWidth      =   4215
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtEmail 
      Height          =   285
      Left            =   120
      TabIndex        =   1
      Top             =   840
      Width           =   2655
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   1215
      Left            =   0
      ScaleHeight     =   1185
      ScaleWidth      =   4185
      TabIndex        =   4
      Top             =   0
      Width           =   4215
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
         Left            =   2880
         TabIndex        =   7
         Top             =   840
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
         Left            =   2880
         TabIndex        =   3
         Top             =   480
         Width           =   1215
      End
      Begin VB.CommandButton cmdSend 
         Caption         =   "Send"
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
         Left            =   2880
         TabIndex        =   2
         Top             =   120
         Width           =   1215
      End
      Begin VB.TextBox txtHost 
         Height          =   285
         Left            =   120
         TabIndex        =   0
         Text            =   "mail.isotop.net"
         Top             =   240
         Width           =   2655
      End
      Begin VB.Label lblHost 
         BackColor       =   &H80000009&
         Caption         =   "Enter mail host :"
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
         Top             =   0
         Width           =   2655
      End
      Begin VB.Label lblEmail 
         BackColor       =   &H80000009&
         Caption         =   "Enter recipient address :"
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
         TabIndex        =   5
         Top             =   600
         Width           =   2655
      End
   End
End
Attribute VB_Name = "frmSingle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdClose_Click()
   Unload frmSingle
End Sub

Private Sub cmdDebug_Click()
   xmain (DataVar)
End Sub

Private Sub cmdSend_Click()

Dim htmlEncode As String
Dim htmlFooter As String
Dim txtFooter As String
Dim txtRequest As String
Dim htmlRequest As String

   If frmMessage.cmbContent.Text <> "" Then
      If frmMessage.cmbFrom.Text <> "" Then
         If frmMessage.txtSubject.Text <> "" Then
           If txtEmail.Text <> "" Then

   sendAmount = 0
   Call MouseChange("frmMessage", "Wait")
   xmain (DataVar)

   sendAmount = sendAmount + 1

   If frmMessage.cmbContent.Text = "plain/text" Then
      contentType = "plain/text"
   ElseIf frmMessage.cmbContent.Text = "text/html" Then
      contentType = "text/html"
   End If

   htmlEncode = _
   "<!--  This document was created with isotop bulkMail version : [" & App.Major & "." & App.Minor & "." & App.Revision & "] -->" & vbCrLf & _
   "<!--  Author: isotop Global Partnership            -->" & vbCrLf & _
   "<!--  Date:   " & Date & "                         -->" & vbCrLf & vbCrLf

   txtRequest = "<br><br>" & _
   "If you wish to receive your next 'isotop' email in text (plain/text) please click " & _
   "<a href='http://www.isotop.net/isotop-execute/flags.aspx?a=2&e=" & txtEmail.Text & "'>here</a>" & vbCrLf

   htmlRequest = vbCrLf & vbCrLf & _
   "If you wish to receive your next 'isotop' email in color (html) please click " & vbCrLf & _
   "http://www.isotop.net/isotop-execute/flags.aspx?a=1&e=" & txtEmail.Text

   htmlFooter = "<br>" & _
   "To unsubscribe from this email list click <a href='http://www.isotop.net/isotop-execute/flags.aspx?a=0&e=" & txtEmail.Text & "'>here</a>"

   txtFooter = vbCrLf & _
   "To unsubscribe from this email list click" & vbCrLf & "http://www.isotop.net/isotop-execute/flags.aspx?a=0&e=" & txtEmail.Text

   send_host      = txtHost.Text
   send_from      = frmMessage.cmbFrom.Text
   send_subject   = frmMessage.txtSubject.Text
   send_body      = htmlEncode & zit & txtRequest & htmlFooter
   send_text      = frmMessage.txtBody.Text & htmlRequest & txtFooter
   send_recipient = txtEmail.Text

   Set Mailer = CreateObject("SMTPsvg.Mailer")
   Mailer.RemoteHost  = send_host
   Mailer.FromName    = "isotop Global Partnership"
   Mailer.FromAddress = send_from
   Mailer.AddRecipient send_recipient, send_recipient
   Mailer.Subject     = send_subject
   If contentType = "text/html" Then
      Mailer.contentType = contentType
      Mailer.BodyText    = send_body
   ElseIf contentType = "plain/text" Then
      Mailer.BodyText    = send_text
   End If
   If Not Mailer.SendMail Then
      mailsend = False
   Else
      mailsend = True
   End If

   If mailsend = False Then
      MsgBox ("Mail Send Failure : " & Mailer.response)
   ElseIf mailsend = True Then
      MsgBox ("Mail Send Success : " & sendAmount)
   End If
   Set Mailer = Nothing

   Call MouseChange("frmMessage", "Normal")
   Unload frmSingle

            Else
               MsgBox ("Please supply recipients address")
            End If
         Else
            MsgBox ("Please supply a Subject header")
         End If
      Else
         MsgBox ("Please select a From address")
      End If
   Else
      MsgBox ("Please select a Content type")
   End If
End Sub

Private Sub Form_Load()
   cmdDebug.Visible = False
End Sub

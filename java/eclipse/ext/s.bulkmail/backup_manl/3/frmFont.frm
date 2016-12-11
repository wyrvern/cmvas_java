VERSION 5.00
Begin VB.Form frmFont 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Fonts"
   ClientHeight    =   2055
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4740
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2055
   ScaleWidth      =   4740
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdUndo 
      Caption         =   "Undo"
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
      Left            =   3360
      TabIndex        =   11
      Top             =   1680
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Ok"
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
      TabIndex        =   10
      Top             =   1680
      Width           =   1215
   End
   Begin VB.CommandButton cmdApply 
      Caption         =   "Apply"
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
      TabIndex        =   9
      Top             =   1680
      Width           =   1215
   End
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000009&
      ForeColor       =   &H80000008&
      Height          =   2055
      Left            =   0
      ScaleHeight     =   2025
      ScaleWidth      =   4665
      TabIndex        =   0
      Top             =   0
      Width           =   4695
      Begin VB.CheckBox chkColor 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Check1"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   1560
         TabIndex        =   14
         Top             =   1200
         Width           =   255
      End
      Begin VB.CheckBox chkSize 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Check1"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   1560
         TabIndex        =   13
         Top             =   480
         Width           =   255
      End
      Begin VB.CheckBox chkType 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Check1"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   1560
         TabIndex        =   12
         Top             =   120
         Width           =   255
      End
      Begin VB.CommandButton cmdColor 
         Caption         =   "Color"
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
         Top             =   1200
         Width           =   1215
      End
      Begin VB.ComboBox cmbColor 
         Height          =   315
         Left            =   1920
         TabIndex        =   4
         Top             =   1200
         Width           =   2655
      End
      Begin VB.ComboBox cmbFont 
         Height          =   315
         ItemData        =   "frmFont.frx":0000
         Left            =   1920
         List            =   "frmFont.frx":0002
         Sorted          =   -1  'True
         TabIndex        =   3
         Top             =   120
         Width           =   2655
      End
      Begin VB.ComboBox cmbSize 
         Height          =   315
         Left            =   1920
         TabIndex        =   2
         Top             =   480
         Width           =   2655
      End
      Begin VB.ComboBox cmbStyle 
         Height          =   315
         Left            =   1920
         TabIndex        =   1
         Top             =   840
         Width           =   2655
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Font Style :"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   840
         Width           =   1215
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Font Size :"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   480
         Width           =   1215
      End
      Begin VB.Label lblSubject 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Font Type :"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   120
         Width           =   1215
      End
   End
End
Attribute VB_Name = "frmFont"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdApply_Click()

For i = 1 To 4
If i = 1 Then

If cmbFont.Text <> "" And _
   chkType.value = 1 Then
  If frmMessage.txtBody.SelText <> "" Then
     frmMessage.txtBody.SelFontName = cmbFont.Text
     Call Encode("Type", cmbFont.Text)
  Else
     frmMessage.txtBody.Font.Name = cmbFont.Text
  End If
End If

ElseIf i = 2 Then

If cmbSize.Text <> "" And _
   chkSize.value = 1 Then
  If frmMessage.txtBody.SelText <> "" Then
     frmMessage.txtBody.SelFontSize = cmbSize.Text
     Call Encode("Size", cmbSize.Text)
  Else
     frmMessage.txtBody.Font.Size = cmbSize.Text
  End If
End If

ElseIf i = 3 Then

If cmbColor.Text <> "" And _
   chkColor.value = 1 Then
  If frmMessage.txtBody.SelText <> "" Then
    If SelHex <> "" Then
       frmMessage.txtBody.SelColor = SelShow
       Call Encode("Color", SelHex)
       SelHex = Empty
       SelShow = Empty
    Else
       frmMessage.txtBody.SelColor = SelShow
       Call Encode("Color", prevColor)
    End If
  Else
     frmMessage.txtBody.Font.Name = cmbFont.Text
  End If
End If

ElseIf i = 4 Then

If cmbStyle.Text <> "" Then
If frmMessage.txtBody.SelText <> "" Then
Call Encode("Style", cmbStyle.Text)

 If cmbStyle.Text = "Bold" Then
  If frmMessage.txtBody.SelBold = False Then
  frmMessage.txtBody.SelBold = True
  Else
  frmMessage.txtBody.SelBold = False
  End If
  
 ElseIf cmbStyle.Text = "Italic" Then
  If frmMessage.txtBody.SelItalic = False Then
  frmMessage.txtBody.SelItalic = True
  Else
  frmMessage.txtBody.SelItalic = False
  End If
 
 ElseIf cmbStyle.Text = "Underline" Then
  If frmMessage.txtBody.SelUnderline = False Then
  frmMessage.txtBody.SelUnderline = True
  Else
  frmMessage.txtBody.SelUnderline = False
  End If
 
 ElseIf cmbStyle.Text = "Bullet" Then
  If frmMessage.txtBody.SelBullet = False Then
  frmMessage.txtBody.SelBullet = True
  Else
  frmMessage.txtBody.SelBullet = False
  End If
 End If
Else
 If cmbStyle.Text = "Bold" Then
  If frmMessage.txtBody.Font.Bold = False Then
  frmMessage.txtBody.Font.Bold = True
  Else
  frmMessage.txtBody.Font.Bold = False
  End If
 
 ElseIf cmbStyle.Text = "Italic" Then
  If frmMessage.txtBody.Font.Italic = False Then
  frmMessage.txtBody.Font.Italic = True
  Else
  frmMessage.txtBody.Font.Italic = False
  End If
 
 ElseIf cmbStyle.Text = "Underline" Then
  If frmMessage.txtBody.Font.Underline = False Then
  frmMessage.txtBody.Font.Underline = True
  Else
  frmMessage.txtBody.Font.Underline = False
  End If
  
 ElseIf cmbStyle.Text = "Bullet" Then
 MsgBox ("Option only available for selected text")
 End If
End If
End If

End If
Next i

If chkType.value = 0 And chkSize.value = 0 And chkColor.value = 0 And cmbStyle.Text = "" Then
   MsgBox ("No selections checked")
End If

End Sub
Private Sub cmdCancel_Click()
Unload frmFont
End Sub
Private Sub cmdColor_Click()
SelHex = Empty
SelShow = Empty
frmMail.cmd.Flags = cdlCCRGBInit
frmMail.cmd.ShowColor
SelShow = frmMail.cmd.Color
txtHex = Format(Hex$(frmMail.cmd.Color), "!")

Dim SelColor As Long
Dim Red, Green, Blue As Integer

SelColor = frmMail.cmd.Color
Red = SelColor Mod &H100
SelColor = SelColor \ &H100
Green = SelColor Mod &H100
SelColor = SelColor \ &H100
Blue = SelColor Mod &H100

Red = Red * -1
Green = Green * -1
Blue = Blue * -1

Red = Red * -1
Green = Green * -1
Blue = Blue * -1

HexRed = Hex$(Red)
If Len(HexRed) = 1 Then HexRed = "0" & HexRed
HexGreen = Hex$(Green)
If Len(HexGreen) = 1 Then HexGreen = "0" & HexGreen
HexBlue = Hex$(Blue)
If Len(HexBlue) = 1 Then HexBlue = "0" & HexBlue

SelHex = "#" & HexRed & HexGreen & HexBlue
cmbColor.Text = SelHex

End Sub
Private Sub cmdUndo_Click()
frmMessage.txtBody.SelFontSize = prevSize
frmMessage.txtBody.SelColor = prevColor
frmMessage.txtBody.SelFontName = prevFont
If prevStyle = "BIU" Then
frmMessage.txtBody.SelBold = True
frmMessage.txtBody.SelItalic = True
frmMessage.txtBody.SelUnderline = True
ElseIf prevStyle = "B" Then
frmMessage.txtBody.SelBold = True
frmMessage.txtBody.SelItalic = False
frmMessage.txtBody.SelUnderline = False
ElseIf prevStyle = "I" Then
frmMessage.txtBody.SelBold = False
frmMessage.txtBody.SelItalic = True
frmMessage.txtBody.SelUnderline = False
ElseIf prevStyle = "U" Then
frmMessage.txtBody.SelBold = False
frmMessage.txtBody.SelItalic = False
frmMessage.txtBody.SelUnderline = True
ElseIf prevStyle = "IU" Then
frmMessage.txtBody.SelBold = False
frmMessage.txtBody.SelItalic = True
frmMessage.txtBody.SelUnderline = True
ElseIf prevStyle = "BU" Then
frmMessage.txtBody.SelBold = True
frmMessage.txtBody.SelItalic = False
frmMessage.txtBody.SelUnderline = True
ElseIf prevStyle = "BI" Then
frmMessage.txtBody.SelBold = True
frmMessage.txtBody.SelItalic = True
frmMessage.txtBody.SelUnderline = False
End If
End Sub
Private Sub Form_Load()

prevSize = frmMessage.txtBody.SelFontSize
prevColor = frmMessage.txtBody.SelColor
prevFont = frmMessage.txtBody.SelFontName

If prevColor = 0 Then
prevColor = "#000000"
End If

If frmMessage.txtBody.SelText <> "" Then
   frmFont.cmbFont.Text = prevFont
   frmFont.cmbSize.Text = prevSize
   frmFont.cmbColor.Text = prevColor
End If

'If frmMessage.txtBody.SelBold = True And _
'frmMessage.txtBody.SelItalic = True And _
'frmMessage.txtBody.SelUnderline = True Then
'prevStyle = "BIU"
'ElseIf frmMessage.txtBody.SelBold = True And _
'frmMessage.txtBody.SelItalic = False And _
'frmMessage.txtBody.SelUnderline = False Then
'prevStyle = "B"
'ElseIf frmMessage.txtBody.SelBold = False And _
'frmMessage.txtBody.SelItalic = True And _
'frmMessage.txtBody.SelUnderline = False Then
'prevStyle = "I"
'ElseIf frmMessage.txtBody.SelBold = False And _
'frmMessage.txtBody.SelItalic = False And _
'frmMessage.txtBody.SelUnderline = True Then
'prevStyle = "U"
'ElseIf frmMessage.txtBody.SelBold = True And _
'frmMessage.txtBody.SelItalic = True And _
'frmMessage.txtBody.SelUnderline = False Then
'prevStyle = "BI"
'ElseIf frmMessage.txtBody.SelBold = False And _
'frmMessage.txtBody.SelItalic = True And _
'frmMessage.txtBody.SelUnderline = True Then
'prevStyle = "IU"
'ElseIf frmMessage.txtBody.SelBold = False And _
'frmMessage.txtBody.SelItalic = False And _
'frmMessage.txtBody.SelUnderline = True Then
'prevStyle = "BU"
'End If

End Sub

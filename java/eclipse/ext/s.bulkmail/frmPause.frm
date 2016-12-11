VERSION 5.00
Begin VB.Form frmPause 
   Caption         =   "Pause"
   ClientHeight    =   780
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4410
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   ScaleHeight     =   780
   ScaleWidth      =   4410
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Cancel"
      Height          =   255
      Left            =   1560
      TabIndex        =   3
      Top             =   480
      Width           =   1335
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "&Ok"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   480
      Width           =   1335
   End
   Begin VB.TextBox txtSeconds 
      Height          =   285
      Left            =   1680
      TabIndex        =   0
      Top             =   120
      Width           =   2655
   End
   Begin VB.Label Label1 
      Caption         =   "Pause for (seconds) :"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   1815
   End
End
Attribute VB_Name = "frmPause"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
   Unload Me
End Sub
Private Sub cmdOk_Click()

   Period = txtSeconds.Text * 1000
   Sleep (Period)

End Sub

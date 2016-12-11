VERSION 5.00
Begin VB.Form frmAssist 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "debug"
   ClientHeight    =   1620
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4800
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1620
   ScaleWidth      =   4800
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Text14 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   285
      Left            =   120
      TabIndex        =   1
      Text            =   "debug.res"
      Top             =   120
      Width           =   4575
   End
   Begin VB.TextBox txtDebug 
      Height          =   1005
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   0
      Top             =   480
      Width           =   4575
   End
End
Attribute VB_Name = "frmAssist"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

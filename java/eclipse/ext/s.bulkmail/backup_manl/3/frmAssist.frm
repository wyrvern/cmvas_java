VERSION 5.00
Begin VB.Form frmAssist 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "debug Assistant"
   ClientHeight    =   7920
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4800
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7920
   ScaleWidth      =   4800
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Text14 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   4845
      Left            =   120
      TabIndex        =   19
      Text            =   "debug response"
      Top             =   3000
      Width           =   2055
   End
   Begin VB.TextBox txtDebug 
      Height          =   4845
      Left            =   2280
      MultiLine       =   -1  'True
      TabIndex        =   18
      Top             =   3000
      Width           =   2415
   End
   Begin VB.TextBox Text12 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   285
      Left            =   120
      TabIndex        =   17
      Text            =   "arbitrary text"
      Top             =   3000
      Width           =   2055
   End
   Begin VB.TextBox txtArb 
      Height          =   885
      Left            =   2280
      TabIndex        =   16
      Text            =   "0"
      Top             =   3000
      Width           =   2415
   End
   Begin VB.TextBox Text13 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   285
      Left            =   120
      TabIndex        =   15
      Text            =   "(x) mouse position"
      Top             =   2640
      Width           =   2055
   End
   Begin VB.TextBox txtXpos 
      Height          =   285
      Left            =   2280
      TabIndex        =   14
      Top             =   2640
      Width           =   2415
   End
   Begin VB.TextBox Text11 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   285
      Left            =   120
      TabIndex        =   13
      Text            =   "(y) mouse position"
      Top             =   2280
      Width           =   2055
   End
   Begin VB.TextBox txtYpos 
      Height          =   285
      Left            =   2280
      TabIndex        =   12
      Top             =   2280
      Width           =   2415
   End
   Begin VB.TextBox f 
      Height          =   285
      Left            =   2280
      TabIndex        =   11
      Top             =   1200
      Width           =   2415
   End
   Begin VB.TextBox e 
      Height          =   285
      Left            =   2280
      TabIndex        =   10
      Top             =   1920
      Width           =   2415
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   285
      Left            =   120
      TabIndex        =   9
      Text            =   "[active] line_current :"
      Top             =   1920
      Width           =   2055
   End
   Begin VB.TextBox Text10 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   285
      Left            =   120
      TabIndex        =   8
      Text            =   "[active] cursor_pos :"
      Top             =   1200
      Width           =   2055
   End
   Begin VB.TextBox Text9 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   285
      Left            =   120
      TabIndex        =   7
      Text            =   "[active] line_number :"
      Top             =   1560
      Width           =   2055
   End
   Begin VB.TextBox Text8 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   285
      Left            =   120
      TabIndex        =   6
      Text            =   "[active] line_length :"
      Top             =   840
      Width           =   2055
   End
   Begin VB.TextBox Text7 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   285
      Left            =   120
      TabIndex        =   5
      Text            =   "[array] array_len :"
      Top             =   480
      Width           =   2055
   End
   Begin VB.TextBox Text6 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   285
      Left            =   120
      TabIndex        =   4
      Text            =   "[array] array_no :"
      Top             =   120
      Width           =   2055
   End
   Begin VB.TextBox d 
      Height          =   285
      Left            =   2280
      TabIndex        =   3
      Top             =   1560
      Width           =   2415
   End
   Begin VB.TextBox c 
      Height          =   285
      Left            =   2280
      TabIndex        =   2
      Top             =   840
      Width           =   2415
   End
   Begin VB.TextBox b 
      Height          =   285
      Left            =   2280
      TabIndex        =   1
      Top             =   480
      Width           =   2415
   End
   Begin VB.TextBox a 
      Height          =   285
      Left            =   2280
      TabIndex        =   0
      Top             =   120
      Width           =   2415
   End
End
Attribute VB_Name = "frmAssist"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

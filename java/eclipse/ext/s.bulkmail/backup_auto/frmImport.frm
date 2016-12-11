VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frmImport 
   Caption         =   "Import"
   ClientHeight    =   825
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5445
   Icon            =   "frmImport.frx":0000
   LinkTopic       =   "Import"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   825
   ScaleWidth      =   5445
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdImport 
      Caption         =   "Import"
      Height          =   255
      Left            =   3840
      TabIndex        =   2
      Top             =   480
      Width           =   1575
   End
   Begin MSComDlg.CommonDialog cmd 
      Left            =   2880
      Top             =   720
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox txtFile 
      Height          =   285
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   3615
   End
   Begin VB.CommandButton cmdLoad 
      Caption         =   "Load File"
      Height          =   255
      Left            =   3840
      TabIndex        =   0
      Top             =   120
      Width           =   1575
   End
End
Attribute VB_Name = "frmImport"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Function importLoad(localText As String)

Set conn = CreateObject("ADODB.Connection")
With conn
   .Provider = "Microsoft.Jet.OLEDB.4.0"
   .ConnectionString = App.Path & "\isotop.mdb"
   .Open
End With

split_a = Split(localText, vbCrLf)

For x = 1 To UBound(split_a) - 1
   split_b = Split(split_a(x), ",")
   sql_a = "INSERT INTO s_lc_book (s_lc_id, s_lc_name, s_lc_email) VALUES ('0', '" & split_b(0) & "', '" & split_b(1) & "')"
   conn.Execute (sql_a)
Next x

End Function



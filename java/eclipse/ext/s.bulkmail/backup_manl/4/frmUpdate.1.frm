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
         Begin InetCtlsObjects.Inet conn_c_inet
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
         Begin VB.Timer conn_c_timer 
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
            Begin VB.CheckBox conn_c_connected 
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
            Begin VB.CheckBox conn_c_progress 
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
            Begin VB.CheckBox conn_c_check
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
         Begin VB.TextBox conn_c_hub 
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
         Begin VB.TextBox conn_c_status 
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

public debug_i_m as integer

Private Sub cmdCancel_Click()
   Unload frmuspdate
   Exit Sub
End Sub

Private Sub cmdFinish_Click()
   Unload frmUpdate
   Exit Sub
End Sub

Private Sub Form_Load()
   debug_i_m = 0

   cmdFinish.Enabled = False
   cmdCancel.Enabled = True
   txtState.Visible  = False
   conn_c_hub.Visible       = False
   Data.Visible      = True
End Sub

Private Sub Form_Unload(Cancel As Integer)
   Unload frmUpdate
End Sub

Private Sub conn_c_timer_Timer()
  conn_c_timer.Enabled = False
End Sub

Private Sub form_activate()
'#--------------------------------------------
'req:
'- dbSection : Table
'- dbPos     : Last field ID
'- dbFieldID : Table field ID
'- dbField   : Table field ID to update
'#--------------------------------------------

   dim db_section,
       db_f_id,
       db_f as variant

   dim sql_s_s    as string    'sqlStatement
   dim sql_s_u    as string    'updateStr
   dim sql_s_r    as string    'resultStr

   dim sql_i_c    as integer   'sqlCount
   dim sql_i_fc   as integer   'fCount
   dim sql_i_p    as integer   'sqlPersist

   '//dim id_v_idp   as variant   'idParm
   dim id_b_skp   as boolean   'skipInit

   dim sql_v_u    as variant   'updateComp
   dim sql_s_d    as string    'updateData
   dim sql_v_s    as variant   'updateSpin
   dim sql_s_db   as string    'updateSql
   dim sql_v_fprm as variant   'findParm
   dim sql_v_dbsp as variant   'dbSpace

   dim sql_v_add  as variant   'dbadd

   set conn = CreateObject("ADODB.Connection")
   with conn
      .provider         = "Microsoft.Jet.OLEDB.4.0"
      .connectionstring = app.path & dbfile
      .open
   end with

   db_section   = array("Orders", "Downloads", "Assess", "ReferralResellers", "ReferredCustomers", "ProductResellers", "SSContracts", "s_iso14000_org")
   db_f_id      = array("OrderID", "DnID", "AssessID", "RrID", "RcID", "PrID", "SsID", "s_iso14000_org_id")
   db_f         = array("OrderID,CustomerEmail,CustomerName,Date,ApprovalCode,flags", "DnID,Email,FirstName,LastName,CurrentDate,flags", "AssessID,Email,FirstName,LastName,CurrentDate,flags", "RrID,RREmail,RRFirstName,RRLastName,RRCurrentDate,flags", "RcID,RCEmail,RCFirstName,RCLastName,RCCurrentDate,flags", "PrID,Email,FirstName,LastName,CurrentDate,Active,flags", "SsID,CustomerEmail,CustomerName,Date,flags", "s_iso14000_org_id,s_iso14000_org_email,s_iso14000_org_name,s_iso14000_org_date,flags")

   ' sendSection
   ' sendFieldID
   ' sendField

   db_s_section = "Orders,Downloads,Assess,ReferralResellers,ReferredCustomers,ProductResellers,SSContracts,s_iso14000_org"
   db_s_f_id    = "OrderID,DnID,AssessID,RrID,RcID,PrID,SsID,s_iso14000_org_id"
   db_s_f       = "OrderID,CustomerEmail,CustomerName,Date,ApprovalCode,flags;DnID,Email,FirstName,LastName,CurrentDate,flags;AssessID,Email,FirstName,LastName,CurrentDate,flags;RrID,RREmail,RRFirstName,RRLastName,RRCurrentDate,flags;RcID,RCEmail,RCFirstName,RCLastName,RCCurrentDate,flags;PrID,Email,FirstName,LastName,CurrentDate,Active,flags;SsID,CustomerEmail,CustomerName,Date,flags;s_iso14000_org_id,s_iso14000_org_email,s_iso14000_org_name,s_iso14000_org_date,flags"

   db_i_pos     = 0       ' dbPosition
   db_i_array   = Empty   ' posArray

'---------------------------------------------------// current/record_amount
   for i = 0 To UBound(db_s_section)
      sql_s_s   = "SELECT * FROM " & db_section(i)
      set rs    = conn.execute(sql_s_s)

      sql_i_p   = empty

      do while not rs.eof
         sql_i_p = rs(db_f_id(sql_i_c))
         rs.movenext
      loop
      if isempty(db_i_array) = true then
         db_i_array = sql_i_p
      elseif isempty(db_i_array) = false then
         db_i_array = db_i_array & "," & sql_i_p
      end if
      sql_i_c = sql_i_c + 1
      rs.close
   next i

'---------------------------------------------------// msinet - properties
   conn_c_inet
   conn_c_inet.RequestTimeout = 900

   if debug_i_m     = 0 then
      conn_c_inet.URL = "www.isotop.net"
   elseIf debug_i_m = 1 Then
      conn_c_inet.URL = "null"
   end if

   sql_s_u                = "/isotop-execute/s_get_exec_hubrun.aspx?db_section=" & db_s_section & "&db_i_pos=" & db_i_array & "&db_f_id=" & db_s_f_id & "&db_f=" & db_s_f & ""
   conn_c_inet.RemotePort = 80
   conn_c_inet.Protocol   = icHTTP
   conn_c_check.value     = 1
   conn_c_timer.Enabled   = True
   conn_c_status.Text     = "Contacting..."
   conn_c_inet.Document   = sql_s_u

   conn_c_hub             = conn_c_inet.OpenURL

   conn_c_connected.value = 1
   conn_c_timer.Enabled   = true
   conn_c_status.Text     = "Contacted"
   sql_s_r                = conn_c_inet.OpenURL
   conn_c_inet.Cancel

   debug.print conn_c_inet.URL
'---------------------------------------------------// record position
   if instr(sql_s_r, "(d)") = 0 then
      id_b_skp = true
      msgbox ("Your records are up to date")
      unload frmUpdate
      exit sub
   end if
'---------------------------------------------------//
   conn_c_progress.value = 1
   conn_c_timer.Enabled  = True
   conn_c_status.Text    = "Updating..."
   sql_i_fc              = empty
   sql_i_c               = empty
'---------------------------------------------------//
   for i = 0 To UBound(db_section)
      sql_s_s     = "SELECT * FROM " & db_section(i)
      set rs      = conns.Execute(sql_s_s)
      sql_i_p     = empty
      db_i_pos    = empty

      do while not rs.eof
         sql_i_p  = rs(db_f_id(sql_i_fc))
         rs.movenext
      loop
      db_i_pos    = sql_i_p
      rs.close

      sql_v_u     = split(sql_s_r, "(s)")
      sql_v_udata = split(sql_v_u(sql_i_fc), "(d)")
'---------------------------------------------------// loop
      for j = 0 to UBound(sql_v_udata)
         sql_v_s  = split(sql_v_udata(j), "[;]")
         sql_db_f = split(db_f(sql_i_fc), ",")
    
         for c = 0 to UBound(sql_v_s)
            if sql_i_c < 1 then
               db_i_pos = c
            elseif sql_i_c = 1 then
               sql_v_add = replace(sql_db_f(sql_i_c), "s_iso14000_org_date", "CurrentDate")
               sql_v_add = replace(sql_db_f(sql_i_c), "Date", "CurrentDate")
               if len(sql_v_s(c)) = 0 then
                  sql_v_s(c) = " "
               end if
               sql_s_db = "insert into " & db_section(i) & "(" & db_f_ID(fCount) & "," & dbAdd & ") " & "values('" & dbPosition & "', '" & Replace(findParm, "'", "''") & "')"
               conn.execute (sql_s_db)

            elseif sql_i_c > 0 then
               if sql_i_c < UBound(sql_db_f) + 1 then
                  if instr(sql_db_f(sql_i_c), "Date") <> 0 then
                     if len(sql_v_s(c)) = 0 then
                        findParm = " "
                     End If
                     updateSql = "update " & db_section(i) & " set " & _
                               Replace(dbFieldS(sql_i_c), dbFieldS(sql_i_c), "CurrentDate") & " = '" & _
                               Replace(findParm, "'", "''") & _
                              "' where " & db_f_ID(fCount) & _
                              " = " & dbPosition
                  Else
                     dbAdd = Replace(dbFieldS(sql_i_c), "s_iso14000_org_date", "CurrentDate")
                     If Len(findParm) = 0 Then
                        findParm = " "
                     End If
                     updateSql = "update " & db_section(i) & " set " & _
                                 dbAdd & " = '" & _
                                 Replace(findParm, "'", "''") & _
                                 "' where " & db_f_ID(fCount) & _
                                 " = " & dbPosition
                  End If
                  conns.Execute (updateSql)
               ElseIf sql_i_c > UBound(dbFieldS) + 1 Then
                  Exit For
               End If
            End If
            sql_i_c = sql_i_c + 1
         Next findParm
         sql_i_c = Empty
      Next sql_v_f
      fCount = fCount + 1
   Next i

   dbPosition = Empty

   chkSuccess.value = 1
   conn_c_timer.Enabled = True
   conn_c_status.Text = "Update Complete"
   cmdFinish.Enabled = True
   cmdCancel.Enabled = False
   Set conns = Nothing
 
End Sub

Private Sub conn_c_inet_StateChanged(ByVal State As Integer)
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

Attribute VB_Name = "modMain"
'------------------------------------Revision:1.0.e.7:2001/07/31
'------------------------------------Lib/Declarations-------------------------------]
'
'HINSTANCE ShellExecute(
'    HWND hwnd,
'    LPCTSTR lpOperation,
'    LPCTSTR lpFile,
'    LPCTSTR lpParameters,
'    LPCTSTR lpDirectory,
'    INT nShowCmd
');
Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Declare Function TerminateProcess Lib "kernel32.dll" (ByVal hProcess As Long, ByVal uExitCode As Long) As Boolean
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

'------------------------------------Var/Declarations-------------------------------]

Public iCount As Variant                        ' record Count
Public iTotal As Variant                        ' record Total

Public runCheck As Variant

Public conn As Variant
Public Shift As Boolean
Public sendAmount As Integer
Public frmStr As Variant
Public frmPattern As Variant
Public Pos As Integer                           '//key_code
Public Third As Integer                         '//control_key

Public line_length As Integer                   '//new_line_position
Public line_number As Integer                   '//line_number
Public line_current As Integer                  '//line_current
Public input_length As Integer                  '//line_length
Public cursor_pos As Integer                    '//cursor_position
Public larray As Variant                        '//line_length/number array
Public lsplit As Variant                        '//split array
Public skip As Boolean                          '//skip:split_array
Public negv As Integer                          '//data_var/negate no
Public array_no As Integer                      '//line_number
Public array_len As Integer                     '//line_length
Public line_numberf As Variant                  '//line_number_first
Public r_accumulation As Integer                '//return_accumulation
Public single_r_forline As Integer              '//single_return_forline
Public single_r_forline_init As Variant         '//single_return_forline init
Public single_d_forline_init As Variant         '//single_down_forline init
Public single_d_forline As Integer              '//single_down_forline
Public line_change As Boolean                   '//line_change
Public break_line As Integer                    '//break_line
Public string_number_start As Variant
Public string_number_end As Variant
Public string_length_start As Variant
Public string_length_end As Variant
Public end_accumulation As Variant              '//acummulation-end/key
Public line_longest As Variant                  '//longest_line
Public retain As Variant                        '//retainer for debug
Public line_highest As Variant                  '//highest vertical value

Public zOrder As Boolean                        '//eval on chr(space)
Public rOrder As Variant                        '//eval on chr(ident)
Public halt As Boolean                          '//drop cursor movement
Public check_pos As Integer                     '//loop counter

Public rep_original As Variant                  '// orignal replacement / array
Public rep_replacer As Variant                  '// replace with () / array

Public BackS As Variant
Public BackStart As Variant
Public Var As Variant
Public DataRem As Variant
Public BodyLength As Variant
Public BodyTrap As Variant
Public BodyCheck As Variant

Public DataVar As Variant
Public DataChar As Variant
Public DataInf As Variant
Public DataEncode As Variant

Public dSelection As String                     '//selected_text
Public dFont As String                          '//font_type
Public dLen As Integer                          '//length_font_type
Public dHline_number As Integer                 '//html_length+font_length
Public dreplace As Variant                      '//replace_function

Public dbSection As String                      '//database,Table
Public dbArraySection As Variant
Public dbFieldID As String                      '//database,Field ID
Public dbArray As Variant
Public dbField As String
Public dbPosition As Integer                    '//database,Position ID
Public posArray As Variant                      '//database,Position ID
Public Connval As Boolean                       '//internet connectivity:t/f

Public Basic As Variant
Public SelColor As Variant                      '//color variable
Public SelShow As Variant                       '//vb color variable
Public SelHex As String                         '//vb color variable

Public Red As Integer
Public Green As Integer
Public Blue As Integer
Public HexRed As String
Public HexGreen As String
Public HexBlue As String

Public prevSize As Variant                      '//previous size
Public prevColor As Variant                     '//previous color
Public prevStyle As Variant                     '//previous style
Public prevFont As Variant                      '//previous font

Public xPos As Integer                          '//mouse y poisition/converted
Public yPos As Integer                          '//mouse y poisition/converted
Public mouseClick As Integer                    '//no of mouse clicks/on/txtbody
Public mArray As Variant                        '//array for y/xpos-return
Public yl As Integer                            '//addtional on y pos

Public constValue As Integer                    '//value of <constants>->selection
Public txtValue As Integer                      '//value of non<constants>->selection
Public curLocation As Integer                   '//value of current location->selection

Public contentType As String                    '//mailer selected content value
Public attachString As String                   '//attachment file location

'------------------------------------State-------------------------------------------]

Public pause As Boolean

'------------------------------------File/Declarations-------------------------------]
'Global Const dbfile = "\isotop.mdb"
Public dbfile As String
Public db_selection As Integer

Public importFile As String
Public dataFile As String

'------------------------------------mail/parser
Public datalen
Public substlen
Public dsubst
Public xreplace
Public zit
Public datahttp
Public datamail
Public mailpos
'------------------------------------VERSION
Public Version As String
Public Revision As String
'-----------------------------------------------------------------------------/

Public whole As String
Public mailsend As Boolean
Public Function Delay()
   While (pause = True)
   Wend
End Function
Public Function importInit()

frmMail.cmd.ShowOpen
importFile = frmMail.cmd.FileName

If InStr(importFile, ".csv") = 0 Then
   MsgBox ("File error : must be of type .csv (Comma Delimited)")
   Exit Function
End If

Dim fs, a
Set fs = CreateObject("scripting.filesystemobject")

Set a = fs.opentextfile(importFile, 1, True)
dataFile = a.ReadAll
a.Close

importLoad (dataFile)

End Function
Private Function importLoad(localText As String)

Call MouseChange("frmMail", "Wait")

Set conn = CreateObject("ADODB.Connection")
With conn
   .Provider = "Microsoft.Jet.OLEDB.4.0"
   .ConnectionString = App.Path & "\crystalclear.mdb"
   .Open
End With

split_a = Split(localText, vbCrLf)

For x = 1 To UBound(split_a) - 1
   split_a(x) = Replace(split_a(x), Chr(34), "")
   split_a(x) = Replace(split_a(x), "'", "")
   split_a(x) = Replace(split_a(x), "?", "")
   
   split_b = Split(split_a(x), ",")
   If UBound(split_b) > 1 Then
      split_a(x) = Replace(split_a(x), ",", "", 1, UBound(split_b) - 1, vbTextCompare)
   End If
   split_b = Split(split_a(x), ",")
   
   '------------------------------------------------------------------;

   If split_b(0) = "" Then
      inName = " "
   Else
      inName = split_b(0)
   End If

   If split_b(1) = "" Then
      inEmail = " "
   Else
      inEmail = split_b(1)
   End If
   
   inName = Left(inName, 50)
   inEmail = Left(inEmail, 50)

   '------------------------------------------------------------------;

   
   sql_a = "INSERT INTO s_lc_book (s_lc_id, s_lc_name, s_lc_email) VALUES ('0', '" & inName & "', '" & inEmail & "')"
   'MsgBox (sql_a)
   conn.Execute (sql_a)
Next x

Call MouseChange("frmMail", "Normal")

MsgBox ("File imported.")

End Function
Public Function dCheck()

If frmMail.grdMain.Rows > 2 Then
   whole = Empty

   rowLimit = frmMail.grdMain.Rows - 3

   For i = 1 To rowLimit
   Shift = False
   If i < rowLimit Then
'     If InStr(whole, frmMail.grdMain.TextMatrix(i, 1)) <> 0 Then
      If InStr(whole, frmMail.grdMain.TextMatrix(i, 2)) <> 0 Then
         'MsgBox (whole & frmMail.grdMain.TextMatrix(i, 3))
         Shift = True
         frmMail.grdMain.RemoveItem (i)
         rowLimit = rowLimit - 1
         i = i - 1
      End If
'     whole = whole & " " & frmMail.grdMain.TextMatrix(i, 1)
      whole = whole & " " & frmMail.grdMain.TextMatrix(i, 2)
   End If
   Next i
End If

iCount = frmMail.grdMain.Rows - 2
frmMail.StatusBar.Panels.Item(1).Text = iCount & "/" & iTotal

End Function
'------------------------------------Set db Globals
Public Function substhttp(value As Variant)
 subst = "<a href='" & value & "'>" & value & "</a>"
 substlen = Len(subst) - Len(value)
 info = Mid(zit, 1, datahttp - 1)
  xreplace = Replace(zit, value, subst, datahttp, 1)
  zit = info & xreplace
  datalen = Len(zit)
End Function
Public Function substmail(value As Variant)
 subst = "<a href=mailto:" & value & ">" & value & "</a>"
 substlen = Len(subst) - Len(value)
 info = Mid(zit, 1, mailpos - 1)
 xreplace = Replace(zit, value, subst, mailpos, 1)
  zit = info & xreplace
  datalen = Len(zit)
  
' MsgBox ("[" & xreplace & "]")
' frmSingle.txtDebug.Text = frmSingle.txtDebug.Text & (zit) & Chr(13)
End Function
Public Function dhttp()
 
For i = 1 To datalen * 2
 q = Empty
 datahttp = InStr(i, zit, "http://")
If datahttp <> 0 Then
  cp = -1
For z = datahttp To datalen
  q = q + 1
  sit = Mid(zit, z + 1, 1)
  sbyte = Mid(zit, datahttp, q)
  If sit <> Empty Then
   ansibit = Asc(sit)
  End If
  If sit = "" Or _
     sit = " " Or _
     sit = "," Or _
     sit = "<" Or _
     sit = ">" Or _
     ansibit = 13 And _
     cp = -1 Then
   substhttp (sbyte)
   cp = Empty
   sbyte = Empty
   sit = Empty
   ansibit = Empty
   z = Empty
   i = datahttp + substlen
   Exit For
  End If
 Next
End If
Next
End Function
Public Function dmail()
For i = 1 To datalen * 2
 f = 0
 datamail = InStr(i, zit, "@")

If datamail <> 0 Then
 cp = -1
 
 If x = Empty Then
  x = datamail
 Else: x = x
 End If
 If c = Empty Then
  c = datamail
 Else: c = c
 End If
 
 n = datamail - 20
   If n < 0 Then
     n = -1
   End If
 Do Until x = n
  sit = Mid(zit, x + 1, 1)
  If sit <> Empty Then
   ansifit = Asc(sit)
  End If
  If sit = "" Or _
     sit = " " Or _
     sit = "," Or _
     sit = "<" Or _
     sit = ">" Or _
     x = 0 Or _
     ansifit = 13 And _
     cp = -1 Then
        If x = 0 Then
           iz = x + 1
        Else: iz = x + 2
        End If
     sbit = Mid(zit, iz, c - iz)
     mailpos = iz
     
  Exit Do
 End If
 x = x - 1
 Loop

For z = datamail To datalen
 f = f + 1
 fit = Mid(zit, z + 1, 1)
 sfit = Mid(zit, datamail, f)
 If fit <> Empty Then
  ansifit = Asc(fit)
 End If
 If fit = "" Or _
    fit = " " Or _
    fit = "," Or _
    fit = "<" Or _
    fit = ">" Or _
    ansifit = 13 And _
    cp = -1 Then

  substmail (sbit & sfit)
  cp = Empty
  sfit = Empty
  fit = Empty
  ansifit = Empty
  z = Empty
  x = Empty
  c = Empty
  mailpos = Empty
  i = datamail + f + substlen
  Exit For
 End If
Next

End If
Next
End Function
Public Function xmain(argv)
datalen = Empty
substlen = Empty
dsubst = Empty
xreplace = Empty
zit = Empty
datahttp = Empty
datamail = Empty

 zit = argv
 datalen = Len(zit)
 Call dhttp
 Call dmail
End Function
Public Function goCount(curLocation As Integer)

Dim braceHit As Integer
Dim countIn As Integer
Dim countOut As Integer
Dim chrReturn As String
Dim chrFar As String
Dim goContinue As Boolean
Dim breakOn As Boolean
Dim moveCursor As Integer
Dim chrBreak As String

goContinue = True
moveCursor = 1

Do While goContinue = True
   If curLocation <> 0 Then

  chrReturn = Mid(DataVar, moveCursor, 1)
  chrFar = Mid(DataVar, moveCursor + 1, 1)
  chrBreak = Mid(DataVar, moveCursor, 4)
  moveCursor = moveCursor + 1

If chrBreak = "<br>" Then
   curLocation = curLocation - 2
End If

If chrReturn = "<" Then
           braceHit = braceHit + 1
           countIn = countIn + 1
           goContinue = True
           'MsgBox ("a(" & chrReturn & ":" & chrFar & ")")
ElseIf chrReturn <> ">" And _
       chrFar <> "<" And _
       braceHit = 1 Then
           countIn = countIn + 1
           braceHit = 1
           goContinue = True
           'MsgBox ("b(" & chrReturn & ":" & chrFar & ")")
ElseIf chrReturn = ">" And _
       chrFar <> "<" Then
           countIn = countIn + 1
           braceHit = 0
           goContinue = True
           'MsgBox ("c(" & chrReturn & ":" & chrFar & ")")
ElseIf chrReturn = ">" And _
       chrFar = "<" Then
           countIn = countIn + 1
           braceHit = 0
           goContinue = True
           'MsgBox ("d(" & chrReturn & ":" & chrFar & ")")
ElseIf chrReturn <> ">" And _
       chrReturn <> "<" And _
       braceHit = 0 Then
           countOut = countOut + 1
           braceHit = 0
           goContinue = True
           'MsgBox ("e(" & chrReturn & ":" & chrFar & ")")
Else
           'MsgBox ("f(" & chrReturn & ":" & chrFar & ")")
End If

If countOut = curLocation Then
   txtValue = countOut
   constValue = countIn
   'MsgBox (countOut & ":" & countIn)
   goContinue = False
End If

frmAssist.txtDebug.Text = frmAssist.txtDebug.Text & ":" & chrReturn

Else
   txtValue = 1
   constValue = 0
   goContinue = False
End If


Loop

End Function
Public Function Encode(Method As String, value As Variant)

check_pos = Empty
DataEncode = Empty

If Method = "Type" Then

If DataEncode = "" Then
  dSelection = frmMessage.txtBody.SelText
  DataEncode = dSelection

  Do While result = False
    check_pos = check_pos + 1
    id = Mid(DataEncode, check_pos, 1)
  If id <> "" Then
     id2 = Asc(id)
  If id2 = 13 Then
     rep_original = DataEncode
     rep_replacer = "<br>"
     DataEncode = Replace(DataEncode, id, rep_replacer)
     result = False
  End If
  If id2 = 10 Then
     rep_original = DataEncode
     rep_replacer = ""
     DataEncode = Replace(DataEncode, id, rep_replacer)
     result = False
  End If
  ElseIf id = "" Then
     result = True
  End If
  Loop

ClipDataLen = Len(DataEncode)
End If

   dFont = value
   dLen = Len(dFont)
   dHline_number = 21 + dLen
   dHTM = "<font face='" & dFont & "'>" & DataEncode & "</font>"
   goCount (frmMessage.txtBody.SelStart)
   dreplace = Replace(DataVar, DataEncode, dHTM, txtValue + constValue, 1)
   DataVar = Mid(DataVar, 1, txtValue + constValue - 1) & dreplace
   frmMessage.txtDebug.Text = DataVar
   cursor_pos = cursor_pos + dHline_number
End If

If Method = "Size" Then

If DataEncode = "" Then
   dSelection = frmMessage.txtBody.SelText
   DataEncode = dSelection
   Do While result = False
      check_pos = check_pos + 1
      id = Mid(DataEncode, check_pos, 1)
   If id <> "" Then
      id2 = Asc(id)
   If id2 = 13 Then
      rep_original = DataEncode
      rep_replacer = "<br>"
      DataEncode = Replace(DataEncode, id, rep_replacer)
      result = False
   End If
   If id2 = 10 Then
      rep_original = DataEncode
      rep_replacer = ""
      DataEncode = Replace(DataEncode, id, rep_replacer)
      result = False
   End If
   ElseIf id = "" Then
      result = True
   End If
   Loop
ClipDataLen = Len(DataEncode)
End If

   dSize = value
If dSize = 8 Then
   dSize = 2
ElseIf dSize = 8.5 Then
   dSize = 2
ElseIf dSize = 8.25 Then
   dSize = 2
ElseIf dSize = 10 Then
   dSize = 3
ElseIf dSize = 12 Then
   dSize = 4
ElseIf dSize = 14 Then
   dSize = 5
ElseIf dSize = 18 Then
   dSize = 6
ElseIf dSize = 24 Then
   dSize = 7
ElseIf dSize = 36 Then
   dSize = 8
End If
 
   dLen = Len(dSize)
   dHline_number = 21 + dLen
   dHTM = "<font size='" & dSize & "'>" & DataEncode & "</font>"
   goCount (frmMessage.txtBody.SelStart)
   dreplace = Replace(DataVar, DataEncode, dHTM, txtValue + constValue, 1)
   DataVar = Mid(DataVar, 1, txtValue + constValue - 1) & dreplace
   frmMessage.txtDebug.Text = DataVar
   cursor_pos = cursor_pos + dHline_number
End If

If Method = "Color" Then

If DataEncode = "" Then
   dSelection = frmMessage.txtBody.SelText
   DataEncode = dSelection
   Do While result = False
      check_pos = check_pos + 1
      id = Mid(DataEncode, check_pos, 1)
   If id <> "" Then
      id2 = Asc(id)
   If id2 = 13 Then
      rep_original = DataEncode
      rep_replacer = "<br>"
      DataEncode = Replace(DataEncode, id, rep_replacer)
      result = False
   End If
   If id2 = 10 Then
      rep_original = DataEncode
      rep_replacer = ""
      DataEncode = Replace(DataEncode, id, rep_replacer)
      result = False
   End If
   ElseIf id = "" Then
      result = True
   End If
   Loop
ClipDataLen = Len(DataEncode)
End If

   dColor = value
   dLen = Len(dColor)
   dHline_number = 22 + dLen
   dHTM = "<font color='" & dColor & "'>" & DataEncode & "</font>"
   goCount (frmMessage.txtBody.SelStart)
   dreplace = Replace(DataVar, DataEncode, dHTM, txtValue + constValue, 1)
   DataVar = Mid(DataVar, 1, txtValue + constValue - 1) & dreplace
   frmMessage.txtDebug.Text = DataVar
   cursor_pos = cursor_pos + dHline_number
End If

If Method = "Style" Then
dStyle = value

If DataEncode = "" Then
   dSelection = frmMessage.txtBody.SelText
   DataEncode = dSelection
   Do While result = False
      check_pos = check_pos + 1
      id = Mid(DataEncode, check_pos, 1)
   If id <> "" Then
      id2 = Asc(id)
   If id2 = 13 Then
      rep_original = DataEncode
      rep_replacer = "<br>"
      DataEncode = Replace(DataEncode, id, rep_replacer)
      result = False
   End If
   If id2 = 10 Then
      rep_original = DataEncode
      rep_replacer = ""
      DataEncode = Replace(DataEncode, id, rep_replacer)
      result = False
   End If
   ElseIf id = "" Then
      result = True
   End If
   Loop
ClipDataLen = Len(DataEncode)
End If

 If dStyle = "Italic" Then
    dHline_number = 7
    dHTM = "<i>" & DataEncode & "</i>"
    goCount (frmMessage.txtBody.SelStart)
    dreplace = Replace(DataVar, DataEncode, dHTM, txtValue + constValue, 1)
    DataVar = Mid(DataVar, 1, txtValue + constValue - 1) & dreplace
    frmMessage.txtDebug.Text = DataVar
    cursor_pos = cursor_pos + dHline_number
 End If
 If dStyle = "Bold" Then
    dHline_number = 7
    dHTM = "<b>" & DataEncode & "</b>"
    goCount (frmMessage.txtBody.SelStart)
    dreplace = Replace(DataVar, DataEncode, dHTM, txtValue + constValue, 1)
    DataVar = Mid(DataVar, 1, txtValue + constValue - 1) & dreplace
    frmMessage.txtDebug.Text = DataVar
    cursor_pos = cursor_pos + dHline_number
 End If
 If dStyle = "Underline" Then
    dHline_number = 7
    dHTM = "<u>" & DataEncode & "</u>"
    goCount (frmMessage.txtBody.SelStart)
    dreplace = Replace(DataVar, DataEncode, dHTM, txtValue + constValue, 1)
    DataVar = Mid(DataVar, 1, txtValue + constValue - 1) & dreplace
    frmMessage.txtDebug.Text = DataVar
    cursor_pos = cursor_pos + dHline_number
 End If
 If dStyle = "Bullet" Then
    result = Empty
    check_pos = Empty
    zOrder = Empty
    rOrder = Empty
    rOrder2 = Empty
    dSearch = Empty
    dFill = Empty
    dreplace = Empty
    dHline_number = Empty

    dBullet = DataEncode

Do While result = False
   check_pos = check_pos + 1
   rOrder = Mid(dBullet, check_pos, 4)
   rOrder2 = Mid(dBullet, check_pos, 100)

If zOrder = Empty Then
   zOrder = True
   dBullet = "<li>" & dBullet
   result = False
   check_pos = check_pos + 4
   dHline_number = dHline_number + 4
End If

If rOrder <> "" Then
   result = False
   zOrder = True
ElseIf rOrder2 = "" Then
   dSearch = Left(dBullet, check_pos)
   dFill = dSearch & "</li>"
   goCount (frmMessage.txtBody.SelStart)
   dreplace = Replace(dBullet, dSearch, dFill, txtValue + constValue, 1)
   dBullet = dreplace
   dHline_number = dHline_number + 5
   result = True
Else
   result = True
End If
If rOrder = "<br>" Then
   dSearch = Left(dBullet, check_pos - 1)
   dFillA = dSearch & "</li>"
   goCount (frmMessage.txtBody.SelStart)
   dreplace = Replace(dBullet, dSearch, dFillA, txtValue + constValue, 1)
   dBullet = dreplace

   check_pos = check_pos + 9
   dSearch = Left(dBullet, check_pos - 1)
   dFillB = dSearch & "<li>"
   goCount (frmMessage.txtBody.SelStart)
   dreplace = Replace(dBullet, dSearch, dFillB, txtValue + constValue, 1)
   dBullet = dreplace

   check_pos = check_pos + 4
   dHline_number = dHline_number + 9
   result = False
End If
Loop
   goCount (frmMessage.txtBody.SelStart)
   dreplace = Replace(DataVar, DataEncode, dBullet, txtValue + constValue, 1)
   DataVar = Mid(DataVar, 1, txtValue + constValue - 1) & dreplace
   frmMessage.txtDebug.Text = DataVar
   cursor_pos = cursor_pos + dHline_number
End If

End If

End Function
Public Function Convert(Pos As Integer, Third As Integer)

'------------------------------------Chracter Keys----------------------------------]
If Pos = 65 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "a"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "a" & DataVar
Else

DataVar = DataVar & "a"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 65 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "A"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "A" & DataVar
Else
DataVar = DataVar & "A"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 66 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "b"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "b" & DataVar
Else

DataVar = DataVar & "b"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 66 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "B"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "B" & DataVar
Else
DataVar = DataVar & "B"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 67 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "c"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "c" & DataVar
Else
DataVar = DataVar & "c"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 67 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "C"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "C" & DataVar
Else
DataVar = DataVar & "C"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 68 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "d"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "d" & DataVar
Else
DataVar = DataVar & "d"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 68 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "D"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "D" & DataVar
Else
DataVar = DataVar & "D"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 69 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "e"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "e" & DataVar
Else
DataVar = DataVar & "e"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 69 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "E"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "E" & DataVar
Else
DataVar = DataVar & "E"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 70 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "f"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "f" & DataVar
Else
DataVar = DataVar & "f"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 70 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "F"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "F" & DataVar
Else
DataVar = DataVar & "F"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 71 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "g"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "g" & DataVar
Else
DataVar = DataVar & "g"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 71 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "G"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "G" & DataVar
Else
DataVar = DataVar & "G"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 72 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "h"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "h" & DataVar
Else
DataVar = DataVar & "h"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 72 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "H"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "H" & DataVar
Else
DataVar = DataVar & "H"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 73 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "i"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "i" & DataVar
Else
DataVar = DataVar & "i"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 73 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "I"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "I" & DataVar
Else
DataVar = DataVar & "I"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 74 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "j"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "j" & DataVar
Else
DataVar = DataVar & "j"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 74 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "J"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "J" & DataVar
Else
DataVar = DataVar & "J"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 75 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "k"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "k" & DataVar
Else
DataVar = DataVar & "k"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 75 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "K"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "K" & DataVar
Else
DataVar = DataVar & "K"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 76 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "l"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "l" & DataVar
Else
DataVar = DataVar & "l"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 76 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "L"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "L" & DataVar
Else
DataVar = DataVar & "L"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 77 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "m"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "m" & DataVar
Else
DataVar = DataVar & "m"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 77 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "M"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "M" & DataVar
Else
DataVar = DataVar & "M"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 78 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "n"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "n" & DataVar
Else
DataVar = DataVar & "n"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 78 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "N"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "N" & DataVar
Else
DataVar = DataVar & "N"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 79 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "o"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "o" & DataVar
Else
DataVar = DataVar & "o"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 79 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "O"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "O" & DataVar
Else
DataVar = DataVar & "O"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 80 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "p"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "p" & DataVar
Else
DataVar = DataVar & "p"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 80 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "P"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "P" & DataVar
Else
DataVar = DataVar & "P"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 81 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "q"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "q" & DataVar
Else
DataVar = DataVar & "q"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 81 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "Q"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "Q" & DataVar
Else
DataVar = DataVar & "Q"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 82 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "r"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "r" & DataVar
Else
DataVar = DataVar & "r"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 82 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "R"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "R" & DataVar
Else
DataVar = DataVar & "R"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 83 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "s"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "s" & DataVar
Else
DataVar = DataVar & "s"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 83 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "S"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "S" & DataVar
Else
DataVar = DataVar & "S"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 84 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "t"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "t" & DataVar
Else
DataVar = DataVar & "t"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 84 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "T"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "T" & DataVar
Else
DataVar = DataVar & "T"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 85 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "u"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "u" & DataVar
Else
DataVar = DataVar & "u"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 85 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "U"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "U" & DataVar
Else
DataVar = DataVar & "U"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 86 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "v"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "v" & DataVar
Else
DataVar = DataVar & "v"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 86 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "V"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "V" & DataVar
Else
DataVar = DataVar & "V"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 87 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "w"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "w" & DataVar
Else
DataVar = DataVar & "w"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 87 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "W"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "W" & DataVar
Else
DataVar = DataVar & "W"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 88 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "x"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "x" & DataVar
Else
DataVar = DataVar & "x"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 88 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "X"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "X" & DataVar
Else
DataVar = DataVar & "X"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 89 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "y"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "y" & DataVar
Else
DataVar = DataVar & "y"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 89 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "Y"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "Y" & DataVar
Else
DataVar = DataVar & "Y"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 90 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "z"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "z" & DataVar
Else
DataVar = DataVar & "z"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 90 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "Z"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "Z" & DataVar
Else
DataVar = DataVar & "Z"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

'------------------------------------Numerical Keys----------------------------------]

If Pos = 48 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "0"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "0" & DataVar
Else
DataVar = DataVar & "0"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 48 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & ")"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = ")" & DataVar
Else
DataVar = DataVar & ")"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 49 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "1"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "1" & DataVar
Else
DataVar = DataVar & "1"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 49 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "!"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "!" & DataVar
Else
DataVar = DataVar & "!"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 50 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "2"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "2" & DataVar
Else
DataVar = DataVar & "2"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 50 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "@"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "@" & DataVar
Else
DataVar = DataVar & "@"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 51 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "3"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "3" & DataVar
Else
DataVar = DataVar & "3"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 51 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "#"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "#" & DataVar
Else
DataVar = DataVar & "#"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 52 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "4"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "4" & DataVar
Else
DataVar = DataVar & "4"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 52 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "$"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "$" & DataVar
Else
DataVar = DataVar & "$"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 53 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "5"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "5" & DataVar
Else
DataVar = DataVar & "5"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 53 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "%"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "%" & DataVar
Else
DataVar = DataVar & "%"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 54 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "6"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "6" & DataVar
Else
DataVar = DataVar & "6"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 54 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "^"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "^" & DataVar
Else
DataVar = DataVar & "^"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 55 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "7"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "7" & DataVar
Else
DataVar = DataVar & "7"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 55 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "&"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "&" & DataVar
Else
DataVar = DataVar & "&"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 56 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "8"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "8" & DataVar
Else
DataVar = DataVar & "8"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 56 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "*"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "*" & DataVar
Else
DataVar = DataVar & "*"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 57 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "9"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "9" & DataVar
Else
DataVar = DataVar & "9"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 57 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "("
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "(" & DataVar
Else
DataVar = DataVar & "("
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

'------------------------------------Grammar/Keys----------------------------------]

If Pos = 190 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "."
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "." & DataVar
Else
DataVar = DataVar & "."
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 190 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & ">"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = ">" & DataVar
Else
DataVar = DataVar & ">"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 188 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & ","
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "," & DataVar
Else
DataVar = DataVar & ","
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 188 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "<"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "<" & DataVar
Else
DataVar = DataVar & "<"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 191 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "/"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "/" & DataVar
Else
DataVar = DataVar & "/"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 191 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "?"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "?" & DataVar
Else
DataVar = DataVar & "?"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 186 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & ";"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = ";" & DataVar
Else
DataVar = DataVar & ";"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 186 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & ":"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = ":" & DataVar
Else
DataVar = DataVar & ":"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 222 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "'"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "'" & DataVar
Else
DataVar = DataVar & "'"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 222 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & """"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = """" & DataVar
Else
DataVar = DataVar & """"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 219 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "["
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "[" & DataVar
Else
DataVar = DataVar & "["
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 219 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "{"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "(" & DataVar
Else
DataVar = DataVar & "{"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 221 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "]"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "]" & DataVar
Else
DataVar = DataVar & "]"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 221 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "}"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "}" & DataVar
Else
DataVar = DataVar & "}"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 189 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "-"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "-" & DataVar
Else
DataVar = DataVar & "-"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 189 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "_"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "_" & DataVar
Else
DataVar = DataVar & "_"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 187 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "="
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "=" & DataVar
Else
DataVar = DataVar & "="
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 187 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "+"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "+" & DataVar
Else
DataVar = DataVar & "+"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 220 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "\"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "\" & DataVar
Else
DataVar = DataVar & "\"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 220 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "|"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "|" & DataVar
Else
DataVar = DataVar & "|"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 192 And Third <> 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "`"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "`" & DataVar
Else
DataVar = DataVar & "`"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

If Pos = 192 And Third = 1 And Third <> 2 Then
If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & "~"
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = "~" & DataVar
Else
DataVar = DataVar & "~"
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If

'-------------------------------------Control Keys------------------------------------]

If Pos = 86 And Third = 2 Then '// paste Ctrl-V
clipData = Clipboard.GetText
DataClip = clipData

Do While result = False
check_pos = check_pos + 1
id = Mid(DataClip, check_pos, 1)

If id <> "" Then
 id2 = Asc(id)
 If id2 = 13 Then
  rep_original = DataClip
  rep_replacer = "<br>"
  DataClip = Replace(DataClip, id, rep_replacer)
  result = False
 End If
If id2 = 10 Then
  rep_original = DataClip
  rep_replacer = ""
  DataClip = Replace(DataClip, id, rep_replacer)
  result = False
 End If
ElseIf id = "" Then
 result = True
End If

Loop

ClipDataLen = Len(DataClip)

If DataVar <> "" And cursor_pos <> 0 Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = rep_original & DataClip
DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
DataVar = DataClip & DataVar
Else
DataVar = DataVar & DataClip
End If
cursor_pos = cursor_pos + ClipDataLen
line_length = line_length + ClipDataLen
End If
'__________________________________________________________________________
If Pos = 32 Then ''// space
If DataVar <> "" Then
 rep_original = Left(DataVar, cursor_pos)
 rep_replacer = rep_original & " "
 DataVar = Replace(DataVar, rep_original, rep_replacer)
ElseIf cursor_pos = 0 Then
 DataVar = " " & DataVar
Else
 DataVar = DataVar & " "
End If
cursor_pos = cursor_pos + 1
line_length = line_length + 1
line_longest = line_longest + 1
End If
'__________________________________________________________________________
If Pos = 13 Then '// return

If DataVar <> "" Then
rep_original = Left(DataVar, cursor_pos)
rep_replacer = Left(rep_original, cursor_pos) & "<br>"
DataVar = Replace(DataVar, rep_original, rep_replacer)
Else
DataVar = DataVar & "<br>"
End If

break_line = 4
cursor_pos = cursor_pos + break_line

input_length = line_length
line_length = 0
line_longest = 0

If line_numberf = "" Then
line_numberf = 1
line_number = 1
line_current = line_number + 1
ElseIf line_numberf = 1 Then
line_number = line_number + 1
line_current = line_number + 1
End If

If larray = "" Then
larray = "(" & line_number & "):[" & input_length & "],"
Else
larray = larray & "(" & line_number & "):[" & input_length & "],"
End If

line_highest = line_current

End If
'__________________________________________________________________________
If Pos = 8 Then ' // backspace

If cursor_pos > 0 Then
Do While result = False

 id = Mid(DataVar, cursor_pos, 1)
If cursor_pos > 3 Then
 ids = Mid(DataVar, cursor_pos - 3, 4)
End If

If ids = "<br>" Then
 result = True
 hit = 12
ElseIf id = ">" Then
 result = False
 hit = 10
ElseIf id = "<" Then
 result = True
 hit = 11
ElseIf id <> "<" And id <> ">" And result = "" Then
 result = True
 hit = 13
End If

If hit = 10 Then
 cursor_pos = cursor_pos - 1
ElseIf hit = 11 Then
 cursor_pos = cursor_pos - 1
 id = Mid(DataVar, cursor_pos, 1)
 If id = ">" Then
  result = False
  hit = 10
 ElseIf id <> ">" Then
  rep_original = Left(DataVar, cursor_pos)
  rep_replacer = Left(rep_original, cursor_pos - 1)
  DataVar = Replace(DataVar, rep_original, rep_replacer)
 End If
ElseIf hit = 12 Then
 rep_original = Left(DataVar, cursor_pos)
 rep_replacer = Left(rep_original, cursor_pos - 4)
 DataVar = Replace(DataVar, rep_original, rep_replacer)
 cursor_pos = cursor_pos - 3
 line_current = line_current - 1
 line_number = line_current
ElseIf hit = 13 Then
 rep_original = Left(DataVar, cursor_pos)
 rep_replacer = Left(rep_original, cursor_pos - 1)
 DataVar = Replace(DataVar, rep_original, rep_replacer)
End If

Loop
End If

 cursor_pos = cursor_pos - 1
 line_length = line_length - 1

End If
'__________________________________________________________________________
If Pos = 37 Then '// left

If cursor_pos > 0 Then
Do While result = False

 cursor_pos = cursor_pos - 1
 line_length = line_length - 1
 id = Mid(DataVar, cursor_pos + 1, 1)
If cursor_pos > 2 Then
 ids = Mid(DataVar, cursor_pos - 2, 4)
End If

If ids = "<br>" Then
  cursor_pos = cursor_pos - 3
  result = True
  line_current = line_current - 1
  line_number = line_current
  line_length = 0 '?
  line_longest = 0
ElseIf id = ">" Then
 result = False
End If

If id = "<" Then
 cursor_pos = cursor_pos - 1
 id = Mid(DataVar, cursor_pos + 1, 1)
 If id = ">" Then
  result = False
 ElseIf id <> ">" Then
  result = True
  line_current = line_current - 1
  line_number = line_current
  line_length = 0 '?
  line_longest = 0
 End If
End If

If id <> "<" And id <> ">" And result = "" Then
 result = True
End If

Loop
End If
  
End If
'__________________________________________________________________________
If Pos = 39 Then '// right

Do While result = False

 cursor_pos = cursor_pos + 1
 line_length = line_length + 1
 id = Mid(DataVar, cursor_pos, 1)
If cursor_pos > 3 Then
 ids = Mid(DataVar, cursor_pos, 4)
End If

Call Check(ids, 2, False)

If ids = "<br>" Then
  cursor_pos = cursor_pos + 3
  result = True
  line_current = line_current + 1
  line_number = line_current
  line_length = 0 '?
  line_longest = 0
ElseIf id = "<" Then
 result = False
End If

If id = ">" Then
 cursor_pos = cursor_pos + 1
 id = Mid(DataVar, cursor_pos + 1, 1)
 If id = "<" Then
  result = False
 ElseIf id <> ">" Then
  result = True
  line_current = line_current + 1
  line_number = line_current
  line_length = 0 '?
  line_longest = 0
 End If
End If

If id <> "<" And id <> ">" And result = "" Then
 result = True
End If

Loop

End If
'__________________________________________________________________________
If Pos = 38 Then '// up

Dim braceHit As Integer
Dim chrStr As Integer
Dim countChr As Integer
Dim chrReturn As String
Dim chrLength As String
Dim chrRear As String

Dim chrSpan As String

line_current = line_current - 1
line_number = line_current
countChr = line_length

Do While result = False And cursor_pos > 0

If cursor_pos > 4 Then
   chrLength = Mid(DataVar, cursor_pos - 4, 4)
   chrRear = Mid(DataVar, cursor_pos - 1, 1)
   'chrRear = Mid(DataVar, cursor_pos, 1)
'// --- this()
End If
   chrReturn = Mid(DataVar, cursor_pos, 1)

If chrLength = "<br>" Then
   braceHit = braceHit + 1
   cursor_pos = cursor_pos - 1
   chrStr = chrStr - 1
End If

   If braceHit = 1 And chrRear = "<" Then
      frmAssist.txtDebug.Text = frmAssist.txtDebug.Text & "[:===:]"
      chrStr = 0
   End If

If chrReturn <> "" And braceHit < 2 Then
   cursor_pos = cursor_pos - 1
   chrStr = chrStr + 1
   result = False
ElseIf braceHit = 2 Then
   frmAssist.txtDebug.Text = frmAssist.txtDebug.Text & "[:" & countChr & ":" & chrStr & ":]"
   If chrStr < countChr Then
      cursor_pos = cursor_pos + chrStr
      line_length = chrStr
   Else
      cursor_pos = cursor_pos + countChr
      line_length = countChr
   End If
   result = True
End If

If cursor_pos = 0 Then
   cursor_pos = countChr
   line_length = countChr
   result = True
End If
Loop

End If
'__________________________________________________________________________
If Pos = 40 Then '// down

line_current = line_current + 1
line_number = line_current
countChr = line_length

Do While result = False And cursor_pos > 0
   chrReturn = Mid(DataVar, cursor_pos + 2, 4)

If chrReturn <> "" And braceHit < 2 Then
   cursor_pos = cursor_pos + 1
End If

If chrReturn = "<br>" Then
   braceHit = braceHit + 1
   cursor_pos = cursor_pos + 4 + countChr
   line_length = countChr
   result = True
End If

If chrReturn = "" Then
   cursor_pos = cursor_pos
   line_length = line_length
   result = True
End If

Loop
End If
'__________________________________________________________________________
If Pos = 46 Then '// del

If frmMessage.txtBody.SelText <> "" Then

dSelection = frmMessage.txtBody.SelText
DataInf = dSelection
Do While result = False
check_pos = check_pos + 1
id = Mid(DataInf, check_pos, 1)
If id <> "" Then
 id2 = Asc(id)
 If id2 = 13 Then
  rep_original = DataInf
  rep_replacer = "<br>"
  DataInf = Replace(DataInf, id, rep_replacer)
  result = False
 End If
If id2 = 10 Then
  rep_original = DataInf
  rep_replacer = ""
  DataInf = Replace(DataInf, id, rep_replacer)
  result = False
 End If
ElseIf id = "" Then
 result = True
End If
Loop
ClipDataLen = Len(DataInf)

 rep_replacer = ""
 DataVar = Replace(DataVar, DataInf, rep_replacer)
 cursor_pos = cursor_pos - ClipDataLen
Else

If cursor_pos > 0 Then
Do While result = False

 id = Mid(DataVar, cursor_pos + 1, 1)
If cursor_pos > 3 Then
 ids = Mid(DataVar, cursor_pos + 1, 4)
End If

If ids = "<br>" Then
 result = True
 hit = 12
ElseIf id = "<" Then
 result = False
 hit = 10
ElseIf id = ">" Then
 result = True
 hit = 11
ElseIf id <> "<" And id <> ">" And result = "" Then
 result = True
 hit = 13
End If

If hit = 10 Then
 cursor_pos = cursor_pos + 1
ElseIf hit = 11 Then
 cursor_pos = cursor_pos + 1
 id = Mid(DataVar, cursor_pos, 1)
 If id = "<" Then
  result = False
  hit = 10
 ElseIf id <> ">" Then
  rep_original = Left(DataVar, cursor_pos)
  rep_replacer = Left(rep_original, cursor_pos - 1)
  DataVar = Replace(DataVar, rep_original, rep_replacer)
 End If
ElseIf hit = 12 Then
 rep_original = Left(DataVar, cursor_pos)
 rep_replacer = Left(rep_original, cursor_pos - 4)
 DataVar = Replace(DataVar, rep_original, rep_replacer)
 cursor_pos = cursor_pos - 3
 line_current = line_current - 1
 line_number = line_current
ElseIf hit = 13 Then
 rep_original = Left(DataVar, cursor_pos + 1)
 rep_replacer = Left(rep_original, cursor_pos)
 DataVar = Replace(DataVar, rep_original, rep_replacer)
End If
Loop
End If

End If

End If
'__________________________________________________________________________
If Pos = 9 Then '// tab
   
On Error Resume Next

For Each Control In frmMessage.Controls
 Control.TabStop = False
Next Control

If DataVar <> "" Then
 rep_original = Left(DataVar, cursor_pos)
 rep_replacer = rep_original & Space(10)
 DataVar = Replace(DataVar, rep_original, rep_replacer)
Else
 DataVar = Space(5)
End If
 cursor_pos = cursor_pos + 5
 line_length = line_length + 5
 line_longest = line_longest + 5
End If
'__________________________________________________________________________
If Pos = 35 Then '// end

Do While result = False
rOrder = Mid(DataVar, cursor_pos + 1, 1)
rCheck = Mid(DataVar, cursor_pos + 1, 100)
rTag = Mid(DataVar, cursor_pos, 1)
Call Check(rOrder, 2, False)

If rOrder <> "<" And rOrder <> "" Then
 cursor_pos = cursor_pos + 1
 line_length = line_length + 1
 result = False
ElseIf rOrder = "<" Then
 result = True
ElseIf rCheck = "" And rTag = ">" Then
 cursor_pos = cursor_pos - 4
 result = True
Else
 result = True
End If
Loop
 
End If
'__________________________________________________________________________
If Pos = 36 Then '// home

Do While result = False And cursor_pos > 0
rOrder = Mid(DataVar, cursor_pos, 1)

If rOrder <> ">" Then
 cursor_pos = cursor_pos - 1
 line_length = line_length - 1
 result = False
Else
 result = True
End If

Loop
 
End If
'__________________________________________________________________________
If Pos = 33 Then '// pgup

cursor_pos = 0
line_length = 0
line_current = 0
line_number = line_current
 
End If
'__________________________________________________________________________
If Pos = 34 Then '// pgdown

Do While result = False

 cursor_pos = cursor_pos + 1
 line_length = line_length + 1
 line_longest = line_longest + 1
 id = Mid(DataVar, cursor_pos, 1)
 id2 = Mid(DataVar, cursor_pos, 100)

If id = "<" Then
 result = False
End If

If id = ">" Then
 result = False
 cursor_pos = cursor_pos + 1
 line_current = line_current + 1
 line_number = line_current
 line_length = 0
 line_longest = 0
End If

If id <> "<" And id <> ">" And id2 = "" Then
 result = True
End If

Loop

End If
''__________________________________________________________________________

'keypress------------------------------------------ DataVar = DataVar & Pos
'function------------------------------------------   DataVar = DataVar & Third
DataVar = DataVar & DataChar
frmMessage.txtDebug.Text = DataVar

End Function
Public Function ClearMessage()
Pos = Empty
Third = Empty
DataVar = Empty
rep_original = Empty
rep_replacer = Empty
DataChar = Empty
cursor_pos = Empty
line_length = Empty
break_line = Empty
input_length = Empty
line_number = Empty
line_current = Empty
navp = Empty
r_accumulation = Empty
line_numberf = Empty
larray = Empty
skip = Empty
sv = Empty
lsplit = Empty
string_number_start = Empty
string_length_start = Empty
string_number_end = Empty
string_length_end = Empty
array_no = Empty
array_len = Empty
id = Empty
result = Empty
single_r_forline_init = Empty
single_r_forline = Empty
r_accumulation = Empty
single_d_forline_init = Empty
single_d_forline = Empty
addo = Empty
Sellen = Empty
end_accumulation = Empty
line_longest = Empty
result = Empty
zOrder = Empty
rOrder = Empty
sOrder = Empty
hOrder = Empty
DataInf = Empty
check_pos = Empty
rOrder2 = Empty
dSearch = Empty
dFill = Empty
dreplace = Empty
DataInf = Empty
DataEncode = Empty
'Call Check(0, 0, True)
End Function
Public Function y2k()
'#------------------------------
'# y2k log system.
'#------------------------------
varYear = DatePart("yyyy", Date)
varMonth = DatePart("m", Date)
varDay = DatePart("d", Date)

If varDay = 1 Then
varDay = "01"
End If
If varDay = 2 Then
varDay = "02"
End If
If varDay = 3 Then
varDay = "03"
End If
If varDay = 4 Then
varDay = "04"
End If
If varDay = 5 Then
varDay = "05"
End If
If varDay = 6 Then
varDay = "06"
End If
If varDay = 7 Then
varDay = "07"
End If
If varDay = 8 Then
varDay = "08"
End If
If varDay = 9 Then
varDay = "09"
End If
If varMonth = 1 Then
varMonth = "01"
End If
If varMonth = 2 Then
varMonth = "02"
End If
If varMonth = 3 Then
varMonth = "03"
End If
If varMonth = 4 Then
varMonth = "04"
End If
If varMonth = 5 Then
varMonth = "05"
End If
If varMonth = 6 Then
varMonth = "06"
End If
If varMonth = 7 Then
varMonth = "07"
End If
If varMonth = 8 Then
varMonth = "08"
End If
If varMonth = 9 Then
varMonth = "09"
End If
'#------------------------------

End Function
Public Function MouseChange(Func As String, value As String)

If Func = "frmMessage" Then
 If value = "Normal" Then
 frmMessage.MousePointer = 1
 End If
 If value = "Wait" Then
 frmMessage.MousePointer = 11
 End If
End If

If Func = "frmMail" Then
 If value = "Normal" Then
 frmMail.MousePointer = 1
 End If
 If value = "Wait" Then
 frmMail.MousePointer = 11
 End If
End If

If Func = "frmDate" Then
 If value = "Normal" Then
 frmDate.MousePointer = 1
 End If
 If value = "Wait" Then
 frmDate.MousePointer = 11
 End If
End If

End Function
Public Function FillFonts()

frmPattern = "Italic:Bold:Underline:Bullet"
frmStr = ":"
frmArray = Split(frmPattern, frmStr)

For i = 1 To Screen.FontCount - 1
   frmFont.cmbFont.AddItem (Screen.Fonts(i))
Next

frmFont.cmbSize.AddItem ("8")
frmFont.cmbSize.AddItem ("10")
frmFont.cmbSize.AddItem ("12")
frmFont.cmbSize.AddItem ("14")
frmFont.cmbSize.AddItem ("18")
frmFont.cmbSize.AddItem ("24")
frmFont.cmbSize.AddItem ("36")

For Each frmStr In frmArray
frmFont.cmbStyle.AddItem (frmStr)
Next

End Function
Public Function FontInfo()
If frmMessage.txtBody.SelText <> "" Then
sFontName = frmMessage.txtBody.SelFontName
sFontSize = frmMessage.txtBody.SelFontSize
sFontColor = frmMessage.txtBody.SelColor
sFontBold = frmMessage.txtBody.SelBold
sFontItalic = frmMessage.txtBody.SelItalic
sFontUnderline = frmMessage.txtBody.SelUnderline
MsgBox ("Font Name :" & sFontName & vbCrLf & _
"Font Size :" & sFontSize & vbCrLf & _
"Font Color :" & sFontColor & vbCrLf & _
"Font Bold :" & sFontBold & vbCrLf & _
"Font Italic :" & sFontItalic & vbCrLf & _
"Font Underline :" & sFontUnderline)
End If
End Function
Public Function Check(Pass As Variant, Style As Integer, Clear As Boolean)

If Clear = True Then
 frmAssist.txtDebug.Text = ""
End If

If Style = 1 Then
frmAssist.txtDebug.Text = ""
frmAssist.txtDebug.Text = Pass
ElseIf Style = 2 Then
frmAssist.txtDebug.Text = frmAssist.txtDebug.Text & Pass
End If

End Function

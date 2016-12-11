<%
public function substhttp(value)
 subst    = "<a href='" & value & "'>" & value & "</a>"
 substlen  = len(subst)-len(value)
 dreplace  = replace(zit, value, subst)
 zit       = dreplace
 datalen   = len(zit)
 response.write(zit&"<br>")
end function

public function substmail(value)
 subst    = "<a href=mailto:" & value & ">" & value & "</a>"
 substlen  = len(subst)-len(value)
 dreplace  = replace(zit, value, subst)
 zit       = dreplace
 datalen   = len(zit)
 response.write(zit&"<br>")
end function

public function dhttp()
for i      = 1 to datalen*2
 q         = 0
 datahttp  = instr(i, zit, "http://")

if datahttp <> 0 then
  cp    = -1
for z      = datahttp to datalen
  q        = q+1
  bit      = mid(zit, z+1, 1) 
  sbyte    = mid(zit, datahttp, q)
  if bit <> empty then ansibit  = asc(bit) end if
  if bit   = "" OR bit   = " " OR bit = "," OR bit = "<" OR bit = ">" OR ansibit = 13 AND cp = -1 then
   substhttp(sbyte)
   cp   = 0
   sbyte   = 0
   bit     = 0
   ansibit = 0
   z       = 0
   i       = datahttp+count+substlen
   exit for
  end if
 next
end if
next
end function

public function dmail()
for i        = 1 to datalen*2
 f           = 0
 datamail    = instr(i, zit, "@")

if datamail <> 0 then
 cp       = -1
 if x = empty then x = datamail else x = x end if
 if c = empty then c = datamail else c = c end if
 n           = datamail-20
 do until x  = n
  bit        = mid(zit, x, 1)
  if bit <> empty then ansifit  = asc(bit) end if
 if bit      = "" OR bit   = " " OR bit = "," OR bit = "<" OR bit = ">" OR ansibit = 13 AND cp = -1 then
  iz         = x+1
  sbit       = mid(zit, iz, c-iz)
  exit do
 end if
 x        = x-1
 loop

for z     = datamail to datalen
 f        = f+1
 fit      = mid(zit, z+1, 1) 
 sfit     = mid(zit, datamail, f)

 if fit <> empty then ansifit  = asc(fit) end if
 if fit   = "" OR fit   = " " OR fit = "," OR fit = "<" OR fit = ">" OR ansifit = 13 AND cp = -1 then
  substmail(sbit&sfit)
  cp      = empty
  sfit    = empty
  fit     = empty
  ansifit = empty
  z       = empty
  x       = empty
  c       = empty
  i       = datamail+f+substlen
  exit for
 end if
next

end if
next
end function

public datalen
public substlen
public dsubst
public dreplace
public zit
public datahttp
public datamail

public function xmain(argv)
 zit       = argv
 datalen   = len(zit)
 dhttp()
 dmail()
end function

'-----(main
'xmain("terp http://www.nosh.com/" & vbcrlf & "here")
xmain("abcd http://www.werch.com/, and this@null.zip ersh, http://www.wop.org/, erps and http://dot.com/ ercho koomba lata http://erf.com/ wit http://poof.dom, doop@tnerp.co.za")
%>

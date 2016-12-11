<%
'd = 5
't = 10
'if t >= d then response.write(">=") end if
'if d <= 10 then response.write("<=") end if

dMonth     = "01"
SformMonth = "01"
TformMonth = "01"
dDay       = "29"
TformDay   = "30"

'if dMonth >= SformMonth and dMonth <= TformMonth then response.write("t") end if

if dMonth  = TformMonth and dMonth <> SformMonth and _
dDay      <= TformDay   then
dRem       = dMonth & dDay & dYear
end if
response.write(dRem)

%>

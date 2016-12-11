<form action='index.asp' method='get'>
sday : <input type=text name=sformday><br>
smonth : <input type=text name=sformmonth><br>
syear : <input type=text name=sformyear><br><br>
tday : <input type=text name=tformday><br>
tmonth : <input type=text name=tformmonth><br>
tyear : <input type=text name=tformyear><br><br>
<input type=submit><input type=reset>
</form>
<%
'------------------------------------
'desc  : date/db/parser for iis4+
'author: null@null.co.za
'files : index.asp
'date  : 02/14/2001
'------------------------------------
dim formDay, formMonth, formYear
dim dbDate, shString

SformMonth = request("sformmonth")
SformDay   = request("sformday")
SformYear  = request("sformyear")

TformMonth = request("tformmonth")
TformDay   = request("tformday")
TformYear  = request("tformyear")

section    = "Orders" ' request("section")

set conn  = server.createobject("adodb.connection")
conn.open "database=isotop;uid=isotop;pwd=isotop;dsn=isotop"
sqlopen   = "select * from " & section & ""
set rs    = conn.execute(sqlopen)

do while not rs.eof
dbDate    = rs("date")
shString  = "/"
dbSplit   = split(dbDate, shString)
dCheck    = 0
dRem      = ""

for each shString in dbSplit
dCheck    = dCheck + 1
if dCheck = 1 then dVar   = "Month"    end if
if dCheck = 2 then dVar   = "Day" end if
if dCheck = 3 then dVar   = "Year" end if

varYear     = datepart("yyyy", date)

if shString = 1 then shString = "01" end if
if shString = 2 then shString = "02" end if
if shString = 3 then shString = "03" end if
if shString = 4 then shString = "04" end if
if shString = 5 then shString = "05" end if
if shString = 6 then shString = "06" end if
if shString = 7 then shString = "07" end if
if shString = 8 then shString = "08" end if
if shString = 9 then shString = "09" end if

if shString = 99 and dCheck = 3 then shString = "1999" end if
if shString = 00 and dCheck = 3 then shString = "2000" end if
if shString = 01 and dCheck = 3 then shString = "2001" end if

if dCheck = 1 then dMonth = shString end if
if dCheck = 2 then dDay   = shString end if
if dCheck = 3 then dYear  = shString end if

if dMonth >= SformMonth and dMonth <= TformMonth and _
dDay      >= SformDay   and dDay   <= TformDay and _
dYear     >= SformYear  and dYear  <= TformYear then
dRem       = dMonth & dDay & dYear
end if

'pattern : days(08)-(16)only displays days
'08-16 for given months. 
'a)solvent: <>month(than)s/t(months)display
'all. negative:days in =eqv(s/t:month) are
'not displayed for ranges <>than(08)-(16)
'----------------solutions:
'[if month = smonth and day > sday
'[then display:end
'[if month = tmonth and day < tday
'[then display:end

if dMonth >  SformMonth and dMonth < TformMonth and _
dYear     >= SformYear  and dYear  <= TformYear then
dRem       = dMonth & dDay & dYear
end if

if dMonth  = SformMonth and dDay => SformDay and _
dYear     >= SformYear and dYear <= TformYear then
dRem       = dMonth & dDay & dYear
end if

if dMonth  = TformMonth and dDay <= TformDay and _
dYear     >= SformYear and dYear <= TformYear then
dRem       = dMonth & dDay & dYear
end if

next

if dRem <> "" then
response.write(dRem) & ":" & rs("customeremail") & "<br>"
end if
rs.movenext
loop

rs.close
conn.close
%>

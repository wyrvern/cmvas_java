/*
 *   nKey. Basic encryption library.
 *   Description  : encrypt Strings.
 *   Dependencies : JAVA VM 1.2+
 *   Platform     : OS Independant.
 *   Version      : 1.0.1
 *   Credit       : Synapse Software. Original BASIC Version.
 *   Copyright (C) 2001
 *
 * TODO :
 * - Finish port.
*/
package lib.nkey;

import java.lang.reflect.*;
import java.util.Date;

  public class nCrypt{ 

nString   nStr             = new nCrypt();
String    strhiword        = "";
String    strloword        = "";
int       snghiword        = 0;
int       sngloword        = 0;
String    strpart[]        = new String[4];
int       sngpart[]        = new int[4];

public String getregkey(String systemid, int users){
strhiword      = nStr.cLeft(systemid, systemid.indexOf("-"));
strloword      = nStr.cRight(systemid, systemid.indexOf("-"));
snghiword      = (int)cnv2dec(strhiword, 16);
sngloword      = (int)cnv2dec(strloword, 16);

if (users <= 0             || 
systemid.indexOf("-") == 0 ||  
systemid.length()() > 10     || 
systemid.length()() == 0) {
 return "error";
 } 
if (snghiword  == 0){ snghiword = 50 * users % 65535; }
if (sngloword  == 0){ snghiword = 35 * users % 65535; }

sngpart[0]     = (snghiword * (users % 15000) + (sngloword / users));
sngpart[1]     = (snghiword + sngloword) / (users % 98);
sngpart[2]     = (snghiword + sngloword + sngpart[0]) / (users * 2) % 18000;
sngpart[3]     = (sngpart[2]) * (users / 2);

strpart[0]     = nStr.cRight("0000" + sngpart[0].ToString("x"),4);
strpart[1]     = nStr.cRight("0000" + sngpart[1].ToString("x"),4);
strpart[2]     = nStr.cRight("0000" + sngpart[2].ToString("x"),4);
strpart[3]     = nStr.cRight("0000" + sngpart[3].ToString("x"),4);

return strpart[0].ToUpper() + "-" + strpart[1].ToUpper() + "-" + strpart[2].ToUpper() + "-" + strpart[3].ToUpper();
}

private long cnv2dec(String strnum, int intbase){
long  intval   = 0;
long  result   = 0;
String strval  = "";

 for (int i = 1;i <= strnum.length();i++){
 strval = nStr.cMid(strnum, strnum.length() - i, 1);
  if (Char.IsNumber(Convert.ToChar(strval))){
   intval = nStr.cVal(strval);
  }else
  if (!Char.IsNumber(Convert.ToChar(strval))){
   intval = nStr.cAsc(Convert.ToChar(strval)) - 55;
  }
  result = result + intval*(long)Math.Pow(intbase,(i-1));
 }  
  return result;
}
  };

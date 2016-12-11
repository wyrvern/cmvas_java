/*
 *   nString. String manipulation.
 *   Description  : BASIC routines in JAVA.
 *   Dependencies : JAVA VM 1.2+
 *   Platform     : any.
 *   Version      : 1.0.3
 *   Credit       : this()
 *   Copyright (C) 2001
 *
 *  To contact the author email: null@null.co.za
 *  Todo :
 *  - /null
 *  Functions :
 *  - { cEval(string a,string b) }
      : returns true if a == b, else false ;
 *  - { cHex(int value) }
      : returns hexidecimal conversion ;
 *  - { cAsc(string s) }
      : returns ANSI chr code ;
 *  - { cVal(string s) }
      : returns all integers / stop at first char ;
 *  - { cLen(string s) }
      : returns string length;
 *  - { cVal(string s) }
      : returns all integers / stop at first char ;
 *  - continued.
*/
import java.lang.reflect.*;
import java.util.Date;

  public class strlib {

  private Date dt = new Date();

public boolean Eval(String _a,
                    String _b) {
  if(_a == _b){
    return true;
  }else
  if(_a != _b){
    return false;
  }
 return false;
}

public String Hex(int _value) {
  return Integer.toHexString(_value);
}

public int Asc(char _char) {
  return (int)_char;
}

public int Val(String _string) {
  char[]         c_str = _string.toCharArray();
  StringBuffer   s_buf = new StringBuffer(_string.length());

  for (int i=0;i <= _string.length()-1;i++){
    if (Character.isDigit(c_str[i]) == true){
      s_buf.append(c_str[i]);
    }else
    if (Character.isDigit(c_str[i]) == false){
      return Integer.getInteger(s_buf.toString()).intValue();
    }  
 }
 return Integer.getInteger(s_buf.toString()).intValue();
}

public int Len(String _string){
  return _string.length();
}

public String Replace(String _string,
                      String _find,
                      String _replace,
                      int    _start) {
  String _seval;
  if (_start > 0){
    _seval = Mid(_string, _start, _string.length()-_start);
  }else
    _seval = _string;
    char[] c_find    = _find.toCharArray();
    char[] c_replace = _replace.toCharArray();
  for(int i=0;i<_string.length()-_start;i++) {
    if(c_replace[i] == _replace.length()) {
    _seval.replace(c_find[i], c_replace[i]);
      return _seval;
    }else
    _seval.replace(c_find[i], c_replace[i]);
  }
  return _seval;
}

public String Mid(String _string,
                  int    _start,
                  int    _end) {
 if(_end > _string.length()) {
  _end = _string.length();
 }else
 if(_end == 0) {
   return _string.substring(_start);
 }else
   return _string.substring(_start, _end);
return _string;
}

public int InStr(int    _start,
                 String _string,
                 String _search) {
 return _string.indexOf(_search, _start);
}

public int InStrRev(int    _start,
                    String _string,
                    String _search) {
 _string = Reverse(_string);
 return _string.indexOf(_search, _start);
}

public String Left(String _string,
                   int    _count) {
 int stringLen = _string.length();
 if(_count > stringLen) {
   _count = stringLen;
 }
 return _string.substring(0, _count);
}

public String Right(String _string,
                    int    _count) {
            _string = Reverse(_string);
 char[]       c_str = _string.toCharArray();
 StringBuffer s_buf = new StringBuffer(_string.length());
 int stringLen = _string.length();
 if(_count > stringLen) {
   _count = stringLen;
 }
 for(int i=0;i <= _count-1;i++){
  s_buf         = s_buf.append(c_str[i]);
 }
 return Reverse(s_buf.toString());
}

public String Reverse(String _string){
 char[]       c_str = _string.toCharArray();
 StringBuffer s_buf = new StringBuffer(_string.length());
 for(int i = _string.length()-1;i >= 0; i--){
  s_buf    = s_buf.append(c_str[i]);
 } 
 return s_buf.toString();
}

public String y2k() {
  String dateYear  = Integer.toString(dt.getYear() +1900);
  String dateMonth = Integer.toString(dt.getMonth()+1);
  String dateDay   = Integer.toString(dt.getDate());
    for (int i=0;i<=9;i++) {
      if (dateDay   == Integer.toString(i)) { 
         dateDay    = "0"+i;
      }
      if (dateMonth == Integer.toString(i)) { 
         dateMonth  = "0"+i;
      }
    }
  String log_date     = dateDay+dateMonth+dateYear;
  return log_date;
}

  };

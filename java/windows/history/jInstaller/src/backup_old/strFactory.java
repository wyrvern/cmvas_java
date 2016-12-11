/*
 *   strFactory. String manipulation.
 *   Description  : BASIC routines in JAVA.
 *   Dependencies : JAVA VM 1.2+
 *   Platform     : any.
 *   Version      : 1.0.*
 *   Credit       : this()
 *   Revised      : 25/10/2001:10:28:00:GMT+2
 *   Copyright (C) 2001
 *
 *   Author       : null@null.co.za
 *   Todo :
 *   - /null
*/
package lib.libstr;

import java.lang.reflect.*;
import java.util.Date;

public class strFactory {

  private Date dt = new Date();

  public strFactory() {
  }

  public boolean Eval(String _a,
                      String _b) {
    try {
       if(_a == _b) {
          return true;
       }else
       if(_a != _b){
          return false;
       }
        return false;
    }catch(Exception e) {
        return false;
    } 
  }

  public String Hex(int _value) {
    try {
       return Integer.toHexString(_value);
    }catch(Exception e) {
       return e.toString();
    } 
  }

  public int Asc(char _char) {
    try {
       return (int)_char;
    }catch(Exception e) {
       return -1;
    } 
  }

  public int Val(String _string) {
    try {
    char[]         c_str = _string.toCharArray();
    StringBuffer   s_buf = new StringBuffer(_string.length());

    for (int i=0;i <= _string.length()-1;i++) {
       if (Character.isDigit(c_str[i]) == true) {
          s_buf.append(c_str[i]);
       }else
       if (Character.isDigit(c_str[i]) == false){
          return Integer.getInteger(s_buf.toString()).intValue();
       }  
   }
        return Integer.getInteger(s_buf.toString()).intValue();
    }catch(Exception e) {
        return -1;
    } 
  }

  public int Len(String _string) {
    try {
        return _string.length();
    }catch(Exception e) {
        return -1;
    } 
  }

  public String Replace(String _string,
                        String _find,
                        String _replace,
                        int    _start) throws Exception {
    try {
       String c_string  = _string;
       if (_start < 0) {
          throw new Exception();
       }
       for(int i=_start;i<c_string.length()-_start;i++) {
          if (_find.equalsIgnoreCase(Mid(c_string, i, _find.length()))) {
             c_string = Left(c_string, i) +
             _replace                     +
             Right(c_string, c_string.length()-_find.length()-i);
          }
       }
       return c_string;
    }catch(Exception e) {
       return e.toString();
    }  
  }

  public String asciiReplace(String _string,
                             int    _find,
                             String _replace,
                             int    _start) throws Exception {
    try {
       String c_string  = _string;
       if (_start < 0) {
          throw new Exception();
       }
       for(int i=_start,j=i;i<_string.toCharArray().length-_start;i++,j++) {
          if (_find == (int)_string.toCharArray()[i]) {
             c_string = Left(c_string, j) +
             _replace                     +
             Right(c_string, c_string.length()-1-j);
             j+=_replace.length()-1;
          }
       }
       return c_string;
    }catch(Exception e) {
         return e.toString();
    }  
  }

  public String Mid(String _string,
                    int    _start,
                    int    _end) throws Exception {
    try {
       if(_end <= 0) {
          return _string.substring(_start);
       }else
          _end += _start;
       if(_end > _string.length()) {
          _end = _string.length();
       }
       return _string.substring(_start, _end);
    }catch(Exception e) {
       return e.toString();
    }  
  }

  public int InStr(int    _start,
                   String _string,
                   String _search) throws Exception {
    try {
       if (_start < 0) {
          throw new Exception();
       }
       return _string.indexOf(_search, _start);
    }catch(Exception e) {
       return -1;
    }  
  }

  public int InStrRev(int    _start,
                      String _string,
                      String _search) throws Exception {
    try {
       if (_start < 0) {
          throw new Exception();
       }
       _string = Reverse(_string);
       return _string.indexOf(_search, _start);
    }catch(Exception e) {
       return -1;
    }  
  }

  public String Left(String _string,
                     int    _count) throws Exception {
    try {
       if (_count < 0) {
          throw new Exception();
       }
       if(_count > _string.length()) {
          _count = _string.length();
     }
       return _string.substring(0, _count);
    }catch(Exception e) {
       return e.toString();
    }
  }

  public String Right(String _string,
                      int    _count) throws Exception {
    try {
       if (_count < 0) {
          throw new Exception();
       }
                  _string = Reverse(_string);
       char[]       c_str = _string.toCharArray();
       StringBuffer s_buf = new StringBuffer(_string.length());
       if(_count > _string.length()) {
          _count = _string.length();
       }
       for(int i=0; i <= _count-1; i++){
         s_buf         = s_buf.append(c_str[i]);
       }
       return Reverse(s_buf.toString());
    }catch(Exception e) {
       return e.toString();
    }
  }

  public String Reverse(String _string) {
    try {
       char[]       c_str = _string.toCharArray();
       StringBuffer s_buf = new StringBuffer(_string.length());
       for(int i = _string.length()-1;i >= 0; i--){
          s_buf    = s_buf.append(c_str[i]);
       } 
       return s_buf.toString();
    }catch(Exception e) {
       return e.toString();
    }
  }

/**
  public String[] Split(String value,
                        String divide) {
       String[] c_array     = new String[value.length()];
       int    fPosition     = 0;
       int    f             = 0;
       String strReturn;
       for (int i=0;i<c_array.length;i++,f++){
       try {
        fPosition          = value.indexOf(divide,i);
        strReturn          = value.substring(i,fPosition);
        c_array[f]         = strReturn;
        i                  = fPosition;
          }catch(StringIndexOutOfBoundsException e){
             strReturn  = value.substring(i);
             c_array[f] = strReturn;
             return c_array;
          }
      }
             return c_array;
  }
**/

  public String[] Split(String value,
                        String divide) {
       int n = 1, s = 0;
       do{
          if(value.indexOf(divide, s) != -1) {
             s = value.indexOf(divide, s)+1;
             n++;
          }else
             break;
       }while(true);

       String[] strArray    = new String[n];
       int    x             = 0,y = 0;

       String strReturn;
       for (int i=0;i<strArray.length;i++){
          try {
             if(value.indexOf(divide,y) != -1 &&
                x == 0) {
                x         = value.indexOf(divide,y);
                strReturn = value.substring(y,x);
             }else
             if(value.indexOf(divide,y) != -1 &&
                x > 0) {
                x         = value.indexOf(divide,y);
                strReturn = value.substring(y,x-y);
             }else
             if(value.indexOf(divide,y) == -1 &&
                x > 0) {
                strReturn = value.substring(x+1);
             }else
                strReturn = value.substring(x);
             y           = x+1;
             strArray[i] = strReturn;
          }catch(Exception e) {
             return new String[] { e.toString() };
          }
      }
       return strArray;
  }

  public String y2k() {
    String dateYear  = Integer.toString(dt.getYear() +1900);
    String dateMonth = Integer.toString(dt.getMonth()+1);
    String dateDay   = Integer.toString(dt.getDate());
    try {
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
    }catch(Exception e) {
        return e.toString();
    }  
  }

};

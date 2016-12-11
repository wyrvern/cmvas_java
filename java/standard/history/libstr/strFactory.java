/**
  * desc : strFactory. String manipulation.
  * mods : 25/01/2002-11:17:00:GMT+2
  * auth : null@null.co.za
  * todo : write constructor(+value)
  **/

package lib.libstr;

import java.lang.reflect.*;
import java.util.Date;

public class strFactory {

  private lib.libstd.stdFactory std = new lib.libstd.stdFactory();
  private Date dt                   = new Date();

  public strFactory() {
     try {
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        std.errHandler(std.LOAD_EXCEPTION, "strFactory()", eet);
     }
  }

  public boolean Eval(String a,
                      String b) {
    try {
       if(a == b) {
          return true;
       }else
       if(a != b){
          return false;
       }
    }catch(Exception e) {
       String eet        = null;
       eet =             "";
       eet = eet + "<es> : "+ e.toString()+"\n";
       eet = eet + "<ia> : "+ a           +"\n";
       eet = eet + "<ia> : "+ b           +"\n";
       std.errHandler(std.FATAL_EXCEPTION, "Eval()", eet);
    } 
       return false;
  }

  public String Hex(int value) {
    try {
       return Integer.toHexString(value);
    }catch(Exception e) {
       String eet        = null;
       eet =             "";
       eet = eet + "<es> : "+ e.toString()                 +"\n";
       eet = eet + "<ia> : "+ new Integer(value).toString()+"\n";
       std.errHandler(std.FATAL_EXCEPTION, "Hex()", eet);
    } 
       return null;
  }

  public int Asc(char character) {
    try {
       return (int)character;
    }catch(Exception e) {
       String eet        = null;
       eet =             "";
       eet = eet + "<es> : "+ e.toString()                       +"\n";
       eet = eet + "<ia> : "+ new Character(character).toString()+"\n";
       std.errHandler(std.FATAL_EXCEPTION, "Asc()", eet);
    } 
       return -1;
  }

  public int Val(String input) {
    try {
    char[]         str = input.toCharArray();
    StringBuffer   buf = new StringBuffer(input.length());

    for (int i=0;i <= input.length()-1;i++) {
       if (Character.isDigit(str[i]) == true) {
          buf.append(str[i]);
       }else
       if (Character.isDigit(str[i]) == false){
          return Integer.getInteger(buf.toString()).intValue();
       }  
    }
       return Integer.getInteger(buf.toString()).intValue();
    }catch(Exception e) {
       String eet        = null;
       eet =             "";
       eet = eet + "<es> : "+ e.toString()+"\n";
       eet = eet + "<ia> : "+ input       +"\n";
       std.errHandler(std.FATAL_EXCEPTION, "Val()", eet);
    } 
       return -1;
  }

  public int Len(String input) {
    try {
        return input.length();
    }catch(Exception e) {
       String eet        = null;
       eet =             "";
       eet = eet + "<es> : "+ e.toString()+"\n";
       eet = eet + "<ia> : "+ input       +"\n";
       std.errHandler(std.FATAL_EXCEPTION, "Len()", eet);
    } 
       return -1;
  }

  public String Replace(String input,
                        String find,
                        String replace,
                        int    start) throws Exception {
    try {
       String str = input;
       if (start < 0) {
          throw new Exception("Invalid index (-1)");
       }
       for(int i=start;i<str.length()-start;i++) {
          if (find.equalsIgnoreCase(Mid(str, i, find.length()))) {
             str = Left(str, i) +
             replace            +
             Right(str, str.length()-find.length()-i);
          }
       }
       return str;
    }catch(Exception e) {
       String eet        = null;
       eet =             "";
       eet = eet + "<es> : "+ e.toString()                 +"\n";
       eet = eet + "<ia> : "+ input                        +"\n";
       eet = eet + "<ia> : "+ find                         +"\n";
       eet = eet + "<ia> : "+ replace                      +"\n";
       eet = eet + "<ia> : "+ new Integer(start).toString()+"\n";
       std.errHandler(std.FATAL_EXCEPTION, "Replace()", eet);
    }  
       return null;
  }

  public String asciiReplace(String input,
                             int    find,
                             String replace,
                             int    start) throws Exception {
    try {
       String str = input;
       if (start < 0) {
          throw new Exception("Invalid index (-1)");
       }
       for(int i=start,j=i;i<input.toCharArray().length-start;i++,j++) {
          if (find == (int)input.toCharArray()[i]) {
             str = Left(str, j) +
             replace            +
             Right(str, str.length()-1-j);
             j+=replace.length()-1;
          }
       }
       return str;
    }catch(Exception e) {
       String eet        = null;
       eet =             "";
       eet = eet + "<es> : "+ e.toString()                 +"\n";
       eet = eet + "<ia> : "+ input                        +"\n";
       eet = eet + "<ia> : "+ find                         +"\n";
       eet = eet + "<ia> : "+ replace                      +"\n";
       eet = eet + "<ia> : "+ new Integer(start).toString()+"\n";
       std.errHandler(std.FATAL_EXCEPTION, "asciiReplace()", eet);
    }  
       return null;
  }

  public String Mid(String input,
                    int    start,
                    int    end) throws Exception {
    try {
       if(end <= 0) {
          return input.substring(start);
       }else
          end += start;
       if(end > input.length()) {
          end = input.length();
       }
       return input.substring(start, end);
    }catch(Exception e) {
       String eet        = null;
       eet =             "";
       eet = eet + "<es> : "+ e.toString()                 +"\n";
       eet = eet + "<ia> : "+ input                        +"\n";
       eet = eet + "<ia> : "+ new Integer(start).toString()+"\n";
       eet = eet + "<ia> : "+ new Integer(end).toString()  +"\n";
       std.errHandler(std.FATAL_EXCEPTION, "Mid()", eet);
    }  
       return null;
  }

  public int InStr(int    start,
                   String input,
                   String search) throws Exception {
    try {
       if (start < 0) {
          throw new Exception("Invalid index (-1)");
       }
       return input.indexOf(search, start);
    }catch(Exception e) {
       String eet        = null;
       eet =             "";
       eet = eet + "<es> : "+ e.toString()                 +"\n";
       eet = eet + "<ia> : "+ new Integer(start).toString()+"\n";
       eet = eet + "<ia> : "+ input                        +"\n";
       eet = eet + "<ia> : "+ search                       +"\n";
       std.errHandler(std.FATAL_EXCEPTION, "InStr()", eet);
    }  
       return -1;
  }

  public int InStrRev(int    start,
                      String input,
                      String search) throws Exception {
    try {
       if (start < 0) {
          throw new Exception("Invalid index (-1)");
       }
       input = Reverse(input);
       return input.indexOf(search, start);
    }catch(Exception e) {
       String eet        = null;
       eet =             "";
       eet = eet + "<es> : "+ e.toString()                 +"\n";
       eet = eet + "<ia> : "+ new Integer(start).toString()+"\n";
       eet = eet + "<ia> : "+ input                        +"\n";
       eet = eet + "<ia> : "+ search                       +"\n";
       std.errHandler(std.FATAL_EXCEPTION, "InStrRev()", eet);
    }  
       return -1;
  }

  public String Left(String input,
                     int    count) throws Exception {
    try {
       if (count < 0) {
          throw new Exception("Invalid index (-1)");
       }
       if(count > input.length()) {
          count = input.length();
     }
       return input.substring(0, count);
    }catch(Exception e) {
       String eet        = null;
       eet =             "";
       eet = eet + "<es> : "+ e.toString()                 +"\n";
       eet = eet + "<ia> : "+ input                        +"\n";
       eet = eet + "<ia> : "+ new Integer(count).toString()+"\n";
       std.errHandler(std.FATAL_EXCEPTION, "Left()", eet);
    }
       return null;
  }

  public String Right(String input,
                      int    count) throws Exception {
    try {
       if (count < 0) {
          throw new Exception("Invalid index (-1)");
       }
                    input = Reverse(input);
       char[]         str = input.toCharArray();
       StringBuffer   buf = new StringBuffer(input.length());
       if(count > input.length()) {
          count = input.length();
       }
       for(int i=0; i <= count-1; i++){
          buf         = buf.append(str[i]);
       }
       return Reverse(buf.toString());
    }catch(Exception e) {
       String eet        = null;
       eet =             "";
       eet = eet + "<es> : "+ e.toString()                 +"\n";
       eet = eet + "<ia> : "+ input                        +"\n";
       eet = eet + "<ia> : "+ new Integer(count).toString()+"\n";
       std.errHandler(std.FATAL_EXCEPTION, "Right()", eet);
    }
       return null;
  }

  public String Reverse(String input) {
    try {
       char[]       str = input.toCharArray();
       StringBuffer buf = new StringBuffer(input.length());
       for(int i = input.length()-1;i >= 0; i--){
          buf    = buf.append(str[i]);
       } 
       return buf.toString();
    }catch(Exception e) {
       String eet        = null;
       eet =             "";
       eet = eet + "<es> : "+ e.toString()                 +"\n";
       eet = eet + "<ia> : "+ input                        +"\n";
       std.errHandler(std.FATAL_EXCEPTION, "Reverse()", eet);
    }
       return null;
  }

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

       String strReturn = null;

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
                strReturn = value.substring(y,x);
             }else
             if(value.indexOf(divide,y) == -1 &&
                x > 0) {
                strReturn = value.substring(x+1);
             }
             y           = x+1;
             strArray[i] = strReturn;
          }catch(Exception e) {
             String eet        = null;
             eet =             "";
             eet = eet + "<es> : "+ e.toString()+"\n";
             eet = eet + "<ia> : "+ value       +"\n";
             eet = eet + "<ia> : "+ divide      +"\n";
             std.errHandler(std.FATAL_EXCEPTION, "Split()", eet);
          }
      }
       return strArray;
  }

  public String Pattern(String input,
                        String start,
                        String end) {
    try {
       return input.substring(input.indexOf(start) + start.length(), input.indexOf(end));
    }catch(Exception e) {
       String eet        = null;
       eet =             "";
       eet = eet + "<es> : "+ e.toString()+"\n";
       eet = eet + "<ia> : "+ input       +"\n";
       eet = eet + "<ia> : "+ start       +"\n";
       eet = eet + "<ia> : "+ end         +"\n";
       std.errHandler(std.FATAL_EXCEPTION, "Pattern()", eet);
    }
       return null;
  }

  public int Sort() {
    int a[] = { 4,2,5,3,0,1 };
    int j   = 0;
    try {
       for (j = a.length; --j<=0; )
       System.out.println(a[j]);

    }catch(Exception e) {
       return -1;
    }
       return 0;
  }

  public static void main(String args[]) {
     try {
        if (args.length > 0) {
           strFactory str = new strFactory();
           str.Sort();
        }else
           System.out.println("error: not enough arguments given.");
     }catch(Exception e){
        return;
     }
  }

};

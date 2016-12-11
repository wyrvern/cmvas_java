/**
  * @info        : console, parser.
  * @build       : 1.0.0, 07/04/2002-18:43:00:GMT+2
  * @author      : <null@null.co.za>
  * @todo        : 
  **/

import com.ms.wfc.app.*;
import java.util.Date;
import java.util.Properties;
import java.io.*;
import java.lang.reflect.*;

public class parser {

  private lib.libstr.strFactory str     = new lib.libstr.strFactory();
  private lib.libstd.stdFactory std     = new lib.libstd.stdFactory();
  private InputStreamReader     in;
  private StringBuffer          buf;
  private PrintWriter           out;
  private String                inp;

  public parser(String f_a,
                String f_b,
                String enc) {
     try {
        in  = new FileReader(new File(f_a));
        out = new PrintWriter(new OutputStreamWriter(new FileOutputStream(new File(f_b)), enc));
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()                +"\n";
        std.errHandler(std.LOAD_EXCEPTION, "ioFactory()", eet);
     }
   }

   public String read() {
      try {
         int c;
         buf = new StringBuffer();
         while ((c =  in.read()) != -1) {
            if(c == 13) {
               buf.append(";");
            }else
               buf.append((char)c);
         }
      }catch(Exception e){
         String eet        = null;
         eet =             "";
         eet = eet + "<es> : "+ e.toString()+"\n";
         std.errHandler(std.IO_EXCEPTION, "read()", eet);
      }
      return buf.toString();
   }

   public void write(String d) {
      try {
         inp = d;
         if(inp != null) {
            if(out != null) out.write(inp, 0, inp.length());
         }
      }catch(Exception e){
         String eet        = null;
         eet =             "";
         eet = eet + "<es> : "+ e.toString()+"\n";
         std.errHandler(std.IO_EXCEPTION, "write()", eet);
      }
   }

  public void close() {
     try {
        in.close();
        out.close();
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        std.errHandler(std.IO_EXCEPTION, "close()", eet);
     }
  }

  public static void main (String[] args) {
    parser p = new parser(Application.getStartupPath() + "\\sql\\flat.2.sql",
                          Application.getStartupPath() + "\\sql\\flat.out.sql",
                          "ASCII");
    p.write(p.read());
    p.close();
  }
}

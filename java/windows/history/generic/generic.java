import java.io.*;
import java.util.*;

/**
 * The generic library class.
 * <p>
 * @author null@null.co.za
 * @version 1.0.1
 */

public class generic {
 private String ernst;
 private String STRINGID = "string library v1.0.1";

/****/
  public static void main (String[] args) {
    generic app = new generic(args);
  }

/***/
  public generic(String[] args) {
   byte mm = this.processArgs(args);
  }
/**/

/****/  
  public byte processArgs(String[] args) {
   ernst          = "12";
   byte craft     = -128;
   int  derk      = 190;
   Byte kde       = Byte.decode(ernst);   
   byte kdo       = Byte.parseByte(ernst);
   byte kdp       = 120;
   byte ope       = 0;
   byte dc        = Byte.MAX_VALUE;   
   int  lo        = hashCode();
   Byte vo        = new Byte(kdp);
   int  ko        = vo.intValue();   
   String fope    = vo.toString();
   
   byte de[]      = new byte[20];   
   try { 
	   System.in.read(de);
	   String dv  = new String(de);
	   System.out.print(dv);
   }
   catch(IOException ex){System.out.println(ex);}  
   return craft;
  }
}

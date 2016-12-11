/**
  * desc : cryptlib. java encryptor.
  * mods : 29/01/2002-14:54:00:GMT+2
  * auth : null@null.co.za
  * todo : write constructor(+value)
  **/

package lib.libcrypt;

import java.util.Date;
import java.util.Properties;
import java.io.*;

public class cryptFactory {

//
// local initilizers
//

  private StringBuffer buf;
  private char[]       in;
  private String       out;

//
// instantces
//

  public  Properties       sysProp  = System.getProperties();
  private Date                  dt  = new Date();
  private lib.libstr.strFactory str = new lib.libstr.strFactory();
  private lib.libstd.stdFactory std = new lib.libstd.stdFactory();
  public  int          checkResult = -1;

  public cryptFactory() {
     try {
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        std.errHandler(std.LOAD_EXCEPTION, "cryptFactory()", eet);
        return;  
     }
   }

  public String crypt(String eval) throws Exception {
     in      = eval.toCharArray();
     buf     = new StringBuffer();
     int  x  = 0, n  = 0, bit = 0;
     try {
        do{
           n = (int)in[x];
           if(bit == 0) {
              n     -= 30; 
              bit    = 1;
           }else{
              n     += 128;
              bit    = 0;
           }
           buf.append((char)n);
           x++;
        }while(x<eval.length());
      }catch(Exception e){
         String eet        = null;
         eet =             "";
         eet = eet + "<es> : "+ e.toString()+"\n";
         eet = eet + "<ia> : "+ eval        +"\n";
         std.errHandler(std.LOAD_EXCEPTION, "crypt()", eet);
      }
      return buf.toString();
   }

  public String decrypt(String eval) throws Exception {
     in      = eval.toCharArray();
     buf     = new StringBuffer();
     int  x  = 0, n  = 0, bit = 0;
     try {
        do{
           n = (int)in[x];
           if((bit == 0)) {
              n     += 30;
              bit    = 1;
           }else{
              n     -= 128;
              bit    = 0;
           }
           buf.append((char)n);
           x++;
        }while(x<eval.length());
      }catch(Exception e){
         String eet        = null;
         eet =             "";
         eet = eet + "<es> : "+ e.toString()+"\n";
         eet = eet + "<ia> : "+ eval        +"\n";
         std.errHandler(std.LOAD_EXCEPTION, "decrypt()", eet);
      }
      return buf.toString();
   }

  public static void main(String args[]) {
     try {
        if (args.length > 0) {
           if (args[0].equalsIgnoreCase("/u")) {
           }
        }else
           new cryptFactory();
      }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        new lib.libstd.stdFactory().errHandler(new lib.libstd.stdFactory().FATAL_EXCEPTION, "main()", eet);
      }
  }
};

/**
  * desc : stdio. standard i/o routines
  * mods : 25/01/2002-11:17:00:GMT+2
  * auth : null@null.co.za
  * todo : write constructor(+value)
  **/

package lib.libio;

import java.util.Date;
import java.util.Properties;
import java.io.*;
//import com.ms.wfc.ui.*;

public class ioFactory {

//
// local initilizers
//

//
// instantces
//

  public  Properties       sysProp  = System.getProperties();
  private Date                  dt  = new Date();
  private lib.libstr.strFactory str = new lib.libstr.strFactory();
  private lib.libstd.stdFactory std = new lib.libstd.stdFactory();
  public  int          checkResult = -1;

  private File         dataFile;
  private PrintWriter  out;
  private FileWriter   out_f;
  private InputStreamReader in;
  private StringBuffer buf;
  private String       input;

  public ioFactory() {
     try {
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        std.errHandler(std.LOAD_EXCEPTION, "ioFactory()", eet);
     }
  }

  public ioFactory(File   file, 
                   String data,
                   String type) {
     try {
        dataFile   = new File(file.toString());
        if(type == "read") {
           in         = new FileReader(dataFile);
        }else
        if(type == "write") {
           out_f      = new FileWriter(dataFile);
           input      = data;
        }
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()                +"\n";
        eet = eet + "<ia> : "+ file                        +"\n";
        std.errHandler(std.LOAD_EXCEPTION, "ioFactory()", eet);
     }
   }

  public ioFactory(String file,
                   String enc) {
     try { 
        dataFile   = new File(file);
        in         = new InputStreamReader(new FileInputStream(dataFile), enc);
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()                +"\n";
        eet = eet + "<ia> : "+ file                        +"\n";
        std.errHandler(std.LOAD_EXCEPTION, "ioFactory()", eet);
     }
  }

  public ioFactory(String file,
                   String data,
                   String enc) {
     try {
        dataFile   = new File(file);
        out        = new PrintWriter(new OutputStreamWriter(new FileOutputStream(dataFile), enc));
        input      = data;
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()                +"\n";
        eet = eet + "<ia> : "+ file                        +"\n";
        eet = eet + "<ia> : "+ data                        +"\n";
        eet = eet + "<ia> : "+ enc                         +"\n";
        std.errHandler(std.LOAD_EXCEPTION, "ioFactory()", eet);
     }
  }

  public void write() {
     try {
        if(input != null) {
           if(out != null) {
              out.write(input, 0, input.length());
           }else
              out_f.write(input, 0, input.length());
        }else
           throw new Exception("no valid data available given");
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        std.errHandler(std.IO_EXCEPTION, "write()", eet);
     }
  }

  public String read() {
     try {
        int c;
        buf = new StringBuffer();
        while ((c = in.read()) != -1)
           if(c                != 10 &&
              c                != 13)
              buf.append((char)c);
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        std.errHandler(std.IO_EXCEPTION, "read()", eet);
     }
        return buf.toString();
  }

  public void close() {
     try {
        if(in != null)
           in.close();
        if(out != null)
           out.close();
        if(out_f != null)
           out_f.close();
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        std.errHandler(std.IO_EXCEPTION, "close()", eet);
     }
  }

  public static void main(String args[]) {
     try {
        if (args.length > 0) {
           if (args[0].equalsIgnoreCase("/u")) {

           }
        }
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        new lib.libstd.stdFactory().errHandler(new lib.libstd.stdFactory().FATAL_EXCEPTION, "main()", eet);
     }
  }
};

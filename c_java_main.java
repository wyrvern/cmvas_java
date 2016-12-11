import java.util.Date;
import java.util.Properties;
import java.io.*;

import java.sql.Connection;
import java.sql.DriverManager;

public class c_java_main {

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

  public c_java_main() {
     try {
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        std.errHandler(std.LOAD_EXCEPTION, "cryptFactory()", eet);
        return;  
     }
   }

   public void db_connect (String args[]) {
      Connection c = null;
      try {
         Class.forName("org.postgresql.Driver");
         c = DriverManager
            .getConnection("jdbc:postgresql://localhost:5432/testdb",
            "postgres", "123");
      } catch (Exception e) {
         e.printStackTrace();
         System.err.println(e.getClass().getName()+": "+e.getMessage());
         System.exit(0);
      }
      System.out.println("Opened database successfully");
   }

   public static void main(String args[]) {
   try {
        if (args.length > 0) {
           if (args[0].equalsIgnoreCase("/u")) {
           }
        }else
           new c_java_main();

           System.out.println ("!");

      }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        new lib.libstd.stdFactory().errHandler(new lib.libstd.stdFactory().FATAL_EXCEPTION, "main()", eet);
      }
  }
};

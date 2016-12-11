/**
  * desc : nalive. internet/keep alive util.
  * mods : 11/02/2002-16:00:00:GMT+2
  * auth : null@null.co.za
  * todo : 
  **/

import java.io.*;
import java.util.Date;
import java.lang.reflect.*;
import java.net.*;
import java.sql.*;

import com.ms.com.*;
import com.ms.util.*;

public class nalive {

private Date dt = new Date();
private String  minStamp;
private int     delay   = -1;
private int     argc    = -1;
private int     execute = -1;
private String  host;
private String  mail;
private String  url;
private String  address;
private String  dsn;
private String  user;
private String  password;
private String  uHeader = "";
private boolean set     = true;

  private String setHeader() {
  nalive  na  = new nalive();
     na.uHeader = na.uHeader+" usage : \n";
     na.uHeader = na.uHeader+" -h:<host/ip>";
     na.uHeader = na.uHeader+" -m:<mailhost/ip>";
     na.uHeader = na.uHeader+" -u:<url>";
     na.uHeader = na.uHeader+" -d:<delay>";
     na.uHeader = na.uHeader+" -a:<address;address>\n\n";
     na.uHeader = na.uHeader+" (optional)\n";
     na.uHeader = na.uHeader+" -ds:<data source>\n";
     na.uHeader = na.uHeader+" -du:<data user>\n";
     na.uHeader = na.uHeader+" -dp:<data password>\n\n";
     na.uHeader = na.uHeader+"  <host>          = resolved internet hostname\n";
     na.uHeader = na.uHeader+"                    or internet protocol address.\n";
     na.uHeader = na.uHeader+"  <mailhost>      = resolved internet hostname\n";
     na.uHeader = na.uHeader+"                    or internet protocol address\n";
     na.uHeader = na.uHeader+"                    for smtp mailer.\n";
     na.uHeader = na.uHeader+"  <url>           = filename on http server to\n";
     na.uHeader = na.uHeader+"                    connect to.\n";
     na.uHeader = na.uHeader+"  <delay>         = delay in milliseconds for each\n";
     na.uHeader = na.uHeader+"                    succesive server 'touch'.\n";
     na.uHeader = na.uHeader+"  <address;>      = multiple email recipients to\n";
     na.uHeader = na.uHeader+"                    send error messages to,\n";
     na.uHeader = na.uHeader+"                    seperated by ';'.\n";
     na.uHeader = na.uHeader+"  <data source>   = o/jdbc data source name.\n";
     na.uHeader = na.uHeader+"  <data user>     = o/jdbc database user name.\n";
     na.uHeader = na.uHeader+"  <data password> = o/jdbc database user password.\n";
  return na.uHeader;
  }

  private String y2k() {
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

  private void sleep(int delay) {
     Thread.currentThread().setPriority(Thread.MIN_PRIORITY);
     Thread currentThread = Thread.currentThread();
     System.out.println(currentThread);

   try {   
     Thread.sleep(delay);
     }catch (InterruptedException e) {
      return;
     }  
  }

  private int sqlThread() {
     smtplib ns  = new smtplib();
     minStamp    = dt.toLocaleString();
     String db   = "JDBC:ODBC:"+dsn;
     try {
       Class.forName ("com.ms.jdbc.odbc.JdbcOdbcDriver");
       //DriverManager.setLogStream(System.out);
       Connection con = DriverManager.getConnection (db, user, password);
      } catch (SQLException e) {
	while (e != null) {
	   System.out.println ("SQLState: " + e.getSQLState());
	   System.out.println ("Message:  " + e.getMessage());
	   System.out.println ("Vendor:   " + e.getErrorCode());
           ns.setData(mail,"root@"+host,address,"nalive_report : service_down(@)"+host,"Error occured at :" + minStamp +"\nError returned : "+ e.toString());
           ns.smtp();
	   e = e.getNextException ();     
           set = false;
           return -1;
	 } 
      } catch (java.lang.Exception e) {
           ns.setData(mail,"root@"+host,address,"nalive_report : service_down(@)"+host,"Error occured at :" + minStamp +"\nError returned : "+ e.toString());
           ns.smtp();        
           e.printStackTrace ();
           set = false;
           return -1;
      }
      return 0;
  }

  private int httpThread() {
     smtplib ns  = new smtplib();
     minStamp    = dt.toLocaleString();
      try {  
        URL http = new URL("http", host, 80, url);
        http.openConnection();
        http.openStream();
      }catch(MalformedURLException e){ 
        System.out.print(e);
        ns.setData(mail,"root@"+host,address,"nalive_report : service_down(@)"+host,"Error occured at :" + minStamp +"\nError returned : "+ e.toString());
        ns.smtp();
        set = false;
        return -1;
      }catch(IOException e){ 
        System.out.print(e);
        ns.setData(mail,"root@"+host,address,"nalive_report : service_down(@)"+host,"Error occured at :" + minStamp +"\nError returned : "+ e.toString());
        ns.smtp();
        set = false;
        return -1;
      }
      return 0;
  }

  private int checkSys(int execute) {
   nalive  na  = new nalive();
    if (execute == 1) {
      do { 
         if (httpThread () == 0) {
           System.out.println("[System check every : "+delay+"(ms)]");
           System.out.println("[TimeStamp          : "+minStamp+"]");
           na.sleep(delay);
         }else{
           System.out.println("ERROR : Exiting...");
           return -1;
         }
       }while(set);
     }else
    if (execute == 2) {
      do { 
         if (sqlThread () == 0) {
           System.out.println("[System check every : "+delay+"(ms)]");
           System.out.println("[TimeStamp          : "+minStamp+"]");
           na.sleep(delay);
         }else{
           System.out.println("ERROR : Exiting...");
           return -1;
         }
       }while(set);
     }else
    if (execute == 3) {
      do {
         if (sqlThread() == 0 && httpThread() == 0) {
           System.out.println("[System check every : "+delay+"(ms)]");
           System.out.println("[TimeStamp          : "+minStamp+"]");
           na.sleep(delay);
         }else{
           System.out.println("ERROR : Exiting...");
           return -1;
         }
       }while(set);
     }
  return 0;
  }

  public static void main (String args[]) {
   nalive  na  = new nalive();
   smtplib ns  = new smtplib();
   System.out.println("nalive v1.0.12-02-02 fuelWare (c) 2002");
   System.out.println("info@fuel.null.co.za\n");

    if(args.length>0) {
      for (int j=0;j<args.length;j++) {
        int v = args[j].indexOf("-h:");
        int w = args[j].indexOf("-m:");
        int x = args[j].indexOf("-u:");
        int y = args[j].indexOf("-d:");
        int z = args[j].indexOf("-a:");
        int a = args[j].indexOf("-ds:");
        int b = args[j].indexOf("-du:");
        int c = args[j].indexOf("-dp:");
       if (v != -1){
        na.host = args[j].substring(x+4);
        System.out.println("host          : "+na.host);
        na.argc    = na.argc+1;
       }
       if (w != -1){
        na.mail = args[j].substring(x+4);
        System.out.println("mail host     : "+na.mail);
        na.argc    = na.argc+1;
       }
       if (x != -1){
        na.url = "/"+args[j].substring(x+3);
        System.out.println("url           : "+na.url);
        na.argc    = na.argc+1;
       }
       if (y != -1){
        na.delay = Integer.parseInt(args[j].substring(x+4));
        System.out.println("delay         : "+na.delay);       
        na.argc    = na.argc+1;
       }
       if (z != -1){
        na.address = args[j].substring(x+4);
        System.out.println("address(s)    : "+na.address);
        na.argc    = na.argc+1;
       }
       if (a != -1){
        na.dsn = args[j].substring(x+5);
        System.out.println("jdbc provider : "+na.dsn);
        na.argc    = na.argc+1;
       }
       if (b != -1){
        na.user = args[j].substring(x+5);
        System.out.println("jdbc user     : "+na.user);
        na.argc    = na.argc+1;
       }
       if (c != -1){
        na.password = args[j].substring(x+5);
        System.out.println("jdbc pass     : "+na.password);
        System.out.println();
        na.argc    = na.argc+1;
       }
      }
     }
     if(na.argc < 3 || na.argc == -1) {
       System.out.print(na.setHeader());
     }
   if(na.host     != null &&
       na.mail     != null &&
       na.url      != null &&
       na.delay    != -1   &&
       na.address  != null &&
       na.dsn      != null &&
       na.user     != null &&
       na.password != null) {
       na.execute   = 3;
       na.checkSys(na.execute);
     }else
   if(na.host    != null &&
       na.mail     != null &&
       na.url      != null &&
       na.delay    != -1   &&
       na.address  != null) {
       na.execute   = 1;
       na.checkSys(na.execute);
     }else
   if(na.mail     != null &&
       na.delay    != -1   &&
       na.address  != null &&
       na.dsn      != null &&
       na.user     != null &&
       na.password != null) {
       na.execute   = 2;
       na.checkSys(na.execute);
     } 
  }
}

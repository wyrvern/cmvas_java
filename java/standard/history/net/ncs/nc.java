/*
 *   -----------------------// c
*/

import java.io.*;
import java.util.Date;
import java.lang.reflect.*;
import java.net.*;

public class nc extends Thread {
protected Socket           c         = null;
protected BufferedReader   is        = null;
protected DataOutputStream os        = null;
protected static final int BUFSIZE   = 1000;
private static String      strHeader;
private static String      strHelp;
private static String      cmd;
private static char        ch         = '\0';

private static String      host;
private static int         port;

   private String getHeader() {  
     try {        
        strHeader =           "ntcp[c] v1.0.[20-11-01] nullWare (c) 2001\n";
        strHeader = strHeader+"info@null.co.za\n";
     }catch (Exception e) {
        return null;
     }  
     return strHeader;
   }

   private String getHelp() {  
     try {        
        strHelp =         "[ntcp :           command line options]\n";
        strHelp = strHelp+"[-------------------------------------]\n";
        strHelp = strHelp+"syntax :                               \n\n";
        strHelp = strHelp+" - c:(host/ip):(port)                         \n";
        strHelp = strHelp+"      connect to hostname (or) internet\n";
        strHelp = strHelp+"      protocol in the format of :      \n";
        strHelp = strHelp+"      [xxx.xxx.xxx.xxx] & ':' & (port) \n";
        strHelp = strHelp+" - l:[r/l]                             \n";
        strHelp = strHelp+"      list directory contents of remote\n";
        strHelp = strHelp+"      or local system.                 \n";
        strHelp = strHelp+" - g:(filename.ext)                    \n";
        strHelp = strHelp+"      download remote file and         \n";
        strHelp = strHelp+"      store in local dir.              \n";
        strHelp = strHelp+" - p:(filename.ext)                    \n";
        strHelp = strHelp+"      upload local file and            \n";
        strHelp = strHelp+"      store in remote dir.             \n";
        strHelp = strHelp+" - i:[r/l]                             \n";
        strHelp = strHelp+"      inet information on              \n";
        strHelp = strHelp+"      remote (or) local host.          \n";
        strHelp = strHelp+" - q:                                  \n";
        strHelp = strHelp+"      exit application.                \n";
        strHelp = strHelp+"[-------------------------------------]\n";
     }catch (Exception e) {
        return null;
     }  
     return strHelp;
   }

   private boolean sleep(int delay) {
      Thread.currentThread().setPriority(Thread.MIN_PRIORITY);
      Thread currentThread = Thread.currentThread();
       try {   
          Thread.sleep(delay);
          return true;
       }catch (InterruptedException e) {
          return false;
       }  
   }

   public void stdIn() {
     while(true) {
        try {
           byte alloc[]    =  new byte[BUFSIZE]; 
           System.out.print(">");
           System.in.read(alloc);
           String stdin = new String(alloc).trim();
           ch = stdin.charAt(0);
           switch (ch) {
              case 'q':
                 System.exit(0);
                 break;
              case '?':
                 System.out.println(getHelp());
                 break;
              case 'c':
                 try {
                    if(stdin.indexOf(':') != -1) {
                       cmd = stdin.substring(stdin.indexOf(':')+1);
                       if(cmd.length() < 1) {
                          System.out.println("Please supply connection data.");
                          break;
                       }else                       
                          System.out.println(cmd);
                          host = cmd;
                          port = 21;                           
                          openSocket();
                          break;
                    }else
                       System.out.println("Please supply connection data.");
                 }catch(java.lang.StringIndexOutOfBoundsException e){
                    continue; }
              default:
                 break;
            }
        }catch(java.lang.StringIndexOutOfBoundsException e){
           continue;
        }catch (Exception e) {
           System.out.println(e);
        }
      }
   }

   public void openSocket() {
     try {  
       c  = new Socket(host, port);
       is = new BufferedReader(new InputStreamReader(c.getInputStream());
       os = new DataOutputStream(c.getOutputStream());
       os.writeUTF("msg");
       c.close();
     }catch (Exception e) {
        System.out.println(e);
     } 
   }

   private void closeClient() {
      try {
         os.close();
         is.close();
         c.close();
      }catch(IOException e) {
         System.out.println(e);
      }
   }

   public static void main (String args[]) {
   nc     c    = new nc();
   try {
      System.out.println(c.getHeader());
      c.stdIn();
   }catch(Exception e) {
      System.out.println(e); }
   }
}

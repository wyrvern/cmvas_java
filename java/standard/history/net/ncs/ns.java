/*
 *   -----------------------// s
*/

import java.io.*;
import java.util.Date;
import java.lang.reflect.*;
import java.net.*;

public class ns extends Thread {
protected ServerSocket ss            = null;
private   Socket       c             = null;
protected BufferedReader   is        = null;
protected DataOutputStream os        = null;
protected static final int BUFSIZE   = 1000;
private static String      strHeader;
private static String      cmd;
private static String      host;
private static int         port;
public    Date             dt        = new Date();
private   static char      ch        = '\0';

   private String getHeader() {  
     try {        
        strHeader =           "ntcp[s] v1.0.[20-11-01] nullWare (c) 2001\n";
        strHeader = strHeader+"info@null.co.za\n";
     }catch (Exception e) {
        return null;
     }  
     return strHeader;
   }

   public ns() {
     try {
        System.out.println(getHeader());
        ss = new ServerSocket(port);
     }catch (java.net.BindException e) {
        System.out.println(e);
     }catch (Exception e) {
        System.out.println(e);
     }
         this.start();
   }

   public void run() {
      try {
         while(true) {            
            System.out.println("[listening on port "+port+"]");
            c = ss.accept();
            System.out.println("[client connected]");
//            clientData(c);
            is = new BufferedReader(new InputStreamReader(c.getInputStream());
            os = new DataOutputStream(c.getOutputStream());

            c.close();
            System.out.println("[client closed]");

/*
            byte alloc[]    =  new byte[BUFSIZE]; 
            System.out.print(">");
            System.in.read(alloc);
            String stdin = new String(alloc).trim();
            ch = stdin.charAt(0);
            switch (ch) {
               case 'q':
                  closeServer();
                  System.exit(0); 
                  break;
               case '?':
                  System.out.println("?");
                  break;
               default:
            }     break;
*/
         }
      }catch (Exception e) {
         System.out.println(e);
      }
   }

   public void clientData(Socket c) {
     try {
        System.out.println(c.getInetAddress());
        System.out.println(c.getPort());
        System.out.println(c.getLocalAddress());
        System.out.println(c.getLocalPort());
        System.out.println();
     }catch(Exception e) {
        System.out.println(e);
     }
   }

   private void closeServer() {
     try {
        os.close();
        is.close();
        c.close();
        ss.close();
     }catch(Exception e) {
        System.out.println(e);
     }
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

   public static void main (String args[]) {
    try {
       port = 21;
       ns s = new ns();
   }catch(Exception e) {
      System.out.println(e); }
   }
}

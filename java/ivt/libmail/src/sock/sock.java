import java.io.*;
import java.util.*;
import java.lang.reflect.*;
import java.net.*;

   public class sock {

      public String host;
      public String from;
      public String to;
      public String subject;
      public String body;

      private PrintWriter    out;
      private BufferedReader in;

      private void send(String data) throws IOException {
         for(int j=0; j<data.length(); j++) {
           out.write(outData.charAt(j));
         }
         out.write(13); out.write(10); out.flush();
      }

      public void push() throws IOException {

         Socket s = new Socket(host ,25);
         out = new PrintWriter(s.getOutputStream());
         in = new BufferedReader(new InputStreamReader(s.getInputStream()));
             
         send(null);
      // new sun.misc.BASE64Encoder enc = new new sun.misc.BASE64Encoder();
         send("HELO " + InetAddress.getLocalHost().getHostName());
      // S: 250 OK
         send("AUTH LOGIN");
      // 334 VXNlcm5hbWU6
         send(enc.encode(username.getBytes()));
      // 334 UGFzc3dvcmQ6
         send(enc.encode(password.getBytes()));
      // 235 LOGIN authentication successful
         send("MAIL FROM: " + from.getText());
         send("RCPT TO: " + to.getText());
         send("DATA");
         out.println("Subject: " + subject.getText());
         out.println(_body.getText());
         send(".");
         s.close();
      }

      public static void main (String args[]) {
         libmail s     = new sock();
         s.host        = "null";
         s.from        = "root@null";
         s.to          = "null@null";
         s.subject     = "tway!";
         s.body        = "ofay..";
         s.send();
      }
   }

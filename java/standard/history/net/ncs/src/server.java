import java.io.*;
import java.net.*;
import java.util.*;

public class server extends Thread {
  // The port number on which the server 
  // will be listening on
  public static final int HTTP_PORT = 3333;
  protected ServerSocket listen;

  // constructor.
  public server() {
    try {
      listen = new ServerSocket	(HTTP_PORT);
    } catch(IOException ex) {
      System.out.println("Exception..."+ex);
    }
    this.start();
  }
  // multi-threading -- create a 
  // new connection for each request
  public void run() {
    try {
      while(true) {
        Socket client = listen.accept();
        Connects cc = new Connects(client);
      }
    }catch(IOException e) {
      System.out.println("Exception..."+e);
    }
  }

  // main program
  public static void main(String argv[]) throws IOException {
      new server();
  }
}

class Connects extends Thread {
  Socket client;
  BufferedReader is;
  DataOutputStream os;
  ArrayIO aio = new ArrayIO();
  ArrayMath am = new ArrayMath();

  public Connects(Socket s) { // constructor
    client = s;
    try {
      is = new BufferedReader(new InputStreamReader(client.getInputStream()));
      os = new DataOutputStream(client.getOutputStream());
    }catch (IOException e) {
      try {
        client.close();
      } 
      catch (IOException ex) {
        System.out.println("Error getting socket streams.."+ex);
      }
      return;
    }
    this.start(); // Thread starts here...          
                  // start() will call run()
  }
 
  public void run() {
    int a1[] = new int[10];
    int a2[] = new int[10];
    try {
      a1 = aio.readArray(is);
      a2 = aio.readArray(is);
    } 
    catch(Exception ioe) {}
    int r[] = new int[10];
    r = am.addArray(a1, a2);
    try {
      aio.writeArray(os, r);
    } 
    catch(Exception e) {
      e.printStackTrace();
    }
  }
}


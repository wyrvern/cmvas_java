import java.io.*;

class ArrayMath {
  public ArrayMath() {}
   
/** simple method to add two 
 * arrays ofintegers 
 */
  public int[] addArray	(int a[], int b[]) {
    int result[] = new int[10];
    for (int s=0; s<result.length; s++) {
      result[s] = a[s] + b[s];   
    }
    return result;
  }
}

import java.io.*;

class ArrayIO {
  public ArrayIO() {}

/**
 * write an array of integers to a socket
 */ 
  public void writeArray(DataOutputStream out, int arr[]) throws Exception {
      for (int i=0; i<arr.length; i++) {
        out.write(arr[i]);
      }
    }

/**
 * read an array of integers from a socket
 */
  public int[] readArray (BufferedReader br) throws Exception {
      int c[] = new int[10];
      for (int h=0; h<10; h++) {
        try {  
          c[h] = (int) br.read();
        }catch(IOException il) {   }
      }
      return c;
   }
}    


import java.io.*;
import java.net.*;

public class client {    
  public final static int REMOTE_PORT = 3333;
  static int a[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  static int b[] = {11, 12, 13, 14, 15, 16, 17, 18, 19, 20};

  public static void main (String argv[]) throws Exception {
	Socket cl = null, cl2=null;
	BufferedReader is = null;
	DataOutputStream os = null;
        ArrayIO aio = new ArrayIO();

     // Open connection to the compute 
     // engine on port 5555	
	try {
	  cl = new Socket ("leo",REMOTE_PORT);
          is = new BufferedReader(new InputStreamReader(cl.getInputStream()));
	  os = new DataOutputStream(cl.getOutputStream());
	}catch (UnknownHostException e1) {
	  System.out.println("Unknown Host: "+e1);
 	} 
         catch (IOException e2) {
	  System.out.println("Error io: "+e2);
	}

	try {	    
	  aio.writeArray(os, a);
          aio.writeArray(os, b);
	}catch (IOException ex) {
	  System.out.println("error writing to server..."+ex);
	}	

	// receive results from the math server
	int result[] = new int[10];
	try {
           result = aio.readArray(is);
	} catch(Exception e) {
	  e.printStackTrace();
	}

	System.out.println ("The sum of the two arrays is: ");
	for (int j=0; j<result.length; j++) {
	  System.out.print(result[j]+" ");
	}
        System.out.println("");
	// close input stream, output 
        // stream and connection
	try {
          is.close();
          os.close();
	  cl.close();
	}catch (IOException x) {
	   System.out.println("Error writing...."+x);
	}
  }
}


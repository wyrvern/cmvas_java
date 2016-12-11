/**
  * desc : types. java basic(s)
  * mods : 03/02/2002-19:23:00:GMT+2
  * auth : null@null.co.za
  * todo : 
  *      : 
  **/

import java.io.*;
import java.util.*;
import java.lang.reflect.*;

public class types {

  public char debug(char[] value) [] {
    try {
/**
       System.out.println(System.getProperties());
      'cp850''utf8'
       System.out.println(System.getProperties());
       System.getProperties().list(System.out);
       System.out.println(System.getProperty("file.encoding"));
       System.out.print('\n');
       for(int j=0; j<255; j++) {
          System.out.print((char)j);
       }
       System.out.print('\n');
**/
       double a = 7.6,
              b = 3.1,
              f = 0;
       f = a % b;
       System.out.print(f);
            
    }catch(Exception e){
        System.out.println(e.toString());
    }
       return value;
  }

  public static void main (String[] args) {
    types in = new types();
    in.debug(null);
  }
}

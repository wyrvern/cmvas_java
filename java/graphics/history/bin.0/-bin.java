/**
  * desc : 
  * mods : 
  * auth : null@null.co.za
  * todo : 
  **/

import java.lang.reflect.*;
import java.util.Date;

public class bin {

  public bin() {
     try {
     }catch(Exception e){
        return;
     }
  }

  public static void main(String args[]) {
     try {
        if (args.length > 0) {
           bin g = new bin();
        }else
           System.out.println("error: not enough arguments given.");
     }catch(Exception e){
        return;
     }
  }

};

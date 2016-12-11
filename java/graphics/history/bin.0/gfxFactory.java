/**
  * desc : 
  * mods : 
  * auth : null@null.co.za
  * todo : 
  **/

package lib.libgfx;

import java.lang.reflect.*;
import java.util.Date;

public class gfxFactory {

  public gfxFactory() {
     try {
     }catch(Exception e){
        return;
     }
  }

  public static void main(String args[]) {
     try {
        if (args.length > 0) {
           gfxFactory g = new gfxFactory();
        }else
           System.out.println("error: not enough arguments given.");
     }catch(Exception e){
        return;
     }
  }

};

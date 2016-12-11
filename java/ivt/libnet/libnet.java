/**
  * desc : libnet. http/functions.
  * mods : 17/02/2002-18:48:00:GMT+2
  * auth : null@null.co.za
  * todo : 
  *      : 
  **/

import java.applet.*;

public class libnet extends Applet {

   public libnet() {
      try {
         System.getProperties().list(System.out);
      }catch(Throwable e){
         // ...
      }
   }

   public String get_ie_vm() {
      String build = null;
      try {
         Class systemManager = Class.forName("com.ms.util.SystemVersionManager");
         build               = com.ms.util.SystemVersionManager.getVMVersion().getProperty("BuildIncrement");
      }catch(Throwable e){
         return null;
      }
      return build;
   }

   public String get_ns_vm() {
      String build = null;
      try {
         // 2000:xp, 95-1:95-2, 98-1:98-2
         build = System.getProperty("os.name") + ";" +
                 System.getProperty("os.version");
      }catch(Throwable e){
         return null;
      }
      return build;
   }

   public static void main (String[] args) {
      try {
         new libnet();
      }catch(Throwable e){
         // ...
      }
   }
}

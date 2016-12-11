/** nKey,
    encryptor

package seek keys :
 "[installer]"
 "[files]"

    **/
public class ncrypter {
  public int (String typical) {
    newarray         = new String[typical.length()];
    int    sendRCPT  = 0;
    int    findIndex;
    int    findHead;
    String strReturn;

    for (int i=0 ; i<newarray.length ; i++) {
    try {
      findHead           = typical.indexOf("[files]",i);
      findIndex          = typical.indexOf(";",i);
      strReturn          = typical.substring(i,findIndex);
      newarray[sendRCPT] = strReturn;
      sendRCPT           = sendRCPT+1;

      i = findIndex;
        }catch(StringIndexOutOfBoundsException e){
              sendRCPT           = sendRCPT+1;
              strReturn          = typical.substring(i);
              newarray[sendRCPT] = strReturn;
              return;
       }
    }
  }
};

import com.ms.wfc.ole32.*;
import com.ms.wfc.app.*;
import com.ms.wfc.ui.*;
import com.ms.win32.*;
import com.ms.dll.*;
import com.ms.com.*;
import com.ms.util.*;

import com.za.jShell.*;
import com.za.jShell.IPersistFile;

public class intFace {

  private void openInt() {
    String lpszPathObj     = "C:\\temp\\files\\link\\TimeSaver.exe";
    String lpszDesc        = "Description";
    String lpszPathLink    = "test.lnk"; //"C:\\temp\\files\\link\\test.lnk";

    IShellLinkA  psl = (IShellLinkA)new jShell();
    IPersistFile ppf = (IPersistFile)psl;

    psl.SetPath(lpszPathObj);
    psl.SetDescription(lpszDesc);
    psl.Resolve(0, 6);    
    ppf.Save(lpszPathLink, 0);
  }

  public static void main (String args[]) {
   intFace  in  = new intFace();   
   in.openInt();
   }
}

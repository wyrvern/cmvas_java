/**
  * @info        : console, Encryptor.
  * @build       : 1.0.0, 07/04/2002-18:43:00:GMT+2
  * @author      : <null@null.co.za>
  * @todo        : 
  **/

import com.ms.wfc.app.*;
import com.ms.wfc.core.*;
import com.ms.wfc.ui.*;
import com.ms.dll.*;
import com.ms.com.*;
import com.ms.win32.*;
import com.ms.util.*;

import java.util.Date;
import java.util.Properties;
import java.io.*;
import java.lang.reflect.*;

public class jCrypt {

  String strResult                      = null;
  String cryptData                      = null;
  String decryptData                    = null;

  public  Properties sysProp            = System.getProperties();
  private Date   dt                     = new Date();
  public  lib.libstr.strFactory ns      = new lib.libstr.strFactory();
  private lib.libsys.sysFactory sf      = new lib.libsys.sysFactory();
  private lib.libcrypt.cryptFactory c   = new lib.libcrypt.cryptFactory();

  public int crypt() {
     try {
     String enc = "<a_cn_xyz>Crystal Clear,";
     enc       += "<a_cc_xyz>info@crystalclear.co.za,";
     enc       += "<a_cu_xyz>http://www.crystalclear.co.za/,";
     enc       += "<a_ps_xyz>debug@isotop.net,";
     enc       += "<a_pn_xyz>isotop Demo,";
     enc       += "<a_pd_xyz>isotopDemo,";
     enc       += "<a_se_xyz>TimeSaver.exe,";
     enc       += "<a_si_xyz>isotop.ico,";
     enc       += "<a_sl_xyz>isotop Demo.lnk,";
     enc       += "<a_sd_xyz>C:\\Program Files\\isotopDemo\\,";
     enc       += "<a_sl_fyz>TimeSaver.exe;isotop.cnt;DemoData.ini;dealerdata.dat;isotop.gid;isotop.hlp;demodata.txt;un.ico;isotop.ico,";
     enc       += "<a_ss_fyz>msstdfmt.dll;msvbvm60.dll;msvcrt.dll;oledlg.dll;riched20.dll;riched32.dll;actbar.ocx;library.ocx;synFormLock.ocx;syngradient.ocx;synrich.ocx;synRichEd.ocx;vsview6.ocx;ssa3d30.ocx;ssscrl30.ocx;comdlg32.ocx;richtx32.ocx,";
     enc       += "<a_sl_ryz>,";
     enc       += "<a_ss_ryz>msstdfmt.dll;vsview6.ocx;syngradient.ocx,";
     enc       += "<a_vp_xyz>1.0.e";

     cryptData = c.crypt(enc);
     lib.libio.ioFactory      iw = new lib.libio.ioFactory(new File("jInstaller.ant"), cryptData, "write");
                   iw.write();
                   iw.close();

     lib.libio.ioFactory      ir = new lib.libio.ioFactory(new File(Application.getStartupPath() + "\\jInstaller.ant"), null, "read");
     String rslt = ir.read();
                   ir.close();
     cryptData = c.crypt(enc);
     String slip          = c.decrypt(rslt);
     //System.out.print(rslt);
     System.out.print(slip);

     }catch(Exception e){
        System.out.println(e.toString());
        return -1;
     }
     return 0;
  }

  public static void main (String[] args) {
    jCrypt enc = new jCrypt();
    enc.crypt();
  }
}

/**
  * desc : jSetup. setup() class for jInstaller.
  * mods : 25/01/2002-11:17:00:GMT+2
  * auth : null@null.co.za
  * todo : write constructor(+value)
  **/

import com.ms.wfc.app.*;
import com.ms.wfc.core.*;
import com.ms.wfc.ui.*;
import com.ms.win32.win.*;
import com.ms.dll.*;
import com.ms.com.*;

import java.io.*;

public class jSetup extends Form {

//
// local initilizers
//

 private cMain   cm         = new cMain();
 private String  Version    = null;
 private int     appStatus  = -1;
 private int     debugState = -1;

  public jSetup() throws Exception {
     super();
     try {
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "jSetup()", eet);
     }
   }

  public jSetup(int access) throws Exception {
     super();
     try {
        jDebug();
        jStart();
        cm.loadDefaults();
        jSetDefaults();
        jCheck(access);
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "jSetup()", eet);
     }
   }

  public void jDebug() {
     try {
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "jDebug()", eet);
     }
  }

  public void jStart() throws Exception {
     try {     
        if (cm.checkVersion() == -1  || 
            cm.setHeader().equalsIgnoreCase(null)) {
            Application.exit();
            System.exit(-1);
            throw new Exception();
        }else
            initForm();
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "jStart()", eet);
     }
  }

  public int jSetDefaults() {
     try {        
        Version                 = cm.setHeader();
        this.setText            (Version);
        cm.appDir               = cm.setSlash(Application.getStartupPath());
        cm.packageDir           = cm.setSlash(cm.packageDir);
        cm.sd                   = cm.setSlash(cm.sd);
        cm.programDir           = cm.setSlash(cm.programDir);
        cm.desktopDir           = cm.setSlash(cm.desktopDir);
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "jSetDefaults()", eet);
     }
        return 0;
  }

  public int jCheck(int access) {
     try {        
        if(access == 0) {
        }else
        if(access == 1) {
           txt_productCompany.setEnabled(true);
           txt_productContact.setEnabled(true);
           txt_productURL.setEnabled(true);

           txt_packageName.setEnabled(false);
           txt_packageDir.setEnabled(false);
           txt_packageExe.setEnabled(false);
           txt_packageIco.setEnabled(false);
           txt_packageLnk.setEnabled(false);
           txt_productSupport.setEnabled(false);

           cmb_localFiles.setEnabled(false);
           cmb_systemFiles.setEnabled(false);
           cmb_localCOM.setEnabled(false);
           cmb_systemCOM.setEnabled(false);
        }
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "jSetDefaults()", eet);
     }
        return 0;
  }

  public void dispose() {
     try {
        super.dispose();
        components.dispose();
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "dispose()", eet);
     }
  }

  private void cmdCompUpdate_click(Object source, Event e) {
     try {
        if((txt_productCompany.getText()).length() > 0 &&
           (txt_productContact.getText()).length() > 0) {
        cm.productCompany = txt_productCompany.getText();
        cm.productContact = txt_productContact.getText();
        cm.productURL     = txt_productURL.getText();        
        cm.updateConfig();
        cm.infoBox(0, "Info", "Information Updated");
        }else
           cm.infoBox(2, "Error", "All fields required");
     }catch(Exception ex){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ ex.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "jSetup_CompUpdate()", eet);
     }     
  }

  private void cmdCompClear_click(Object source, Event e) {
     try {
        txt_productCompany.setText(null);
        txt_productContact.setText(null);
        txt_productURL.setText(null);
     }catch(Exception ex){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ ex.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "jSetup_CompClear()", eet);
     }     
  }

  private void cmdCancel_click(Object source, Event e) {
     try {
        Application.exit();
     }catch(Exception ex){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ ex.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "jSetup_Cancel()", eet);
     }     
  }

  Container components = new Container();
  TabControl tabControl1 = new TabControl();
  Panel panel1 = new Panel();
  PictureBox picLogo = new PictureBox();
  Label label2 = new Label();
  GroupBox grpLabel = new GroupBox();
  Button cmdCancel = new Button();
  TabPage tab3 = new TabPage();
  TabPage tab2 = new TabPage();
  TabPage tab1 = new TabPage();
  Button button1 = new Button();
  Button button2 = new Button();
  ComboBox cmb_localFiles = new ComboBox();
  ComboBox cmb_systemFiles = new ComboBox();
  ComboBox cmb_localCOM = new ComboBox();
  ComboBox cmb_systemCOM = new ComboBox();
  Label lbl_localFiles = new Label();
  Label lbl_systemFiles = new Label();
  Label lbl_localCOM = new Label();
  Label lbl_systemCOM = new Label();
  Button cmdAdd_lf = new Button();
  Button cmdAdd_sf = new Button();
  Button cmdAdd_lr = new Button();
  Button cmdAdd_sr = new Button();
  Label lbl_packageName = new Label();
  Label lbl_productCompany = new Label();
  Label lbl_productContact = new Label();
  Label lbl_productURL = new Label();
  Edit txt_productCompany = new Edit();
  Edit txt_productContact = new Edit();
  Edit txt_productURL = new Edit();
  Edit txt_packageName = new Edit();
  Edit txt_packageDir = new Edit();
  Label lbl_packageDir = new Label();
  Label lbl_packageExe = new Label();
  Edit txt_packageExe = new Edit();
  Label lbl_packageIco = new Label();
  Edit txt_packageIco = new Edit();
  Edit txt_packageLnk = new Edit();
  Label lbl_packageLnk = new Label();
  Label lbl_productSupport = new Label();
  Edit txt_productSupport = new Edit();

  private void initForm()
  {
	  // NOTE:  This form is storing resource information in an
	  // external file.  Do not modify the string parameter to any
	  // resources.getObject() function call. For example, do not
	  // modify "foo1_location" in the following line of code
	  // even if the name of the Foo object changes: 
	  //   foo1.setLocation((Point)resources.getObject("foo1_location"));

	  IResourceManager resources = new ResourceManager(this, "jSetup");
	  this.setText("jInstaller : Setup");
	  this.setAutoScale(false);
	  this.setAutoScaleBaseSize(new Point(5, 13));
	  this.setClientSize(new Point(496, 353));
	  this.setIcon((Icon)resources.getObject("this_icon"));
	  this.setMaximizeBox(false);
	  this.setStartPosition(FormStartPosition.CENTER_SCREEN);

	  tabControl1.setLocation(new Point(8, 104));
	  tabControl1.setSize(new Point(480, 200));
	  tabControl1.setTabIndex(4);
	  tabControl1.setText("tabControl1");
	  tabControl1.setSelectedIndex(1);

	  panel1.setBackColor(new Color(224, 224, 224));
	  panel1.setLocation(new Point(8, 8));
	  panel1.setSize(new Point(480, 88));
	  panel1.setTabIndex(5);
	  panel1.setText("panel1");
	  panel1.setBorderStyle(BorderStyle.FIXED_SINGLE);

	  picLogo.setLocation(new Point(392, 8));
	  picLogo.setSize(new Point(80, 70));
	  picLogo.setTabIndex(0);
	  picLogo.setTabStop(false);
	  picLogo.setText("pictureBox1");
	  picLogo.setImage((Bitmap)resources.getObject("picLogo_image"));
	  picLogo.setSizeMode(PictureBoxSizeMode.AUTO_SIZE);

	  label2.setEnabled(false);
	  label2.setFont(new Font("Microsoft Sans Serif", 8.0f, FontSize.POINTS, FontWeight.BOLD, false, false, false, CharacterSet.DEFAULT, 0));
	  label2.setLocation(new Point(400, 304));
	  label2.setSize(new Point(88, 16));
	  label2.setTabIndex(6);
	  label2.setTabStop(false);
	  label2.setText("jInstaller wizard");

	  grpLabel.setLocation(new Point(0, 304));
	  grpLabel.setSize(new Point(392, 8));
	  grpLabel.setTabIndex(3);
	  grpLabel.setTabStop(false);
	  grpLabel.setText("");

	  cmdCancel.setFont(new Font("MS Sans Serif", 8.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
	  cmdCancel.setLocation(new Point(400, 328));
	  cmdCancel.setSize(new Point(87, 20));
	  cmdCancel.setTabIndex(0);
	  cmdCancel.setText("&Exit");
	  cmdCancel.addOnClick(new EventHandler(this.cmdCancel_click));

	  tab3.setBackColor(Color.CONTROL);
	  tab3.setLocation(new Point(4, 25));
	  tab3.setSize(new Point(472, 171));
	  tab3.setTabIndex(2);
	  tab3.setText("Package Setup");

	  tab2.setBackColor(Color.CONTROL);
	  tab2.setLocation(new Point(4, 25));
	  tab2.setSize(new Point(472, 171));
	  tab2.setTabIndex(1);
	  tab2.setText("Package Information");

	  tab1.setBackColor(Color.CONTROL);
	  tab1.setLocation(new Point(4, 25));
	  tab1.setSize(new Point(472, 171));
	  tab1.setTabIndex(0);
	  tab1.setText("Company Information");

	  button1.setFont(new Font("MS Sans Serif", 8.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
	  button1.setLocation(new Point(8, 320));
	  button1.setSize(new Point(87, 20));
	  button1.setTabIndex(2);
	  button1.setText("&Save");
	  button1.addOnClick(new EventHandler(this.cmdCompUpdate_click));

	  button2.setFont(new Font("MS Sans Serif", 8.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
	  button2.setLocation(new Point(104, 320));
	  button2.setSize(new Point(87, 20));
	  button2.setTabIndex(1);
	  button2.setText("&Clear");
	  button2.addOnClick(new EventHandler(this.cmdCompClear_click));

	  cmb_localFiles.setLocation(new Point(184, 8));
	  cmb_localFiles.setSize(new Point(184, 21));
	  cmb_localFiles.setTabIndex(7);
	  cmb_localFiles.setText("");

	  cmb_systemFiles.setLocation(new Point(184, 32));
	  cmb_systemFiles.setSize(new Point(184, 21));
	  cmb_systemFiles.setTabIndex(6);
	  cmb_systemFiles.setText("");

	  cmb_localCOM.setLocation(new Point(184, 56));
	  cmb_localCOM.setSize(new Point(184, 21));
	  cmb_localCOM.setTabIndex(1);
	  cmb_localCOM.setText("");

	  cmb_systemCOM.setLocation(new Point(184, 80));
	  cmb_systemCOM.setSize(new Point(184, 21));
	  cmb_systemCOM.setTabIndex(0);
	  cmb_systemCOM.setText("");

	  lbl_localFiles.setFont(new Font("MS Shell Dlg", 11.0f, FontSize.CHARACTERHEIGHT, FontWeight.BOLD, false, false, false, CharacterSet.DEFAULT, 0));
	  lbl_localFiles.setLocation(new Point(8, 8));
	  lbl_localFiles.setSize(new Point(168, 16));
	  lbl_localFiles.setTabIndex(10);
	  lbl_localFiles.setTabStop(false);
	  lbl_localFiles.setText("Application Files :");

	  lbl_systemFiles.setFont(new Font("MS Shell Dlg", 11.0f, FontSize.CHARACTERHEIGHT, FontWeight.BOLD, false, false, false, CharacterSet.DEFAULT, 0));
	  lbl_systemFiles.setLocation(new Point(8, 32));
	  lbl_systemFiles.setSize(new Point(168, 16));
	  lbl_systemFiles.setTabIndex(11);
	  lbl_systemFiles.setTabStop(false);
	  lbl_systemFiles.setText("System Files :");

	  lbl_localCOM.setFont(new Font("MS Shell Dlg", 11.0f, FontSize.CHARACTERHEIGHT, FontWeight.BOLD, false, false, false, CharacterSet.DEFAULT, 0));
	  lbl_localCOM.setLocation(new Point(8, 56));
	  lbl_localCOM.setSize(new Point(168, 16));
	  lbl_localCOM.setTabIndex(9);
	  lbl_localCOM.setTabStop(false);
	  lbl_localCOM.setText("Local COM Registration :");

	  lbl_systemCOM.setFont(new Font("MS Shell Dlg", 11.0f, FontSize.CHARACTERHEIGHT, FontWeight.BOLD, false, false, false, CharacterSet.DEFAULT, 0));
	  lbl_systemCOM.setLocation(new Point(8, 80));
	  lbl_systemCOM.setSize(new Point(168, 16));
	  lbl_systemCOM.setTabIndex(8);
	  lbl_systemCOM.setTabStop(false);
	  lbl_systemCOM.setText("System COM Registration :");

	  cmdAdd_lf.setFont(new Font("MS Sans Serif", 8.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
	  cmdAdd_lf.setLocation(new Point(376, 8));
	  cmdAdd_lf.setSize(new Point(87, 20));
	  cmdAdd_lf.setTabIndex(5);
	  cmdAdd_lf.setText("&Add");
	  cmdAdd_lf.addOnClick(new EventHandler(this.cmdCompUpdate_click));

	  cmdAdd_sf.setFont(new Font("MS Sans Serif", 8.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
	  cmdAdd_sf.setLocation(new Point(376, 32));
	  cmdAdd_sf.setSize(new Point(87, 20));
	  cmdAdd_sf.setTabIndex(4);
	  cmdAdd_sf.setText("&Add");
	  cmdAdd_sf.addOnClick(new EventHandler(this.cmdCompUpdate_click));

	  cmdAdd_lr.setFont(new Font("MS Sans Serif", 8.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
	  cmdAdd_lr.setLocation(new Point(376, 56));
	  cmdAdd_lr.setSize(new Point(87, 20));
	  cmdAdd_lr.setTabIndex(3);
	  cmdAdd_lr.setText("&Add");
	  cmdAdd_lr.addOnClick(new EventHandler(this.cmdCompUpdate_click));

	  cmdAdd_sr.setFont(new Font("MS Sans Serif", 8.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
	  cmdAdd_sr.setLocation(new Point(376, 80));
	  cmdAdd_sr.setSize(new Point(87, 20));
	  cmdAdd_sr.setTabIndex(2);
	  cmdAdd_sr.setText("&Add");
	  cmdAdd_sr.addOnClick(new EventHandler(this.cmdCompUpdate_click));

	  lbl_packageName.setFont(new Font("MS Shell Dlg", 11.0f, FontSize.CHARACTERHEIGHT, FontWeight.BOLD, false, false, false, CharacterSet.DEFAULT, 0));
	  lbl_packageName.setLocation(new Point(8, 8));
	  lbl_packageName.setSize(new Point(168, 16));
	  lbl_packageName.setTabIndex(5);
	  lbl_packageName.setTabStop(false);
	  lbl_packageName.setText("Product Name :");

	  lbl_productCompany.setFont(new Font("MS Shell Dlg", 11.0f, FontSize.CHARACTERHEIGHT, FontWeight.BOLD, false, false, false, CharacterSet.DEFAULT, 0));
	  lbl_productCompany.setLocation(new Point(8, 8));
	  lbl_productCompany.setSize(new Point(168, 16));
	  lbl_productCompany.setTabIndex(2);
	  lbl_productCompany.setTabStop(false);
	  lbl_productCompany.setText("Product Company :");

	  lbl_productContact.setFont(new Font("MS Shell Dlg", 11.0f, FontSize.CHARACTERHEIGHT, FontWeight.BOLD, false, false, false, CharacterSet.DEFAULT, 0));
	  lbl_productContact.setLocation(new Point(8, 32));
	  lbl_productContact.setSize(new Point(168, 16));
	  lbl_productContact.setTabIndex(1);
	  lbl_productContact.setTabStop(false);
	  lbl_productContact.setText("Product Contact Email :");

	  lbl_productURL.setFont(new Font("MS Shell Dlg", 11.0f, FontSize.CHARACTERHEIGHT, FontWeight.BOLD, false, false, false, CharacterSet.DEFAULT, 0));
	  lbl_productURL.setLocation(new Point(8, 56));
	  lbl_productURL.setSize(new Point(168, 16));
	  lbl_productURL.setTabIndex(0);
	  lbl_productURL.setTabStop(false);
	  lbl_productURL.setText("Product URL :");

	  txt_productCompany.setLocation(new Point(184, 8));
	  txt_productCompany.setSize(new Point(184, 20));
	  txt_productCompany.setTabIndex(5);
	  txt_productCompany.setText("");

	  txt_productContact.setLocation(new Point(184, 32));
	  txt_productContact.setSize(new Point(184, 20));
	  txt_productContact.setTabIndex(4);
	  txt_productContact.setText("");

	  txt_productURL.setLocation(new Point(184, 56));
	  txt_productURL.setSize(new Point(184, 20));
	  txt_productURL.setTabIndex(3);
	  txt_productURL.setText("");

	  txt_packageName.setLocation(new Point(184, 8));
	  txt_packageName.setSize(new Point(184, 20));
	  txt_packageName.setTabIndex(10);
	  txt_packageName.setText("");

	  txt_packageDir.setLocation(new Point(184, 32));
	  txt_packageDir.setSize(new Point(184, 20));
	  txt_packageDir.setTabIndex(11);
	  txt_packageDir.setText("");

	  lbl_packageDir.setFont(new Font("MS Shell Dlg", 11.0f, FontSize.CHARACTERHEIGHT, FontWeight.BOLD, false, false, false, CharacterSet.DEFAULT, 0));
	  lbl_packageDir.setLocation(new Point(8, 32));
	  lbl_packageDir.setSize(new Point(168, 16));
	  lbl_packageDir.setTabIndex(8);
	  lbl_packageDir.setTabStop(false);
	  lbl_packageDir.setText("Product Folder :");

	  lbl_packageExe.setFont(new Font("MS Shell Dlg", 11.0f, FontSize.CHARACTERHEIGHT, FontWeight.BOLD, false, false, false, CharacterSet.DEFAULT, 0));
	  lbl_packageExe.setLocation(new Point(8, 56));
	  lbl_packageExe.setSize(new Point(168, 16));
	  lbl_packageExe.setTabIndex(3);
	  lbl_packageExe.setTabStop(false);
	  lbl_packageExe.setText("Product Executable :");

	  txt_packageExe.setLocation(new Point(184, 56));
	  txt_packageExe.setSize(new Point(184, 20));
	  txt_packageExe.setTabIndex(9);
	  txt_packageExe.setText("");

	  lbl_packageIco.setFont(new Font("MS Shell Dlg", 11.0f, FontSize.CHARACTERHEIGHT, FontWeight.BOLD, false, false, false, CharacterSet.DEFAULT, 0));
	  lbl_packageIco.setLocation(new Point(8, 80));
	  lbl_packageIco.setSize(new Point(168, 16));
	  lbl_packageIco.setTabIndex(2);
	  lbl_packageIco.setTabStop(false);
	  lbl_packageIco.setText("Product Icon :");

	  txt_packageIco.setLocation(new Point(184, 80));
	  txt_packageIco.setSize(new Point(184, 20));
	  txt_packageIco.setTabIndex(7);
	  txt_packageIco.setText("");

	  txt_packageLnk.setLocation(new Point(184, 104));
	  txt_packageLnk.setSize(new Point(184, 20));
	  txt_packageLnk.setTabIndex(6);
	  txt_packageLnk.setText("");

	  lbl_packageLnk.setFont(new Font("MS Shell Dlg", 11.0f, FontSize.CHARACTERHEIGHT, FontWeight.BOLD, false, false, false, CharacterSet.DEFAULT, 0));
	  lbl_packageLnk.setLocation(new Point(8, 104));
	  lbl_packageLnk.setSize(new Point(168, 16));
	  lbl_packageLnk.setTabIndex(1);
	  lbl_packageLnk.setTabStop(false);
	  lbl_packageLnk.setText("Product Shortcut Name :");

	  lbl_productSupport.setFont(new Font("MS Shell Dlg", 11.0f, FontSize.CHARACTERHEIGHT, FontWeight.BOLD, false, false, false, CharacterSet.DEFAULT, 0));
	  lbl_productSupport.setLocation(new Point(8, 128));
	  lbl_productSupport.setSize(new Point(168, 16));
	  lbl_productSupport.setTabIndex(0);
	  lbl_productSupport.setTabStop(false);
	  lbl_productSupport.setText("Product Support Email :");

	  txt_productSupport.setLocation(new Point(184, 128));
	  txt_productSupport.setSize(new Point(184, 20));
	  txt_productSupport.setTabIndex(4);
	  txt_productSupport.setText("");

	  this.setNewControls(new Control[] {
						  grpLabel, 
						  label2, 
						  panel1, 
						  button2, 
						  button1, 
						  tabControl1, 
						  cmdCancel});
	  tabControl1.setNewControls(new Control[] {
								 tab1, 
								 tab2, 
								 tab3});
	  panel1.setNewControls(new Control[] {
							picLogo});
	  tab3.setNewControls(new Control[] {
						  cmdAdd_sr, 
						  cmdAdd_lr, 
						  cmdAdd_sf, 
						  cmdAdd_lf, 
						  lbl_systemCOM, 
						  lbl_localCOM, 
						  lbl_localFiles, 
						  lbl_systemFiles, 
						  cmb_systemCOM, 
						  cmb_localCOM, 
						  cmb_systemFiles, 
						  cmb_localFiles});
	  tab2.setNewControls(new Control[] {
						  txt_productSupport, 
						  lbl_productSupport, 
						  lbl_packageLnk, 
						  txt_packageLnk, 
						  txt_packageIco, 
						  lbl_packageIco, 
						  txt_packageExe, 
						  lbl_packageExe, 
						  lbl_packageDir, 
						  txt_packageDir, 
						  txt_packageName, 
						  lbl_packageName});
	  tab1.setNewControls(new Control[] {
						  txt_productURL, 
						  txt_productContact, 
						  txt_productCompany, 
						  lbl_productURL, 
						  lbl_productContact, 
						  lbl_productCompany});
  }

  public static void main(String args[]) {
     try {
      if (args.length > 0) {
         if (args[0].equalsIgnoreCase("/u")) {
               Application.run(new jRemove());
         }else{
               Application.run(new jSetup());
         }
      }else
        Application.run(new jInstaller());
      }catch(Exception e){
        return;
      }
  }
};


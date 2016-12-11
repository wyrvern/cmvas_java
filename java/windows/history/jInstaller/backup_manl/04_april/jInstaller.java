/**
  * desc : jInstaller. entry() class for jInstaller.
  * mods : 29/01/2002-11:31:00:GMT+2
  * auth : null@null.co.za
  * todo : 
  **/

import com.ms.wfc.app.*;
import com.ms.wfc.core.*;
import com.ms.wfc.ui.*;
import com.ms.win32.*;
import com.ms.dll.*;
import com.ms.com.*;

import java.io.*;

public class jInstaller extends Form {

//
// local initilizers
//

 private cMain   cm                = new cMain();
 private String  Version           = null;
 private int     appStatus         = -1;
 private int     debugState        = -1;

  public jInstaller() throws Exception {
     super();
     try {
        jDebug();
        jStart();
        cm.loadDefaults();
        jSetDefaults();
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "jInstaller()", eet);
     }
   }

  public void jDebug() {
     try {  
        //System.exit(-1);
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
        txtSetupDir.setText     (cm.installDir = cm.setSlash(cm.installDir = cm.installFolder));
        lblPackageName.setText  (cm.packageName);
        lblCompany.setText      (cm.productCompany);
/**
        lblContact.setText      (cm.productContact);
        lblURL.setText          (cm.productURL);
**/
        lblInfo.setText         ("Click 'Next' to continue");
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "jSetDefaults()", eet);
     }
        return 0;
  }

  public void jInstall() throws Exception {
     try {     
        cm.delPath (new File(cm.jvmLocation));
        cm.createDirs();
        progressBar.step();

        cm.copyFiles (cm.sd,
                      cm.IO_COPY_SYSTEM);
        cm.copyFiles (cm.installDir,
                      cm.IO_COPY_PACKAGE);
        progressBar.step();

        cm.ioLocation(cm.IO_WRITE_LOCATION, "uninstall.cfg", cm.installDir);

        cm.createLink();
        progressBar.step();

        cm.regModifier("create", "SOFTWARE\\SteveG\\QSMT", new String[] { "UserCode;QSMT076B1F", "UserName;0766CE4ED13A46BDB6C8462D31382E414D4BD2352D20057AEF0172948BE16ECF4235394EB5DF619691999A9397F81879F2191B0E007DE02150B2A5DB4AD056C353" });
        cm.regModifier("create", "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\" + cm.productCompany, new String[] { "DisplayName;" + cm.packageName, "UninstallString;" + cm.appDir + "jInstaller.exe /u", "DisplayIcon;" + cm.installDir + cm.packageIco });
        progressBar.step();

        cm.objRegister(cm.DLL_UNREGISTER);
        cm.objRegister(cm.DLL_REGISTER);
        progressBar.step();

        progressBar.step();
        appStatus = 0;
        lblInfo.setText ("Click 'Finish' to continue");
        cmdCancel.setText("Finish");
        this.setCursor(Cursor.DEFAULT);

     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        cm.errHandler(cm.FATAL_EXCEPTION, "jInstall()", eet);
     }
  }

  public void dispose() {
     try {
        super.dispose();
        components.dispose();
        if (appStatus      == 0 &&
            cm.checkResult == 0 ||
            cm.checkResult == 1 ||
            cm.checkResult == 5) {
            cm.delPath (new File(cm.programDir + cm.startupLnk));
        }
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "dispose()", eet);
     }
  }

  private void cmdNext_click(Object source, Event e) {
     try {
        this.setCursor(Cursor.WAIT);
        cmdNext.setEnabled(false);
        jInstall();
     }catch(Exception ex){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ ex.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "jInstaller_Next()", eet);
     }
  }

  private void cmdBrowse_click(Object source, Event e) {
     try {
       cm.objPath = cm.dialogOpen("Browse for installtion folder :");
       if (cm.objPath != null) {
          txtSetupDir.setText(cm.installDir = cm.setSlash(cm.objPath));
       }
     }catch(Exception ex){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ ex.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "jInstaller_Browse()", eet);
     }
  }

  private void cmdCancel_click(Object source, Event e) {
     try {
        Application.exit();
     }catch(Exception ex){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ ex.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "jInstaller_Cancel()", eet);
     }     
  }

  private void lblContact_click(Object source, Event e) {
     try {
        cm.openMailer(6, "isotop TimeSaver Demo : product Contact", "", cm.productContact);
     }catch(Exception ex){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ ex.toString()+"\n";
        cm.errHandler(cm.MAIL_EXCEPTION, "jInstaller_Contact()", eet);
     }
  }

  Container components = new Container();
  Button cmdNext = new Button();
  Button cmdCancel = new Button();
  Button cmdBrowse = new Button();
  Edit txtSetupDir = new Edit();
  Label label4 = new Label();
  Panel panel2 = new Panel();
  Panel panel1 = new Panel();
  GroupBox grpLabel = new GroupBox();
  Label label2 = new Label();
  Label lblInfo = new Label();
  ProgressBar progressBar = new ProgressBar();
  GroupBox grpLogo = new GroupBox();
  PictureBox picLogo = new PictureBox();
  Label label1 = new Label();
  Label lblCompany = new Label();
  Label lblContact = new Label();
  Label lblURL = new Label();
  Label lblHead = new Label();
  Label lblPackageName = new Label();

  private void initForm()
  {
	  // NOTE:  This form is storing resource information in an
	  // external file.  Do not modify the string parameter to any
	  // resources.getObject() function call. For example, do not
	  // modify "foo1_location" in the following line of code
	  // even if the name of the Foo object changes: 
	  //   foo1.setLocation((Point)resources.getObject("foo1_location"));

	  IResourceManager resources = new ResourceManager(this, "jInstaller");
	  this.setFont(new Font("Tahoma", 8.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
	  this.setText("jInstaller : Install");
	  this.setAutoScale(false);
	  this.setAutoScaleBaseSize(new Point(4, 12));
	  this.setClientSize(new Point(496, 353));
	  this.setIcon((Icon)resources.getObject("this_icon"));
	  this.setMaximizeBox(false);
	  this.setStartPosition(FormStartPosition.CENTER_SCREEN);

	  cmdNext.setFont(new Font("MS Sans Serif", 8.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
	  cmdNext.setLocation(new Point(304, 328));
	  cmdNext.setSize(new Point(87, 20));
	  cmdNext.setTabIndex(7);
	  cmdNext.setText("&Next >");
	  cmdNext.addOnClick(new EventHandler(this.cmdNext_click));

	  cmdCancel.setFont(new Font("MS Sans Serif", 8.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
	  cmdCancel.setLocation(new Point(400, 328));
	  cmdCancel.setSize(new Point(87, 20));
	  cmdCancel.setTabIndex(5);
	  cmdCancel.setText("Cancel");
	  cmdCancel.addOnClick(new EventHandler(this.cmdCancel_click));

	  cmdBrowse.setFont(new Font("MS Sans Serif", 8.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
	  cmdBrowse.setLocation(new Point(303, 280));
	  cmdBrowse.setSize(new Point(87, 20));
	  cmdBrowse.setTabIndex(6);
	  cmdBrowse.setText("&Browse");
	  cmdBrowse.addOnClick(new EventHandler(this.cmdBrowse_click));

	  txtSetupDir.setFont(Font.DEFAULT_GUI);
	  txtSetupDir.setLocation(new Point(136, 280));
	  txtSetupDir.setSize(new Point(160, 20));
	  txtSetupDir.setTabIndex(9);
	  txtSetupDir.setText("");

	  label4.setBackColor(Color.ACTIVEBORDER);
	  label4.setFont(new Font("MS Shell Dlg", 11.0f, FontSize.CHARACTERHEIGHT, FontWeight.BOLD, false, false, false, CharacterSet.DEFAULT, 0));
	  label4.setLocation(new Point(8, 283));
	  label4.setSize(new Point(128, 16));
	  label4.setTabIndex(4);
	  label4.setTabStop(false);
	  label4.setText("Installation Directory :");

	  panel2.setBackColor(new Color(224, 224, 224));
	  panel2.setLocation(new Point(1, 8));
	  panel2.setSize(new Point(240, 134));
	  panel2.setTabIndex(1);
	  panel2.setText("panel1");
	  panel2.setBorderStyle(BorderStyle.FIXED_3D);

	  panel1.setBackColor(new Color(224, 224, 224));
	  panel1.setLocation(new Point(8, 8));
	  panel1.setSize(new Point(480, 88));
	  panel1.setTabIndex(10);
	  panel1.setText("panel1");
	  panel1.setBorderStyle(BorderStyle.FIXED_SINGLE);

	  grpLabel.setLocation(new Point(0, 303));
	  grpLabel.setSize(new Point(392, 8));
	  grpLabel.setTabIndex(2);
	  grpLabel.setTabStop(false);
	  grpLabel.setText("");

	  label2.setEnabled(false);
	  label2.setFont(new Font("Microsoft Sans Serif", 8.0f, FontSize.POINTS, FontWeight.BOLD, false, false, false, CharacterSet.DEFAULT, 0));
	  label2.setLocation(new Point(400, 303));
	  label2.setSize(new Point(88, 16));
	  label2.setTabIndex(8);
	  label2.setTabStop(false);
	  label2.setText("jInstaller wizard");

	  lblInfo.setBackColor(Color.ACTIVEBORDER);
	  lblInfo.setFont(new Font("Arial", 10.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
	  lblInfo.setLocation(new Point(8, 328));
	  lblInfo.setSize(new Point(288, 16));
	  lblInfo.setTabIndex(1);
	  lblInfo.setTabStop(false);
	  lblInfo.setText("");

	  progressBar.setLocation(new Point(8, 256));
	  progressBar.setSize(new Point(480, 16));
	  progressBar.setTabIndex(0);
	  progressBar.setText("progressBar1");
	  progressBar.setStep(20);
	  progressBar.setMaximum(120);

	  grpLogo.setLocation(new Point(8, 104));
	  grpLogo.setSize(new Point(480, 144));
	  grpLogo.setTabIndex(3);
	  grpLogo.setTabStop(false);
	  grpLogo.setText("");

	  picLogo.setLocation(new Point(392, 8));
	  picLogo.setSize(new Point(80, 70));
	  picLogo.setTabIndex(0);
	  picLogo.setTabStop(false);
	  picLogo.setText("pictureBox1");
	  picLogo.setImage((Bitmap)resources.getObject("picLogo_image"));
	  picLogo.setSizeMode(PictureBoxSizeMode.AUTO_SIZE);

	  label1.setBackColor(new Color(224, 224, 224));
	  label1.setFont(new Font("MS Sans Serif", 9.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
	  label1.setLocation(new Point(8, 112));
	  label1.setSize(new Point(232, 24));
	  label1.setTabIndex(0);
	  label1.setTabStop(false);
	  label1.setText("Your supplier’s details are shown at the end of the DEMO");
	  label1.setTextAlign(HorizontalAlignment.CENTER);

	  lblCompany.setFont(new Font("MS Sans Serif", 8.0f, FontSize.POINTS, FontWeight.BOLD, false, false, false));
	  lblCompany.setLocation(new Point(0, 80));
	  lblCompany.setSize(new Point(232, 16));
	  lblCompany.setTabIndex(3);
	  lblCompany.setTabStop(false);
	  lblCompany.setText("");
	  lblCompany.setTextAlign(HorizontalAlignment.CENTER);

	  lblContact.setCursor(Cursor.HELP);
	  lblContact.setFont(new Font("Courier New", 9.0f, FontSize.POINTS, FontWeight.NORMAL, false, true, false, CharacterSet.DEFAULT, 0));
	  lblContact.setLocation(new Point(0, 96));
	  lblContact.setSize(new Point(232, 16));
	  lblContact.setTabIndex(1);
	  lblContact.setTabStop(false);
	  lblContact.setText("");
	  lblContact.setTextAlign(HorizontalAlignment.CENTER);
	  lblContact.addOnClick(new EventHandler(this.lblContact_click));

	  lblURL.setFont(new Font("Courier New", 9.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
	  lblURL.setLocation(new Point(0, 112));
	  lblURL.setSize(new Point(232, 16));
	  lblURL.setTabIndex(0);
	  lblURL.setTabStop(false);
	  lblURL.setText("");
	  lblURL.setTextAlign(HorizontalAlignment.CENTER);

	  lblHead.setFont(new Font("MS Sans Serif", 8.0f));
	  lblHead.setLocation(new Point(0, 64));
	  lblHead.setSize(new Point(232, 16));
	  lblHead.setTabIndex(2);
	  lblHead.setTabStop(false);
	  lblHead.setText("Your isotop supplier is :");
	  lblHead.setTextAlign(HorizontalAlignment.CENTER);

	  lblPackageName.setBackColor(new Color(224, 224, 224));
	  lblPackageName.setFont(new Font("MS Sans Serif", 10.0f, FontSize.POINTS, FontWeight.BOLD, false, false, false));
	  lblPackageName.setLocation(new Point(1, 7));
	  lblPackageName.setSize(new Point(477, 20));
	  lblPackageName.setTabIndex(2);
	  lblPackageName.setTabStop(false);
	  lblPackageName.setText("");
	  lblPackageName.setBorderStyle(BorderStyle.FIXED_SINGLE);
	  lblPackageName.setTextAlign(HorizontalAlignment.CENTER);

	  this.setNewControls(new Control[] {
						  grpLogo, 
						  progressBar, 
						  grpLabel, 
						  label2, 
						  lblInfo, 
						  cmdBrowse, 
						  label4, 
						  txtSetupDir, 
						  cmdCancel, 
						  cmdNext, 
						  panel1});
	  panel2.setNewControls(new Control[] {
							lblHead, 
							lblURL, 
							lblContact, 
							lblCompany});
	  panel1.setNewControls(new Control[] {
							picLogo});
	  grpLogo.setNewControls(new Control[] {
							 label1, 
							 lblPackageName, 
							 panel2});
  }

  public static void main(String args[]) {
     try {
      if (args.length > 0) {
         if (args[0].equalsIgnoreCase("/u")) {
               Application.run(new jRemove());
         }else
         if (args[0].equalsIgnoreCase("/s:elf_09_87_01_34")) {
               Application.run(new jSetup(1));
         }else
               Application.run(new jInstaller());
      }else
        Application.run(new jInstaller());
      }catch(Exception e){
        return;
      }
  }
};

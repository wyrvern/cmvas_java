/**
  * desc : jRemove. uninstall() class for jInstaller.
  * mods : 25/01/2002-11:17:00:GMT+2
  * auth : null@null.co.za
  * todo : write constructor(+value)
  **/

import com.ms.wfc.app.*;
import com.ms.wfc.core.*;
import com.ms.wfc.ui.*;

import java.io.*;

public class jRemove extends Form {

// local initilizers

 private cMain   cm         = new cMain();
 private String  Version    = null;
 private int     appStatus  = -1;

 public jRemove() {
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
        cm.errHandler(cm.LOAD_EXCEPTION, "jRemove()", eet);
     }
 }

  public void jDebug() {
     try {
      // System.exit(-1);
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "jDebug()", eet);
     }
  }

  public void jStart() throws Exception {
     try {
        if (cm.checkVersion()          == -1  || 
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
        cm.installDir           = cm.setSlash(cm.installDir); 
        lblPackageName.setText  (cm.packageName);
        lblCompany.setText      (cm.productCompany);
        lblContact.setText      (cm.productContact);
        lblURL.setText          (cm.productURL);
        lblInfo.setText         ("Click 'Uninstall' to continue");
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "jSetDefaults()", eet);
     }
        return 0;
  }

  public void jUninstall() throws Exception {
     try {
        cm.installDir = cm.ioLocation(cm.IO_READ_LOCATION, "uninstall.cfg", null);
        cm.objRegister(cm.DLL_UNREGISTER);
        progressBar.step();

        cm.delPath(new File(cm.installDir));
        progressBar.step();
        progressBar.step();

        cm.delPath(new File(cm.desktopDir + cm.packageLnk));
        cm.delPath(new File(cm.programDir + cm.packageDir));
        progressBar.step();

        cm.regModifier("delete", "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\" + cm.productCompany, null);
        cm.regModifier("delete", "SOFTWARE\\SteveG", null);
        progressBar.step();

        progressBar.step();
        appStatus              = 0;
        this.setCursor(Cursor.DEFAULT);
        cmdUninstall.setEnabled(false);
        cmdCancel.setEnabled   (true);
        cmdCancel.setText      ("Finish");
        lblInfo.setText        ("Click 'Finish' to continue");

     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        cm.errHandler(cm.FATAL_EXCEPTION, "jUninstall()", eet);
     }
  }

 public void dispose() {
    try {
       super.dispose();
       components.dispose();
       if (appStatus == 0) {
          cm.delPath(new File(cm.appDir));
       }
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "dispose()", eet);
     }
 }

 private void lblContact_click(Object source, Event e) {
    try {
       cm.openMailer(6, "isotop TimeSaver Demo : product Contact", "", cm.productContact);	 
    }catch(Exception ex){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ ex.toString()+"\n";
        cm.errHandler(cm.MAIL_EXCEPTION, "jRemove_Contact()", eet);
    }
 }

 private void cmdUninstall_click(Object source, Event e) {
    try {
       if (appStatus == -1) {
          int msgReturn      = -1;
          msgReturn = cm.infoBox(1, "Uninstallation Confirmation", "Are you sure you wish to uninstall : " + cm.packageName + " ?");
          if (msgReturn == DialogResult.YES) {
             cmdUninstall.setEnabled(false);
             this.setCursor(Cursor.WAIT);
             jUninstall();
          }       
       }
    }catch(Exception ex){
       String eet        = null;
       eet =             "";
       eet = eet + "<es> : "+ ex.toString()+"\n";
       cm.errHandler(cm.UNINSTALL_EXCEPTION, "jRemove_Uninstall()", eet);
    }	 
 }

 private void cmdCancel_click(Object source, Event e) {
     try {
       Application.exit();
     }catch(Exception ex){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ ex.toString()+"\n";
        cm.errHandler(cm.LOAD_EXCEPTION, "jRemove_Cancel()", eet);
     }
 }

 Container components = new Container();
 Label lblURL = new Label();
 GroupBox grpLogo = new GroupBox();
 Button cmdUninstall = new Button();
 Label label2 = new Label();
 GroupBox grpLabel = new GroupBox();
 Panel panel2 = new Panel();
 Button cmdCancel = new Button();
 Label lblInfo = new Label();
 Label lblContact = new Label();
 Panel panel1 = new Panel();
 ProgressBar progressBar = new ProgressBar();
 Label lblPackageName = new Label();
 Label lblCompany = new Label();
 PictureBox picLogo = new PictureBox();

 private void initForm()
 {
	 // NOTE:  This form is storing resource information in an
	 // external file.  Do not modify the string parameter to any
	 // resources.getObject() function call. For example, do not
	 // modify "foo1_location" in the following line of code
	 // even if the name of the Foo object changes: 
	 //   foo1.setLocation((Point)resources.getObject("foo1_location"));

	 IResourceManager resources = new ResourceManager(this, "jRemove");
	 this.setText("jInstaller : Uninstall");
	 this.setAutoScaleBaseSize(new Point(5, 13));
	 this.setClientSize(new Point(496, 353));
	 this.setIcon((Icon)resources.getObject("this_icon"));
	 this.setStartPosition(FormStartPosition.CENTER_SCREEN);

	 lblURL.setFont(new Font("Courier New", 9.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
	 lblURL.setLocation(new Point(0, 112));
	 lblURL.setSize(new Point(232, 16));
	 lblURL.setTabIndex(0);
	 lblURL.setTabStop(false);
	 lblURL.setText("");

	 grpLogo.setLocation(new Point(8, 104));
	 grpLogo.setSize(new Point(480, 144));
	 grpLogo.setTabIndex(4);
	 grpLogo.setTabStop(false);
	 grpLogo.setText("");

	 cmdUninstall.setFont(new Font("MS Sans Serif", 8.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
	 cmdUninstall.setLocation(new Point(304, 328));
	 cmdUninstall.setSize(new Point(87, 20));
	 cmdUninstall.setTabIndex(2);
	 cmdUninstall.setText("&Uninstall");
	 cmdUninstall.addOnClick(new EventHandler(this.cmdUninstall_click));

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

	 panel2.setBackColor(new Color(224, 224, 224));
	 panel2.setLocation(new Point(1, 8));
	 panel2.setSize(new Point(240, 134));
	 panel2.setTabIndex(0);
	 panel2.setText("panel1");
	 panel2.setBorderStyle(BorderStyle.FIXED_3D);

	 cmdCancel.setLocation(new Point(400, 328));
	 cmdCancel.setSize(new Point(87, 20));
	 cmdCancel.setTabIndex(5);
	 cmdCancel.setText("&Cancel");
	 cmdCancel.addOnClick(new EventHandler(this.cmdCancel_click));

	 lblInfo.setBackColor(Color.ACTIVEBORDER);
	 lblInfo.setFont(new Font("Arial", 10.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
	 lblInfo.setLocation(new Point(8, 328));
	 lblInfo.setSize(new Point(288, 16));
	 lblInfo.setTabIndex(1);
	 lblInfo.setTabStop(false);
	 lblInfo.setText("");

	 lblContact.setFont(new Font("Courier New", 9.0f, FontSize.POINTS, FontWeight.NORMAL, false, true, false));
	 lblContact.setLocation(new Point(0, 96));
	 lblContact.setSize(new Point(232, 16));
	 lblContact.setTabIndex(1);
	 lblContact.setTabStop(false);
	 lblContact.setText("");
	 lblContact.addOnClick(new EventHandler(this.lblContact_click));

	 panel1.setBackColor(new Color(224, 224, 224));
	 panel1.setLocation(new Point(8, 8));
	 panel1.setSize(new Point(480, 88));
	 panel1.setTabIndex(7);
	 panel1.setText("panel1");
	 panel1.setBorderStyle(BorderStyle.FIXED_SINGLE);

	 progressBar.setLocation(new Point(8, 256));
	 progressBar.setSize(new Point(480, 16));
	 progressBar.setTabIndex(0);
	 progressBar.setText("progressBar1");
	 progressBar.setStep(20);
	 progressBar.setMaximum(120);

	 lblPackageName.setFont(new Font("Courier New", 9.0f, FontSize.POINTS, FontWeight.BOLD, false, false, false, CharacterSet.DEFAULT, 0));
	 lblPackageName.setSize(new Point(240, 16));
	 lblPackageName.setTabIndex(3);
	 lblPackageName.setTabStop(false);
	 lblPackageName.setText("");
	 lblPackageName.setTextAlign(HorizontalAlignment.CENTER);

	 lblCompany.setFont(new Font("Courier New", 9.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
	 lblCompany.setLocation(new Point(0, 80));
	 lblCompany.setSize(new Point(232, 16));
	 lblCompany.setTabIndex(2);
	 lblCompany.setTabStop(false);
	 lblCompany.setText("");

	 picLogo.setLocation(new Point(392, 8));
	 picLogo.setSize(new Point(80, 70));
	 picLogo.setTabIndex(0);
	 picLogo.setTabStop(false);
	 picLogo.setText("pictureBox1");
	 picLogo.setImage((Bitmap)resources.getObject("picLogo_image"));
	 picLogo.setSizeMode(PictureBoxSizeMode.AUTO_SIZE);

	 this.setNewControls(new Control[] {
						 panel1, 
						 progressBar, 
						 grpLogo, 
						 grpLabel, 
						 label2, 
						 lblInfo, 
						 cmdCancel, 
						 cmdUninstall});
	 grpLogo.setNewControls(new Control[] {
							panel2});
	 panel2.setNewControls(new Control[] {
						   lblPackageName, 
						   lblCompany, 
						   lblContact, 
						   lblURL});
	 panel1.setNewControls(new Control[] {
						   picLogo});
 }
	public static void main(String args[]) {
		Application.run(new jRemove());
	}
}

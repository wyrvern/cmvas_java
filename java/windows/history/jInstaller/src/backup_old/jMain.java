/*
 *   jMain. ide class for jInstaller.
 *   Description  : jInstaller ide class.
 *   Dependencies : JAVA VM 1.2+
 *   Platform     : any.
 *   Version      : 1.0.*
 *   Credit       : this()
 *   Revised      : 18/10/2001:18:50:00:GMT+2
 *   Copyright (C) 2001
 *
 *  To contact the author email: null@null.co.za
 *  Todo :
 *  - /null
*/

import com.ms.wfc.app.*;
import com.ms.wfc.core.*;
import com.ms.wfc.ui.*;
import com.ms.wfc.html.*;

public class jMain extends Form {

// public values

 private int    debugState        = 0;

// error codes

 private int  FATAL_EXCEPTION     = 0; 
 private int  SYSTEM_EXCEPTION    = 1;
 private int  LINK_EXCEPTION      = 2;
 private int  IO_EXCEPTION        = 3;
 private int  LIB_EXCEPTION       = 4;
 private int  LOAD_EXCEPTION      = 5;
 private int  MAIL_EXCEPTION      = 6;

// local initilizers

 private cMain   cm         = new cMain();
 private String  Version    = null;
 private int     appStatus  = -1;

  public jMain() throws Exception {
       super();
       jStart();
       jSetDefaults();
       jDebug();
   }

  public void jStart() throws Exception {
     try {     
        if (cm.checkVersion()          == -1  || 
           cm.setHeader().equalsIgnoreCase(null)) {
           Application.exit();
           throw new Exception();
        }else
           Version = cm.setHeader();
           initForm();
     }catch(Exception e){
        cm.errHandler(LOAD_EXCEPTION, "jStart()", e.toString());
        return;  
     }
  }

  public int jSetDefaults() {
     try {   
        this.setText           (Version);
        cm.appDir               = cm.setSlash(Application.getStartupPath());
        cm.packageFldr          = cm.setSlash(cm.packageFldr);
        txtSystem.setText      (cm.sysDir     = cm.setSlash(cm.sysDir));
        txtPrograms.setText    (cm.programDir = cm.setSlash(cm.programDir));
        txtDesktop.setText     (cm.desktopDir = cm.setSlash(cm.desktopDir));
        txtSetupDir.setText    (cm.installDir = cm.setSlash(cm.installDir)); 
          chkSetup.addItem("Create Folders", 0);
          chkSetup.addItem("Copy Files", 0);
          chkSetup.addItem("Create Shortcuts", 0);
          chkSetup.addItem("Modify Registry", 0);
          chkSetup.addItem("Complete", 0);
            lblPackageHeader.setText("Installation Package Name");
            lblPackageName.setText  (cm.packageName);
            lblContact.setText      (cm.productSupport);
        return 0;
     }catch(Exception e){
        cm.errHandler(LOAD_EXCEPTION, "jStart()", e.toString());
     }
        return -1;
  }

  public void jDebug() {
     try {   
       cm.createDirs();
       cm.copyFiles (cm.installDir);
       System.exit(-1);
       return;
/**
    System.out.println(ioLocation(IO_WRITE_LOCATION, "this.txt", "this message"));
    System.out.println(ioLocation(IO_READ_LOCATION,  "this.txt", null));

    regModifier("create", "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\" + packageName, new String[] { "DisplayName;" + packageName,"UninstallString;C:\\temp\\setup\\jInstaller.exe /u" });

    HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ACDSee
    regModifier("create", "SOFTWARE\\SteveG\\QSMT", new String[] { "UserCode;QSMT076B1F","UserName;0766CE4ED13A46BDB6C8462D31382E414D4BD2352D20057AEF0172948BE16ECF4235394EB5DF619691999A9397F81879F2191B0E007DE02150B2A5DB4AD056C353" });
    regModifier("delete", "SOFTWARE\\SteveG\\", new String[] { "UserCode;QSMT076B1F","UserName;0766CE4ED13A46BDB6C8462D31382E414D4BD2352D20057AEF0172948BE16ECF4235394EB5DF619691999A9397F81879F2191B0E007DE02150B2A5DB4AD056C353" });
    objRegister("C:\\win32_code\\src\\java\\ide\\installer\\lib\\smtpsvg.dll",
                 DLL_UNREGISTER);
    infoBox("Folder selection", "You have chosen no installation folder\nDefault used.");
**/

     }catch(Exception e){
        cm.errHandler(LOAD_EXCEPTION, "jDebug()", e.toString());
     }
  }

  public void dispose() {
     super.dispose();
     components.dispose();
  }

  private void cmdNext_click(Object source, Event e) { 
  }

  private void cmdBrowse_click(Object source, Event e) {
     cm.objPath = cm.dialogOpen("Please choose installtion folder :");
     if (cm.objPath != null) {
        txtSetupDir.setText(cm.objPath);
     }
  }

	private void cmdUninstall_click(Object source, Event e)
	{
		
	}

	private void cmdCancel_click(Object source, Event e) {
		Application.exit();
	}

	private void lblContact_click(Object source, Event e) {
	    cm.openMailer(6, "isotop TimeSaver Demo : product Contact", "");
	}

	Container components = new Container();
	Button cmdNext = new Button();
	Button cmdCancel = new Button();
	Button cmdUninstall = new Button();
	Button cmdBrowse = new Button();
	Edit txtSetupDir = new Edit();
	Panel panel1 = new Panel();
	Edit txtDesktop = new Edit();
	Edit txtPrograms = new Edit();
	Edit txtSystem = new Edit();
	Label label1 = new Label();
	Label label2 = new Label();
	Label label3 = new Label();
	Label label4 = new Label();
	PictureBox picLogo = new PictureBox();
	CheckedListBox chkSetup = new CheckedListBox();
	Label lblPackageName = new Label();
	GroupBox grpLogo = new GroupBox();
	Label lblPackageHeader = new Label();
	ProgressBar progressBar = new ProgressBar();
	Label lblContact = new Label();

	private void initForm()
	{
		// NOTE:  This form is storing resource information in an
		// external file.  Do not modify the string parameter to any
		// resources.getObject() function call. For example, do not
		// modify "foo1_location" in the following line of code
		// even if the name of the Foo object changes: 
		//   foo1.setLocation((Point)resources.getObject("foo1_location"));

		IResourceManager resources = new ResourceManager(this, "iMain");
		this.setText("jInstaller");
		this.setAutoScale(false);
		this.setAutoScaleBaseSize(new Point(5, 13));
		this.setClientSize(new Point(496, 353));
		this.setIcon((Icon)resources.getObject("this_icon"));
		this.setMaximizeBox(false);
		this.setStartPosition(FormStartPosition.CENTER_SCREEN);

		cmdNext.setFont(new Font("MS Sans Serif", 8.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
		cmdNext.setLocation(new Point(296, 328));
		cmdNext.setSize(new Point(87, 20));
		cmdNext.setTabIndex(7);
		cmdNext.setText("&Next >");
		cmdNext.addOnClick(new EventHandler(this.cmdNext_click));

		cmdCancel.setFont(new Font("MS Sans Serif", 8.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
		cmdCancel.setLocation(new Point(392, 328));
		cmdCancel.setSize(new Point(87, 20));
		cmdCancel.setTabIndex(4);
		cmdCancel.setText("Cancel");
		cmdCancel.addOnClick(new EventHandler(this.cmdCancel_click));

		cmdUninstall.setFont(new Font("MS Sans Serif", 8.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
		cmdUninstall.setLocation(new Point(8, 328));
		cmdUninstall.setSize(new Point(87, 20));
		cmdUninstall.setTabIndex(5);
		cmdUninstall.setText("Uninstall");
		cmdUninstall.addOnClick(new EventHandler(this.cmdUninstall_click));

		cmdBrowse.setFont(new Font("MS Sans Serif", 8.0f, FontSize.POINTS, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
		cmdBrowse.setLocation(new Point(400, 224));
		cmdBrowse.setSize(new Point(87, 20));
		cmdBrowse.setTabIndex(6);
		cmdBrowse.setText("&Browse");
		cmdBrowse.addOnClick(new EventHandler(this.cmdBrowse_click));

		txtSetupDir.setLocation(new Point(160, 224));
		txtSetupDir.setSize(new Point(232, 20));
		txtSetupDir.setTabIndex(11);
		txtSetupDir.setText("");

		panel1.setBackColor(Color.ACTIVECAPTIONTEXT);
		panel1.setLocation(new Point(2, 104));
		panel1.setSize(new Point(496, 216));
		panel1.setTabIndex(12);
		panel1.setText("panel1");

		txtDesktop.setLocation(new Point(160, 248));
		txtDesktop.setSize(new Point(232, 20));
		txtDesktop.setTabIndex(10);
		txtDesktop.setText("");

		txtPrograms.setLocation(new Point(160, 272));
		txtPrograms.setSize(new Point(232, 20));
		txtPrograms.setTabIndex(9);
		txtPrograms.setText("");

		txtSystem.setLocation(new Point(160, 296));
		txtSystem.setSize(new Point(232, 20));
		txtSystem.setTabIndex(8);
		txtSystem.setText("");

		label1.setBackColor(Color.ACTIVECAPTIONTEXT);
		label1.setFont(new Font("MS Shell Dlg", 11.0f, FontSize.CHARACTERHEIGHT, FontWeight.SEMIBOLD, false, false, false, CharacterSet.DEFAULT, 0));
		label1.setLocation(new Point(8, 296));
		label1.setSize(new Point(144, 16));
		label1.setTabIndex(0);
		label1.setTabStop(false);
		label1.setText("System Directory :");

		label2.setBackColor(Color.ACTIVECAPTIONTEXT);
		label2.setFont(new Font("MS Shell Dlg", 11.0f, FontSize.CHARACTERHEIGHT, FontWeight.SEMIBOLD, false, false, false, CharacterSet.DEFAULT, 0));
		label2.setLocation(new Point(8, 272));
		label2.setSize(new Point(144, 16));
		label2.setTabIndex(1);
		label2.setTabStop(false);
		label2.setText("Programs Directory :");

		label3.setBackColor(Color.ACTIVECAPTIONTEXT);
		label3.setFont(new Font("MS Shell Dlg", 11.0f, FontSize.CHARACTERHEIGHT, FontWeight.SEMIBOLD, false, false, false, CharacterSet.DEFAULT, 0));
		label3.setLocation(new Point(8, 248));
		label3.setSize(new Point(144, 16));
		label3.setTabIndex(2);
		label3.setTabStop(false);
		label3.setText("Desktop Directory :");

		label4.setBackColor(Color.ACTIVECAPTIONTEXT);
		label4.setFont(new Font("MS Shell Dlg", 11.0f, FontSize.CHARACTERHEIGHT, FontWeight.SEMIBOLD, false, false, false, CharacterSet.DEFAULT, 0));
		label4.setLocation(new Point(8, 224));
		label4.setSize(new Point(144, 16));
		label4.setTabIndex(3);
		label4.setTabStop(false);
		label4.setText("Installation Directory :");

		picLogo.setLocation(new Point(400, 16));
		picLogo.setSize(new Point(80, 70));
		picLogo.setTabIndex(13);
		picLogo.setTabStop(false);
		picLogo.setText("pictureBox1");
		picLogo.setImage((Bitmap)resources.getObject("picLogo_image"));
		picLogo.setSizeMode(PictureBoxSizeMode.AUTO_SIZE);

		chkSetup.setLocation(new Point(8, 8));
		chkSetup.setSize(new Point(480, 84));
		chkSetup.setTabIndex(0);
		chkSetup.setText("checkedListBox1");
		chkSetup.setIntegralHeight(true);
		chkSetup.setItems(new Object[] {});

		lblPackageName.setBackColor(Color.CONTROL);
		lblPackageName.setFont(new Font("Microsoft Sans Serif", 8.0f, FontSize.POINTS, FontWeight.BOLD, false, false, false, CharacterSet.DEFAULT, 0));
		lblPackageName.setForeColor(new Color(0, 0, 192));
		lblPackageName.setLocation(new Point(8, 31));
		lblPackageName.setSize(new Point(192, 56));
		lblPackageName.setTabIndex(2);
		lblPackageName.setTabStop(false);
		lblPackageName.setText("");
		lblPackageName.setBorderStyle(BorderStyle.FIXED_SINGLE);
		lblPackageName.setTextAlign(HorizontalAlignment.CENTER);

		grpLogo.setLocation(new Point(8, 0));
		grpLogo.setSize(new Point(480, 96));
		grpLogo.setTabIndex(14);
		grpLogo.setTabStop(false);
		grpLogo.setText("");

		lblPackageHeader.setBackColor(Color.GRAY);
		lblPackageHeader.setFont(new Font("Microsoft Sans Serif", 8.0f, FontSize.POINTS, FontWeight.BOLD, false, false, false, CharacterSet.DEFAULT, 0));
		lblPackageHeader.setForeColor(Color.WHITE);
		lblPackageHeader.setLocation(new Point(8, 16));
		lblPackageHeader.setSize(new Point(192, 16));
		lblPackageHeader.setTabIndex(1);
		lblPackageHeader.setTabStop(false);
		lblPackageHeader.setText("");
		lblPackageHeader.setBorderStyle(BorderStyle.FIXED_SINGLE);
		lblPackageHeader.setTextAlign(HorizontalAlignment.CENTER);

		progressBar.setLocation(new Point(8, 96));
		progressBar.setSize(new Point(480, 16));
		progressBar.setTabIndex(1);
		progressBar.setText("progressBar1");

		lblContact.setBackColor(Color.LIGHTGRAY);
		lblContact.setCursor(Cursor.HELP);
		lblContact.setFont(new Font("Microsoft Sans Serif", 8.0f, FontSize.POINTS, FontWeight.BOLD, false, true, false));
		lblContact.setForeColor(new Color(0, 0, 192));
		lblContact.setLocation(new Point(16, 48));
		lblContact.setSize(new Point(176, 16));
		lblContact.setTabIndex(0);
		lblContact.setTabStop(false);
		lblContact.setText("");
		lblContact.setTextAlign(HorizontalAlignment.CENTER);
		lblContact.addOnClick(new EventHandler(this.lblContact_click));

		this.setNewControls(new Control[] {
							picLogo, 
							cmdBrowse, 
							cmdUninstall, 
							label4, 
							label3, 
							label2, 
							label1, 
							txtSystem, 
							txtPrograms, 
							txtDesktop, 
							txtSetupDir, 
							cmdCancel, 
							cmdNext, 
							panel1, 
							grpLogo});
		panel1.setNewControls(new Control[] {
							  progressBar, 
							  chkSetup});
		grpLogo.setNewControls(new Control[] {
							   lblContact, 
							   lblPackageName, 
							   lblPackageHeader});
	}

  public static void main(String args[]) {
    try {
      if (args.length > 0) {
      }

      Application.run(new jMain());
      }catch(Exception e){
      return;
    }
   
  }
}

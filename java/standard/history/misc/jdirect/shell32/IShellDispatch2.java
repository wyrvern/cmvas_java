//
// Auto-generated using JActiveX.EXE 5.00.3601
//   (jactivex /X:m- -d . shell32.dll)
//
// WARNING: Do not remove the comments that include "@com" directives.
// This source file must be compiled by a @com-aware compiler.
// If you are using the Microsoft Visual J++ compiler, you must use
// version 1.02.3920 or later. Previous versions will not issue an error
// but will not generate COM-enabled class files.
//

package shell32;

import com.ms.com.*;
import com.ms.com.IUnknown;
import com.ms.com.Variant;

// Dual interface IShellDispatch2
/** @com.interface(iid=A4C6892C-3BA9-11D2-9DEA-00C04FB16162, thread=NO, type=DUAL) */
public interface IShellDispatch2 extends shell32.IShellDispatch
{
  /** @com.method(vtoffset=4, dispid=1610743808, type=PROPGET, name="Application", addFlagsVtable=4)
      @com.parameters([iid=00020400-0000-0000-C000-000000000046,thread=NO,type=DISPATCH] return) */
  public java.lang.Object getApplication();

  /** @com.method(vtoffset=5, dispid=1610743809, type=PROPGET, name="Parent", addFlagsVtable=4)
      @com.parameters([iid=00020400-0000-0000-C000-000000000046,thread=NO,type=DISPATCH] return) */
  public java.lang.Object getParent();

  /** @com.method(vtoffset=6, dispid=1610743810, type=METHOD, name="NameSpace", addFlagsVtable=4)
      @com.parameters([in,type=VARIANT] vDir, [iid=BBCBDE60-C3FF-11CE-8350-444553540000,thread=NO,type=DISPATCH] return) */
  public shell32.Folder NameSpace(com.ms.com.Variant vDir);

  /** @com.method(vtoffset=7, dispid=1610743811, type=METHOD, name="BrowseForFolder", addFlagsVtable=4)
      @com.parameters([in,type=I4] Hwnd, [in,type=STRING] Title, [in,type=I4] Options, [in,type=VARIANT] RootFolder, [iid=BBCBDE60-C3FF-11CE-8350-444553540000,thread=NO,type=DISPATCH] return) */
  public shell32.Folder BrowseForFolder(int Hwnd, java.lang.String Title, int Options, com.ms.com.Variant RootFolder);

  /** @com.method(vtoffset=8, dispid=1610743812, type=METHOD, name="Windows", addFlagsVtable=4)
      @com.parameters([iid=00020400-0000-0000-C000-000000000046,thread=NO,type=DISPATCH] return) */
  public java.lang.Object Windows();

  /** @com.method(vtoffset=9, dispid=1610743813, type=METHOD, name="Open", addFlagsVtable=4)
      @com.parameters([in,type=VARIANT] vDir) */
  public void Open(com.ms.com.Variant vDir);

  /** @com.method(vtoffset=10, dispid=1610743814, type=METHOD, name="Explore", addFlagsVtable=4)
      @com.parameters([in,type=VARIANT] vDir) */
  public void Explore(com.ms.com.Variant vDir);

  /** @com.method(vtoffset=11, dispid=1610743815, type=METHOD, name="MinimizeAll", addFlagsVtable=4)
      @com.parameters() */
  public void MinimizeAll();

  /** @com.method(vtoffset=12, dispid=1610743816, type=METHOD, name="UndoMinimizeALL", addFlagsVtable=4)
      @com.parameters() */
  public void UndoMinimizeALL();

  /** @com.method(vtoffset=13, dispid=1610743817, type=METHOD, name="FileRun", addFlagsVtable=4)
      @com.parameters() */
  public void FileRun();

  /** @com.method(vtoffset=14, dispid=1610743818, type=METHOD, name="CascadeWindows", addFlagsVtable=4)
      @com.parameters() */
  public void CascadeWindows();

  /** @com.method(vtoffset=15, dispid=1610743819, type=METHOD, name="TileVertically", addFlagsVtable=4)
      @com.parameters() */
  public void TileVertically();

  /** @com.method(vtoffset=16, dispid=1610743820, type=METHOD, name="TileHorizontally", addFlagsVtable=4)
      @com.parameters() */
  public void TileHorizontally();

  /** @com.method(vtoffset=17, dispid=1610743821, type=METHOD, name="ShutdownWindows", addFlagsVtable=4)
      @com.parameters() */
  public void ShutdownWindows();

  /** @com.method(vtoffset=18, dispid=1610743822, type=METHOD, name="Suspend", addFlagsVtable=4)
      @com.parameters() */
  public void Suspend();

  /** @com.method(vtoffset=19, dispid=1610743823, type=METHOD, name="EjectPC", addFlagsVtable=4)
      @com.parameters() */
  public void EjectPC();

  /** @com.method(vtoffset=20, dispid=1610743824, type=METHOD, name="SetTime", addFlagsVtable=4)
      @com.parameters() */
  public void SetTime();

  /** @com.method(vtoffset=21, dispid=1610743825, type=METHOD, name="TrayProperties", addFlagsVtable=4)
      @com.parameters() */
  public void TrayProperties();

  /** @com.method(vtoffset=22, dispid=1610743826, type=METHOD, name="Help", addFlagsVtable=4)
      @com.parameters() */
  public void Help();

  /** @com.method(vtoffset=23, dispid=1610743827, type=METHOD, name="FindFiles", addFlagsVtable=4)
      @com.parameters() */
  public void FindFiles();

  /** @com.method(vtoffset=24, dispid=1610743828, type=METHOD, name="FindComputer", addFlagsVtable=4)
      @com.parameters() */
  public void FindComputer();

  /** @com.method(vtoffset=25, dispid=1610743829, type=METHOD, name="RefreshMenu", addFlagsVtable=4)
      @com.parameters() */
  public void RefreshMenu();

  /** @com.method(vtoffset=26, dispid=1610743830, type=METHOD, name="ControlPanelItem", addFlagsVtable=4)
      @com.parameters([in,type=STRING] szDir) */
  public void ControlPanelItem(java.lang.String szDir);

  /** @com.method(vtoffset=27, dispid=1610809344, type=METHOD, name="IsRestricted", addFlagsVtable=4)
      @com.parameters([in,type=STRING] Group, [in,type=STRING] Restriction, [type=I4] return) */
  public int IsRestricted(java.lang.String Group, java.lang.String Restriction);

  /** @com.method(vtoffset=28, dispid=1610809345, type=METHOD, name="ShellExecute", addFlagsVtable=4)
      @com.parameters([in,type=STRING] File, [in,type=VARIANT] vArgs, [in,type=VARIANT] vDir, [in,type=VARIANT] vOperation, [in,type=VARIANT] vShow) */
  public void ShellExecute(java.lang.String File, com.ms.com.Variant vArgs, com.ms.com.Variant vDir, com.ms.com.Variant vOperation, com.ms.com.Variant vShow);

  /** @com.method(vtoffset=29, dispid=1610809346, type=METHOD, name="FindPrinter", addFlagsVtable=4)
      @com.parameters([in,type=STRING] Name, [in,type=STRING] location, [in,type=STRING] model) */
  public void FindPrinter(java.lang.String Name, java.lang.String location, java.lang.String model);

  /** @com.method(vtoffset=30, dispid=1610809347, type=METHOD, name="GetSystemInformation", addFlagsVtable=4)
      @com.parameters([in,type=STRING] Name, [type=VARIANT] return) */
  public com.ms.com.Variant GetSystemInformation(java.lang.String Name);

  /** @com.method(vtoffset=31, dispid=1610809348, type=METHOD, name="ServiceStart", addFlagsVtable=4)
      @com.parameters([in,type=STRING] ServiceName, [in,type=VARIANT] Persistent, [type=VARIANT] return) */
  public com.ms.com.Variant ServiceStart(java.lang.String ServiceName, com.ms.com.Variant Persistent);

  /** @com.method(vtoffset=32, dispid=1610809349, type=METHOD, name="ServiceStop", addFlagsVtable=4)
      @com.parameters([in,type=STRING] ServiceName, [in,type=VARIANT] Persistent, [type=VARIANT] return) */
  public com.ms.com.Variant ServiceStop(java.lang.String ServiceName, com.ms.com.Variant Persistent);

  /** @com.method(vtoffset=33, dispid=1610809350, type=METHOD, name="IsServiceRunning", addFlagsVtable=4)
      @com.parameters([in,type=STRING] ServiceName, [type=VARIANT] return) */
  public com.ms.com.Variant IsServiceRunning(java.lang.String ServiceName);

  /** @com.method(vtoffset=34, dispid=1610809351, type=METHOD, name="CanStartStopService", addFlagsVtable=4)
      @com.parameters([in,type=STRING] ServiceName, [type=VARIANT] return) */
  public com.ms.com.Variant CanStartStopService(java.lang.String ServiceName);

  /** @com.method(vtoffset=35, dispid=1610809352, type=METHOD, name="ShowBrowserBar", addFlagsVtable=4)
      @com.parameters([in,type=STRING] bstrClsid, [in,type=VARIANT] bShow, [type=VARIANT] return) */
  public com.ms.com.Variant ShowBrowserBar(java.lang.String bstrClsid, com.ms.com.Variant bShow);


  public static final com.ms.com._Guid iid = new com.ms.com._Guid((int)0xa4c6892c, (short)0x3ba9, (short)0x11d2, (byte)0x9d, (byte)0xea, (byte)0x0, (byte)0xc0, (byte)0x4f, (byte)0xb1, (byte)0x61, (byte)0x62);
}

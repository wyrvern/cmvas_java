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

// Dual interface IShellDispatch
/** @com.interface(iid=D8F015C0-C278-11CE-A49E-444553540000, thread=NO, type=DUAL) */
public interface IShellDispatch extends com.ms.com.IUnknown
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


  public static final com.ms.com._Guid iid = new com.ms.com._Guid((int)0xd8f015c0, (short)0xc278, (short)0x11ce, (byte)0xa4, (byte)0x9e, (byte)0x44, (byte)0x45, (byte)0x53, (byte)0x54, (byte)0x0, (byte)0x0);
}

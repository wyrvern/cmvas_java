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

/** @com.class(classid=13709620-C279-11CE-A49E-444553540000,DynamicCasts) */
public class Shell implements com.ms.com.IUnknown,com.ms.com.NoAutoScripting,shell32.IShellDispatch
{
  /** @com.method()
      @hidden */
  public native java.lang.Object getApplication();

  /** @com.method()
      @hidden */
  public native java.lang.Object getParent();

  /** @com.method()
      @hidden */
  public native shell32.Folder NameSpace(com.ms.com.Variant vDir);

  /** @com.method()
      @hidden */
  public native shell32.Folder BrowseForFolder(int Hwnd, java.lang.String Title, int Options, com.ms.com.Variant RootFolder);

  /** @com.method()
      @hidden */
  public native java.lang.Object Windows();

  /** @com.method()
      @hidden */
  public native void Open(com.ms.com.Variant vDir);

  /** @com.method()
      @hidden */
  public native void Explore(com.ms.com.Variant vDir);

  /** @com.method()
      @hidden */
  public native void MinimizeAll();

  /** @com.method()
      @hidden */
  public native void UndoMinimizeALL();

  /** @com.method()
      @hidden */
  public native void FileRun();

  /** @com.method()
      @hidden */
  public native void CascadeWindows();

  /** @com.method()
      @hidden */
  public native void TileVertically();

  /** @com.method()
      @hidden */
  public native void TileHorizontally();

  /** @com.method()
      @hidden */
  public native void ShutdownWindows();

  /** @com.method()
      @hidden */
  public native void Suspend();

  /** @com.method()
      @hidden */
  public native void EjectPC();

  /** @com.method()
      @hidden */
  public native void SetTime();

  /** @com.method()
      @hidden */
  public native void TrayProperties();

  /** @com.method()
      @hidden */
  public native void Help();

  /** @com.method()
      @hidden */
  public native void FindFiles();

  /** @com.method()
      @hidden */
  public native void FindComputer();

  /** @com.method()
      @hidden */
  public native void RefreshMenu();

  /** @com.method()
      @hidden */
  public native void ControlPanelItem(java.lang.String szDir);


  public static final com.ms.com._Guid clsid = new com.ms.com._Guid((int)0x13709620, (short)0xc279, (short)0x11ce, (byte)0xa4, (byte)0x9e, (byte)0x44, (byte)0x45, (byte)0x53, (byte)0x54, (byte)0x0, (byte)0x0);
}

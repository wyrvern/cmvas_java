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

/** @com.class(classid=1820FED0-473E-11D0-A96C-00C04FD705A2,DynamicCasts) */
public class WebViewFolderContents implements com.ms.com.IUnknown,com.ms.com.NoAutoScripting,shell32.IShellFolderViewDual
{
  /** @com.method()
      @hidden */
  public native java.lang.Object getApplication();

  /** @com.method()
      @hidden */
  public native java.lang.Object getParent();

  /** @com.method()
      @hidden */
  public native shell32.Folder getFolder();

  /** @com.method()
      @hidden */
  public native shell32.FolderItems SelectedItems();

  /** @com.method()
      @hidden */
  public native shell32.FolderItem getFocusedItem();

  /** @com.method()
      @hidden */
  public native void SelectItem(com.ms.com.Variant pvfi, int dwFlags);

  /** @com.method()
      @hidden */
  public native java.lang.String PopupItemMenu(shell32.FolderItem pfi, com.ms.com.Variant vx, com.ms.com.Variant vy);

  /** @com.method()
      @hidden */
  public native java.lang.Object getScript();

  /** @com.method()
      @hidden */
  public native int getViewOptions();


  public static final com.ms.com._Guid clsid = new com.ms.com._Guid((int)0x1820fed0, (short)0x473e, (short)0x11d0, (byte)0xa9, (byte)0x6c, (byte)0x0, (byte)0xc0, (byte)0x4f, (byte)0xd7, (byte)0x5, (byte)0xa2);
}

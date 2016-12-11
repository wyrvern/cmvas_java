//
// Auto-generated using JActiveX.EXE 5.00.3601
//   (jactivex /javatlb /X:m- -d . shelllnk.tlb)
//
// WARNING: Do not remove the comments that include "@com" directives.
// This source file must be compiled by a @com-aware compiler.
// If you are using the Microsoft Visual J++ compiler, you must use
// version 1.02.3920 or later. Previous versions will not issue an error
// but will not generate COM-enabled class files.
//

package shelllnk;

import com.ms.com.*;
import com.ms.com.IUnknown;
import com.ms.com.Variant;

/** @com.struct(noAutoOffset) */
public final class WIN32_FIND_DATA
{
  /** @com.structmap([offset=0,type=I4] dwFileAttributes) */
  public int dwFileAttributes;

  /** @com.structmap([offset=4] ftCreationTime) */
  public shelllnk.FILETIME ftCreationTime;

  /** @com.structmap([offset=12] ftLastAccessTime) */
  public shelllnk.FILETIME ftLastAccessTime;

  /** @com.structmap([offset=20] ftLastWriteTime) */
  public shelllnk.FILETIME ftLastWriteTime;

  /** @com.structmap([offset=28,type=I4] nFileSizeHigh) */
  public int nFileSizeHigh;

  /** @com.structmap([offset=32,type=I4] nFileSizeLow) */
  public int nFileSizeLow;

  /** @com.structmap([offset=36,type=I4] dwReserved0) */
  public int dwReserved0;

  /** @com.structmap([offset=40,type=I4] dwReserved1) */
  public int dwReserved1;

  /** @com.structmap([offset=44,size=255,type=FIXEDARRAY] cFileName) */
  public byte[] cFileName;

  /** @com.structmap([offset=299,size=14,type=FIXEDARRAY] cAlternate) */
  public byte[] cAlternate;

}

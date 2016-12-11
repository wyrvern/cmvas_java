package lib.libshell;

import com.ms.com.*;
import com.ms.com.IUnknown;
import com.ms.com.Variant;

/** @com.struct(noAutoOffset) */
public final class WIN32_FIND_DATA
{
  /** @com.structmap([offset=0,type=I4] dwFileAttributes) */
  public int dwFileAttributes;

  /** @com.structmap([offset=4] ftCreationTime) */
  public lib.libshell.FILETIME ftCreationTime;

  /** @com.structmap([offset=12] ftLastAccessTime) */
  public lib.libshell.FILETIME ftLastAccessTime;

  /** @com.structmap([offset=20] ftLastWriteTime) */
  public lib.libshell.FILETIME ftLastWriteTime;

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

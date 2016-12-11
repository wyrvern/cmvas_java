package lib.shellx;

import com.ms.dll.*;
import com.ms.com.*;
import com.ms.win32.*;

/** @dll.struct() */
public class OSVERSIONINFO
{
  public int      dwOSVersionInfoSize;
  public int      dwMajorVersion;
  public int      dwMinorVersion;
  public int      dwBuildNumber;
  public int      dwPlatformId;
/** @dll.structmap([type=TCHAR[128]]) */
  public String   szCSDVersion;
}

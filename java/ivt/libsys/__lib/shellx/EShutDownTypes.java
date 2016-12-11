package lib.shellx;

import com.ms.dll.*;
import com.ms.com.*;
import com.ms.win32.*;

public interface EShutDownTypes
{
     int EWX_LOGOFF        = 0,
         EWX_SHUTDOWN      = 1,
         EWX_REBOOT        = 2,
         EWX_FORCELOGOFF   = 4,
         EWX_FORCESHUTDOWN = 5,
         EWX_FORCEREBOOT   = 6,
         EWX_POWEROFF      = 8,
         EWX_FORCEIFHUNG   = 10; // NT5 only
}

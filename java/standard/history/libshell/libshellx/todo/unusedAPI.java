    /** @dll.import("advapi32", setLastError) */
      private native static boolean LookupPrivilegeValue(String lpSystemName, String lpName, lib.shellx.LUID lpLuid);

    /** @dll.import("kernel32", setLastError) */
      private native static boolean GetVersionEx(lib.shellx.OSVERSIONINFO lpVersionInfo);

    /** @dll.import("kernel32", setLastError) */
      private native static int FormatMessage(int dwFlags, com.ms.com.Variant lpSource, int dwMessageId, int dwLanguageId, StringBuffer lpBuffer, int nSize, int Arguments);

    /** @dll.import("kernel32", setLastError) */
      private native static boolean CloseHandle(int hObject);

    /** @dll.import("advapi32", setLastError) */
      private native static boolean GetTokenInformation(int TokenHandle, int TokenInformationClass, com.ms.com.Variant TokenInformation, int TokenInformationLength, int ReturnLength);

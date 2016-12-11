/*
 *   archiver. lib.jPacker.jUnpack() 
 *   Description  : Cabinet file extractor.
 *                : Entry point /closed.
 *   Dependencies : JAVA VM 1.2+
 *   Platform     : OS Independant.
 *   Version      : 1.0.2
 *   Credit       : this()
 *   Revised      : 29/10/2001:?:?:?:GMT+2
 *   Copyright (C) 2001
 *
 *   Author       : null@null.co.za
 *   Todo :
 *   - /null
*/

package lib.jPacker;

import com.ms.util.cab.CabDecoder;
import com.ms.util.cab.CabDecoderInterface;
import com.ms.util.cab.CabFileEntry;
import com.ms.util.cab.CabFolderEntry;
import com.ms.util.cab.CabException;
import java.io.*;
import java.util.Enumeration;
import java.util.Date;

import com.ms.wfc.ui.*;
import java.util.Properties;

final class jUnpack implements CabDecoderInterface {
    private String          cabinet_filename;
    private String          output_directory;
    private CabDecoder      cab_decoder;
    private FileInputStream input;

    private Properties      sysProp  = System.getProperties();
    private Date            dt       = new Date();
    private lib.strlib.strFactory ns = new lib.strlib.strFactory();

   //
   // package information
   //

    private String verPackage        = "1.0.a";

   //
   // publicly accessible values
   //

    private String sysDir            = null;
    private String osName            = null;
    private String appDir            = null;
    private String sPath             = null;
    private String desktopDir        = null;
    private String programDir        = null;
    private String installDir        = "C:\\Program Files\\bulkMail\\";
    private String OSVersion         = null;
    private String objPath           = null;
 
   //
   // package includes
   //

    private String packageName       = "jPacker";
    private String productSupport    = "debug@null.co.za";
    private String productCompany    = "Monolith";
    private String packageExe        = "jUnpack.exe";
    private String packageIco        = "jpacker.ico";

    private String packageSetLnk     = "Uninstall.lnk";
    private String uninstallIco      = "un.ico";
    private String packageLnk        = "jPacker.lnk";

   //
   // Error codes.
   //

    private static final int  FATAL_EXCEPTION     = 0;
    private static final int  SYSTEM_EXCEPTION    = 1;
    private static final int  LINK_EXCEPTION      = 2;
    private static final int  IO_EXCEPTION        = 3;
    private static final int  LIB_EXCEPTION       = 4;
    private static final int  LOAD_EXCEPTION      = 5;
    private static final int  MAIL_EXCEPTION      = 6;
    private static final int  INFO_EXCEPTION      = 7;
    private static final int  REGISTRY_EXCEPTION  = 8;
    private static final int  INSTALL_EXCEPTION   = 9;
    private static final int  UNINSTALL_EXCEPTION = 10;

    private String errHandler(int errNumber,
                              String errLocate,
                              String exType) {
    String strResult       = null;
    int    msgReturn       = 0;
      try {
          strResult =             "An error has occured with the following information :\n\n";
          strResult = strResult + "Error Code : "+errNumber+"\n";
          strResult = strResult + "System Dir : "+sysProp.getProperty("com.ms.sysdir")+"\n";
          strResult = strResult + "Location   : "+errLocate+"\n";
          strResult = strResult + "TimeStamp  : "+dt.toLocaleString()+"\n";
          strResult = strResult + "Exception  : "+exType;
          strResult = strResult + "\n\nDo you wish to send this information ";
          strResult = strResult + "to our support group?\n";

          msgReturn = MessageBox.show(strResult, "Installation error", MessageBox.YESNO + MessageBox.ICONERROR);
          openMailer(msgReturn, "jInstaller:[ERROR]:package:["+packageName+"]",ns.Mid(strResult, strResult.indexOf("Error Code"), strResult.indexOf("Do")-strResult.indexOf("Error Code")-2));
          if (errNumber == FATAL_EXCEPTION ||
              errNumber == LOAD_EXCEPTION) {
             System.exit(-1);
             return null;
          }
      }catch(Exception e){     
          errHandler(FATAL_EXCEPTION, "errHandler()", e.toString());
      }
          return null;
    }

    public int openMailer(int msgReturn,
                          String msgSubject,
                          String msgBody) {
      try {
         msgSubject = ns.Replace(msgSubject, " ", "%20", 0);
         msgBody    = ns.Replace(ns.asciiReplace(msgBody, 10, "%0A", 0), " ", "%20", 0);
         String mailto = "mailto:"  +productSupport+
                         "?subject="+msgSubject+
                         "&body="   +msgBody;
         if (msgReturn == DialogResult.YES) {
            Runtime gh = Runtime.getRuntime();
            gh.exec(mailto);
         }
      }catch(Exception e){     
          errHandler(MAIL_EXCEPTION, "openMailer()", e.toString());
      }
          return 0;
    }

    private jUnpack(String filename) {
        cabinet_filename    = filename;
    }

    /** 
    // Entrypoint
    // -- :disabled
    public static void main(String args[]) {
        jUnpack extractor;
        int     cab_filename_argnum;

        if (args.length < 1) {
            displayHelp();
        }else{
            String  cab_filename;
            String  specified_output_directory;
            boolean list_cabinet_only = false;

            if (args[0].equalsIgnoreCase("/V")) {
                if (args.length < 2) {
                    displayHelp();
                    return;
                }
                list_cabinet_only = true;
                cab_filename_argnum = 1;
            }else{
                cab_filename_argnum = 0;
            }

            cab_filename = args[cab_filename_argnum];

            if (args.length > cab_filename_argnum+1)
                specified_output_directory = args[cab_filename_argnum+1];
            else
                specified_output_directory = null;

            //
            // Need to create an object to pass to the CabDecoder class
            //
            extractor = new jUnpack(cab_filename);
            
            //
            // If cabinet opened successfully
            //
            if (extractor.openCabinetForReading() == true) {
                //
                // List cabinet contents, or extract, depending upon what
                // the user wanted
                //
                if (list_cabinet_only)
                    extractor.listCabinet();
                else
                    extractor.extractCabinet(specified_output_directory);                
                //
                // Clean up
                //
                extractor.closeCabinet();
            }
        }
    }
    //
    **/


    public InputStream openCabinet(String disk_name,
                                   String cabinet_name) {
        return null;
    }

    //
    // Open the cabinet
    //
    // Returns whether the cabinet was opened successfully
    //
    private boolean openCabinetForReading() {
        try {
            input = new FileInputStream(cabinet_filename);
        }catch (FileNotFoundException fnf) {
            System.out.println("Cabinet not found: "+cabinet_filename);
            return false;
        }

        //
        // If the cabinet header is corrupt, an exception will be thrown
        //
        try {
            cab_decoder = new CabDecoder(input, this);
        }catch (Exception e) {
            System.out.println("Error processing cabinet: "+e.getMessage());
            try { input.close(); } catch (IOException closing_ioe) {}
            return false;
        }
        return true; // success
    }

    //
    // Close the cabinet's input stream
    //
    private void closeCabinet() {
        try {
            input.close();
        }catch (IOException ioe) {
            System.out.println("IOException closing cabinet: "+ioe.getMessage());
        }
    }

    //
    // List the contents of the cabinet
    //
    private void listCabinet() {
        //
        // Assume an 80 column display
        //
        System.out.println();
        System.out.println("Listing files in cabinet '"+cabinet_filename+"':");
        System.out.println();
        System.out.println("File name                                 File size  Attr  File date");
        System.out.println("----------------------------------------  ---------  ----  -----------------");

        //
        // Enumerate the complete contents of the cabinet, including CabFolderEntry
        // objects
        //
        Enumeration cab_contents = cab_decoder.entries(true);

        while (cab_contents.hasMoreElements()) {
            Object entry;            
            entry = cab_contents.nextElement();

            if (entry instanceof CabFolderEntry) {
                CabFolderEntry folder = (CabFolderEntry) entry;

                System.out.println();
                System.out.println(
                    "FOLDER (" + folder.compressionToString() + " compression):"
                );
            }
            else if (entry instanceof CabFileEntry) {
                CabFileEntry file = (CabFileEntry) entry;

                //
                // Display file information in tabulated form.
                //
                // Use locale-specific date format
                //
                System.out.println(
                    StringPad.padPostfix(file.getName(),42) +
                    StringPad.padNumber(file.getSize(), 9) + "  " +
                    cabFileEntryAttributesToString(file) + "  " + 
                    file.getDate().toLocaleString()
                );
            }
            // ignore objects we don't know how to handle
        }
    }


    //
    // Extract the cabinet
    //
    private void extractCabinet(String new_output_directory) {
        output_directory = new_output_directory;

        System.out.println();
        System.out.println("Extracting files from cabinet '"+cabinet_filename+"':");

        //
        // If an error occurs, an exception will be thrown
        //
        try {
            cab_decoder.extract();
        }catch (Exception e) {
            System.out.println("Error extracting cabinet: "+e.getMessage());
        }
    }


    //
    // Convert file attributes to a string
    //
    private static String cabFileEntryAttributesToString(CabFileEntry cffile) {
        return  (cffile.isReadOnly() ? "r" : "-") +
                (cffile.isArchive()  ? "a" : "-") +
                (cffile.isHidden()   ? "h" : "-") +
                (cffile.isSystem()   ? "s" : "-");
    }
   
    //
    // Command-line help
    //
    private static void displayHelp() {
        System.out.println("Cabinet extract utility");
        System.out.println();
        System.out.println("Usage: extract [/V] <cabinet name>");
        System.out.println();
        System.out.println("       Use /V to list cabinet contents instead of extracting");
    }


    //
    // Converts a filename which uses the backslash as the separator character,
    // to use the local system's separator character
    //
    // This stage is necessary since cab files are stored using the backslash
    // as the separator.
    //
    static String convertFilenameToSystemSeparator(String filename) {
        if (File.separatorChar != '\\')
            return filename.replace('\\', File.separatorChar);
        else
            return filename;
    }

    

    //
    // Implements CabDecoderInterface
    //
    public boolean closeOutputStream(OutputStream output, CabFileEntry file, boolean success) {
        try {
            output.close();
        }catch (IOException ioe) {
            System.out.println("IOException closing output file "+file.getName());
        }
        return true;
    }


    //
    // Called for each file in the cabinet, when we're extracting
    //
    public OutputStream openOutputStream(CabFileEntry file) {
        File                output_file;
        FileOutputStream    output_stream;
        String              filename, complete_filename;

        // Convert filename to use local separator convention
        filename = convertFilenameToSystemSeparator(file.getName());

        output_file = new File(filename);
        
        if (false && output_file.isAbsolute()) {
            System.out.println(
                "  ** Not extracting file with absolute pathname: " + filename
            );
            return null;
        }

        // Display the (converted) filename
        System.out.println("   " + file.getName());

        // Get the complete filename (with output directory prefix)
        if (output_directory != null)
            complete_filename = output_directory + File.separator + filename;
        else
            complete_filename = filename;

        // Open file for output
        output_file = new File(complete_filename);

        try {
            output_stream   = new FileOutputStream(output_file);
        }catch (IOException ioe) {
            //
            // Couldn't create the output stream; it could be that the
            // directories don't exist for it, so create them and try again
            //
            String parent_dir_name = output_file.getParent();

            if (parent_dir_name == null) {
                return null;
            }else{
                File parent_dir = new File(parent_dir_name);
                
                if (parent_dir != null)
                    parent_dir.mkdirs();
            }

            try {
                output_stream   = new FileOutputStream(output_file);
            }catch (IOException ioe2) {
                System.out.println(
                    "IOException opening output file " + complete_filename
                );
                return null;
            }
        }
        return output_stream;
    }


    //
    // For opening spanned cabinets
    //
    public InputStream openCabinet(String disk_name, String cabinet_name, int set_id) {
        return null;
    }

    //
    // Don't want any reserved areas
    //
    public boolean reservedAreaData(int type, byte[] reserved_data, int reserved_data_size, byte[] other_data, int other_data_size) {
        return false;
    }

    //
    // The cab decoder doesn't send any progress reports at this time
    //
    public Object progress(int progress_type, long val1, long val2, Object[] progress_data) {
        // return null for progress reports we don't know how to handle
        return null;
    }
}

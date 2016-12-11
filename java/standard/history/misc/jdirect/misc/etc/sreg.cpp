/*
 *   fReg. File Patcher, Basic IO & Registration.
 *   Description  : Patch & register files in /local dir.
 *   Dependencies : None.
 *   Platform     : win32.
 *   Version      : 1.0.1
 *   Credit       : this()
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 *  To contact the author email: null@null.co.za
 *  Todo :
*/

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <direct.h>
#include <ctype.h>
#include <string.h>
#include <windows.h>
#include <winbase.h>
#include <process.h>

/* ---- global variables ------ */
static char path[_MAX_PATH];
char* f_path;
char* s_path;
char* d_path;
char  s_file[50];
char  f_file[50];
char  f_reg[50];
char  f_exec[50];

int main(int argc, char *argv[]) {

/* ---- local variables ------ */
int drive, curdrive;
char* p_array[]     = {"C:\\Windows\\Desktop","C:\\WINNT\\Profiles","C:\\Documents and Settings"};
char* s_array[]     = {"C:\\windows\\system","C:\\Windows\\Desktop","c:\\winnt\\system32","C:\\WINNT\\Profiles","c:\\windows\\system32","C:\\Documents and Settings","c:\\winnt\\system32","C:\\Documents and Settings"};
//char* f_array[]     = {"actbar.ocx","comdlg32.ocx","library.ocx","richtx32.ocx","ssa3d30.ocx","ssscrl30.ocx","synrich.ocx","vsview6.ocx","msstdfmt.dll","msvcrt.dll","oledlg.dll","riched20.dll","riched32.dll","msvbvm60.dll"};
//char* d_array[]     = {"msstdfmt.dll","msvcrt.dll","oledlg.dll","riched20.dll","riched32.dll","msvbvm60.dll"};
char* r_array[]     = {"smtpsvg.dll"};
char* f_array[]     = {"mail.reg"};
curdrive            = _getdrive();
int fdone           = 0;

/* ---- general info ------ */
printf("[fReg utility : v1.0.3c] [nullWare 2001 (c)]\n\n");
printf("*-------------------------------------*\n");
/* ---- grab current/dir ------ */
if( _getcwd(path, _MAX_PATH ) == NULL ) {
 perror( "_getcwd error" );
 return -1;
}else{
 f_path         = path; 
}

for (int i = 0;i<sizeof(s_array)/sizeof(s_array[0]);i++) {
  printf("(%s\n", s_array[i]);
  printf("[%s\n", s_array[i+1]);
/* ---- determine sys/path ------ */
 if(_chdir(s_array[i]) && _chdir(s_array[i+1])) {
  i++;
  continue;
 }else
 if(!_chdir(s_array[i]) && !_chdir(s_array[i+1])) {
  s_path = s_array[i];
  d_path = s_array[i+1];
  //printf("-\n");
  printf("located local directory : %s\n", s_path);
  printf("located system directory : %s\n", d_path);
  break;
 }
}

/* ---- build file/paths ------ 
for (int i = 0;i<sizeof(r_array)/sizeof(r_array[0]);i++){
 strcpy(f_file, "");
 strcpy(f_file, f_path);
 strcat(f_file, "\\");
 strcat(f_file,r_array[i]);

 strcpy(s_file, "");
 strcpy(s_file, s_path);
 strcat(s_file, "\\");
 strcat(s_file,r_array[i]);

/* ---- copy/return failure ------ 
 if(CopyFile(f_file, s_file, FALSE) == 0){
  printf("%s : not copied\n", f_file);
 }else{
  printf("%s : copied\n", f_file);
  fdone = fdone + 1;
 }
}
*/

/* ---- build file/paths ------ 
for (int i = 0;i<sizeof(f_array)/sizeof(f_array[0]);i++){
 strcpy(f_file, "");
 strcpy(f_file, f_path);
 strcat(f_file, "\\");
 strcat(f_file,f_array[i]);

 strcpy(s_file, "");
 strcpy(s_file, s_path);
 strcat(s_file, "\\");
 strcat(s_file,f_array[i]);

/* ---- copy/return failure ------ 
 if(CopyFile(f_file, s_file, FALSE) == 0){
  printf("%s : not copied\n", f_file);
 }else{
  printf("%s : copied\n", f_file);
  fdone = fdone + 1;
 }
}
*/


/* ---- display files not copied ------ */
printf("*-------------------------------------*\n");
printf("%i : file(s) copied.\n", fdone);
printf("*-------------------------------------*\n");

/* ---- run system calls ------ */
for (int i = 0;i < sizeof(r_array)/sizeof(r_array[0]);i++){
 strcpy(f_reg, "");
 strcat(f_reg, s_path);
 strcat(f_reg, "\\");
 strcat(f_reg, "regsvr32 ");
 strcat(f_reg, r_array[i]);
 printf("%s\n",f_reg);
 system(f_reg);
}

/* ---- run system calls ------ */
for (int i = 0;i < sizeof(f_array)/sizeof(f_array[0]);i++) {
  strcpy(f_exec, "");
  strcat(f_exec, s_path);
  strcat(f_exec, "\\");
  strcat(f_exec, f_array[i]);
  printf("%s\n",f_exec);
  system(f_exec);
}

return 0;
}

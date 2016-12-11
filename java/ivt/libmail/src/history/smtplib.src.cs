/*
 *   mailer. CSharp Mailer Library.
 *   Description  : SMTP / Mime Encoding.
 *   Dependencies : NET Framework.
 *   Platform     : win32.
 *   Version      : 1.0.2
 *   Credit       : this()
 *   Copyright (C) 2001
 *
 *  To contact the author email: null@null.co.za
 *  Todo :
*/
using System;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Reflection;
using System.Runtime.CompilerServices;
using Strlib;
using Attach;

[assembly: AssemblyTitle("")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("http://www.null.co.za/")]
[assembly: AssemblyProduct("")]
[assembly: AssemblyCopyright("")]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCulture("")]		
[assembly: AssemblyVersion("1.0.*")]
[assembly: AssemblyDelaySign(false)]
[assembly: AssemblyKeyFile("")]
[assembly: AssemblyKeyName("")]

namespace smtplib{
  public class mailConn{

private const int SMTP_SERVICE_READY = 220;
private const int SMTP_OK            = 250;
private const int SMTP_FORWARD_OK    = 251;
private const int SMTP_START_BODY    = 354;

private const int CLIENT_CONNECT = 0;
private const int CLIENT_SEND_FROM = 1;
private const int CLIENT_SEND_TO = 2;
private const int CLIENT_START_DATA = 3;
private const int CLIENT_END_DATA = 4;
private const int CLIENT_SEND_QUIT = 5;
private const int CLIENT_CLOSE_CONNECTION = 6;

public string smtp(string inHost,  
                   string inEmailFrom, 
                   string inEmailTo, 
                   string inSubject, 
                   string inBody) {

  // data strings--------------------------------------

  string strRetPage        = "";
  string nl                = "\n";
  string szHost            = inHost;
  string szEmailFrom       = inEmailFrom;
  string szEmailTo         = inEmailTo;
  string szSubject         = inSubject;
  string szBody            = nl + inBody + nl;
  string szMailer          = "nullSMTP v1.0.*";

  string conn_hello        = "HELO \n";
  string conn_from         = "Mail From: " + szEmailFrom + nl;
  string conn_to           = "RCPT TO: "   + szEmailTo   + nl;
  string conn_data_phase   = "DATA \n";
  string conn_data_ReplyTo = "Reply-To: ";
  string conn_data_From    = "From: ";
  string conn_data_To      = "To: ";
  string conn_data_Subject = "Subject: ";
  string conn_data_Mailer  = "X-Mailer: ";
  string conn_data_CRLF    = "\n.\n";

  string conn_data         = conn_data_ReplyTo + 
                             szEmailFrom       +
                             nl                +
                             conn_data_From    +
                             szEmailFrom       +
                             nl                +
                             conn_data_To      +
                             szEmailTo         +
                             nl                +
                             conn_data_Subject +
                             szSubject         +
                             nl                +
                             conn_data_Mailer  +
                             szMailer          +
                             nl                +
                             szBody            + 
                             conn_data_CRLF;
  string conn_quit         = "QUIT \n";

  // --------------------------------------resolve host

  IPAddress host          = Dns.Resolve(szHost).AddressList[0];

  if( host.Address == 0 ) {
   strRetPage = "Unable to resolve host";
   return strRetPage;
  }	
  IPEndPoint EPhost = new IPEndPoint(host, 25);

  // ---copy IP, protocol-family and portnumber to sockaddr_in

  Socket s = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
  s.Connect(EPhost);
  if (! s.Connected) {
   strRetPage = "Unable to connect to host";
   return strRetPage;
  }

  // ------------------------connect socket with host

int     x = 0;
string  eval;

do{
  switch(x) {
  case CLIENT_CONNECT:
  
  byte[] byteGet   = Encoding.ASCII.GetBytes(conn_hello);
  byte[] recvBytes = new byte[256];
  s.Send(byteGet, byteGet.Length, SocketFlags.None);
  Int32 bytes      = s.Receive(recvBytes, recvBytes.Length, SocketFlags.None);
  eval             = ASCII.GetString(recvBytes, 0, bytes);
  if (Int32.Parse(eval.Substring(0,3)) == SMTP_SERVICE_READY) {
     x = CLIENT_SEND_FROM;
  }else{
     strRetPage = eval;
     x = CLIENT_CLOSE_CONNECTION;
  }
  break;         

  case CLIENT_SEND_FROM:

  byteGet          = Encoding.ASCII.GetBytes(conn_from);
  recvBytes        = new byte[256];
  s.Send(byteGet, byteGet.Length, SocketFlags.None);
  bytes            = s.Receive(recvBytes, recvBytes.Length, SocketFlags.None);
  eval             = ASCII.GetString(recvBytes, 0, bytes);
  if (Int32.Parse(eval.Substring(0,3)) == SMTP_OK) {
     x = CLIENT_SEND_TO;
  }else{
     strRetPage = eval;
     x = CLIENT_CLOSE_CONNECTION;
  }
  break;

  case CLIENT_SEND_TO:

  byteGet          = Encoding.ASCII.GetBytes(conn_to);
  recvBytes        = new byte[256];
  s.Send(byteGet, byteGet.Length, SocketFlags.None);
  bytes            = s.Receive(recvBytes, recvBytes.Length, SocketFlags.None);
  eval             = ASCII.GetString(recvBytes, 0, bytes);
  if (Int32.Parse(eval.Substring(0,3)) == SMTP_OK ||
      Int32.Parse(eval.Substring(0,3)) == SMTP_FORWARD_OK) {
     x = CLIENT_START_DATA;
  }else{
     strRetPage = eval;
     x = CLIENT_CLOSE_CONNECTION;
  }
  break;

  case CLIENT_START_DATA:

  byteGet          = Encoding.ASCII.GetBytes(conn_data_phase);
  recvBytes        = new byte[256];
  s.Send(byteGet, byteGet.Length, SocketFlags.None);
  bytes            = s.Receive(recvBytes, recvBytes.Length, SocketFlags.None);
  eval             = ASCII.GetString(recvBytes, 0, bytes);
  if (Int32.Parse(eval.Substring(0,3)) == SMTP_START_BODY) {
     x = CLIENT_END_DATA;
  }else{
     strRetPage = eval;
     x = CLIENT_CLOSE_CONNECTION;
  }
  break;

  case CLIENT_END_DATA:

  byteGet          = Encoding.ASCII.GetBytes(Message);
  recvBytes        = new byte[256];
  s.Send(byteGet, byteGet.Length, SocketFlags.None);
  bytes            = s.Receive(recvBytes, recvBytes.Length, SocketFlags.None);
  eval             = ASCII.GetString(recvBytes, 0, bytes);
     x = CLIENT_SEND_QUIT;
  break;

  case CLIENT_SEND_QUIT:

  byteGet          = Encoding.ASCII.GetBytes(conn_quit);
  recvBytes        = new byte[256];
  s.Send(byteGet, byteGet.Length, SocketFlags.None);
  bytes            = s.Receive(recvBytes, recvBytes.Length, SocketFlags.None);
  eval             = ASCII.GetString(recvBytes, 0, bytes);
	
  s.Close();
  strRetPage = eval;
  x = CLIENT_CLOSE_CONNECTION;
  break;
  }
 }while(x<CLIENT_CLOSE_CONNECTION);

 return strRetPage;
 }
};

 public class Entry{
  public static int Main(string[] args){
   fAttach attach = new fAttach();
   attach.FileAttachment(@"C:\win32_code\src\c_c#\c#_src\gen\smtplib\etc\sockets.txt");

   mailConn ns = new mailConn();
/**
   String x = ns.smtp("null",
           "root@null",
           "null@null",
           "smtp()",
           "smtp(1)");
   Console.WriteLine(x);
**/
   return 0;
  }
 };
};



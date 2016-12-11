# ----------------------------------------------------------------------------
# Tools and switches
# ----------------------------------------------------------------------------

CPP=cl.exe
CPP_SWITCHES=/c /DWIN32 /DREGISTER_PROXY_DLL /Fo"$(OUTDIR)\\" /Fd"$(OUTDIR)\\"
CPP_SWITCHES_EXT=$(CPP_SWITCHES) /D_WIN32_WINNT=0X400

# ----------------------------------------------------------------------------
# Set destination directory.
# ----------------------------------------------------------------------------

OUTDIR=.\Debug

# ----------------------------------------------------------------------------
# Set Obj and Lib files.
# ----------------------------------------------------------------------------

PROXYSTUBOBJS = $(OUTDIR)\dlldata.obj $(OUTDIR)\jshell_p.obj $(OUTDIR)\jshell_i.obj
PROXYSTUBLIBS = kernel32.lib oleaut32.lib rpcndr.lib rpcns4.lib rpcrt4.lib uuid.lib

# ----------------------------------------------------------------------------
# Build the jshell.
# ----------------------------------------------------------------------------

all: $(OUTDIR) $(OUTDIR)\jshell.dll

$(OUTDIR)\dlldata.obj : dlldata.c
	$(CPP) $(CPP_SWITCHES) dlldata.c
$(OUTDIR)\jshell_p.obj : jshell_p.c
	$(CPP) $(CPP_SWITCHES_EXT) jshell_p.c
$(OUTDIR)\jshell_i.obj : jshell_i.c
	$(CPP) $(CPP_SWITCHES) jshell_i.c

$(OUTDIR)\jshell.dll : $(PROXYSTUBOBJS) jshell.def
	link /dll /out:$(OUTDIR)\jshell.dll /def:jshell.def \
	$(PROXYSTUBOBJS) $(PROXYSTUBLIBS)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

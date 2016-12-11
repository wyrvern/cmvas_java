# ----------------------------------------------------------------------------
# Standard Microsoft SDK for Java MAKEFILE for Samples
# ----------------------------------------------------------------------------

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

PROXYSTUBOBJS = $(OUTDIR)\dlldata.obj $(OUTDIR)\sample_p.obj $(OUTDIR)\sample_i.obj
PROXYSTUBLIBS = kernel32.lib oleaut32.lib rpcndr.lib rpcns4.lib rpcrt4.lib uuid.lib

# ----------------------------------------------------------------------------
# Build the sample.
# ----------------------------------------------------------------------------

all: $(OUTDIR) $(OUTDIR)\proxystub.dll

$(OUTDIR)\dlldata.obj : dlldata.c
	$(CPP) $(CPP_SWITCHES) dlldata.c
$(OUTDIR)\sample_p.obj : sample_p.c
	$(CPP) $(CPP_SWITCHES_EXT) sample_p.c
$(OUTDIR)\sample_i.obj : sample_i.c
	$(CPP) $(CPP_SWITCHES) sample_i.c

$(OUTDIR)\proxystub.dll : $(PROXYSTUBOBJS) proxystub.def
	link /dll /out:$(OUTDIR)\proxystub.dll /def:proxystub.def \
	$(PROXYSTUBOBJS) $(PROXYSTUBLIBS)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"
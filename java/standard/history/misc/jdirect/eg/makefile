# ----------------------------------------------------------------------------
# Standard Microsoft SDK for Java MAKEFILE for Samples
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Tools
# ----------------------------------------------------------------------------

JVCATTR = jvc.exe -nologo -x- -nomessage
MIDLATTR = midl.exe /Oicf /nologo
JCTVXATTR = jactivex /javatlb /X:m-

# ----------------------------------------------------------------------------
# Set destination directory.
# ----------------------------------------------------------------------------

DEST_DIR= .
OUTDIR=.\Debug

# ----------------------------------------------------------------------------
# Build the sample
# ----------------------------------------------------------------------------

all:
	$(MIDLATTR)  sample.idl
	$(MAKE) -f proxystub.mak
	copy Debug\*.dll $(DEST_DIR)	
	$(JCTVXATTR) -d $(DEST_DIR) sample.tlb
	$(JVCATTR) -d $(DEST_DIR) sample\dcom\*.java
	$(JVCATTR) -d $(DEST_DIR) sample\*.java

# ----------------------------------------------------------------------------
# Clean up the output files
# ----------------------------------------------------------------------------

clean:
	del *.tlb
	del *.c
	del sample.h
	del *.dll
	del sample\*.class
	del sample\dcom\*.class
	if exist $(OUTDIR)\nul @rd /S /Q $(OUTDIR)
/*
 *   mailer. JAVA Mailer Library.
 *   Description  : Mime Encoding.
 *   Dependencies : JAVA VM 1.2+
 *   Platform     : any()
 *   Version      : 1.0.2
 *   Credit       : this()
 *   Copyright (C) 2001
 *
 *  To contact the author email: null@null.co.za
 *  Todo :
*/

 public abstract class encoder { 

    protected byte[] i_data;

    public encoder(){ }

    public encoder(byte[] p_data){
       i_data = p_data;
    }

    public encoder(String p_data){
       i_data = this.convertToByte(p_data);
    } 

    public void setData(byte[] p_data){
       i_data = p_data;
    }

    public void setData(String p_data){
       i_data = this.convertToByte(p_data);
    }
 
    public int getEncodeLength(){
       return i_data.length;
    }
 
    public abstract String encode() throws EncodingException;
 
    public int getDecodeLength(){
       return i_data.length;
    }
 
    public abstract String decode() throws EncodingException;

    private byte[] convertToByte(String p_data) {
      char[] charData;
      byte[] byteData;
      int arrayLength;

      charData = p_data.toCharArray();
      arrayLength = charData.length;
      byteData = new byte[arrayLength];

      for(int i=0;i<arrayLength;i++) {
          byteData[i] = (byte)charData[i];
      }
      return byteData;
    }

 };
 
 class Encode7bit extends encoder {

    public Encode7bit() { 
       super();
    }

    public Encode7bit(byte[] p_data) {
       super(p_data);
    }

    public Encode7bit(String p_data) {
       super(p_data);
    }

    public String encode() throws EncodingException {
     int dataLength      = i_data.length;
     int CRLFCount       = 0;
      for (int i=0;i<dataLength;i++) {
        if (i_data[i] > 127) { 
           throw new EncodingException("Invalid data");
        }
        if (i_data[i] == 10 && i_data[i-1] == 13) {
           CRLFCount     = 0;
        }
        if (CRLFCount  > 1000) {
           throw new EncodingException("Invalid data");
        }
        CRLFCount++;
      }
     return new String(i_data);
    }

    public String decode() throws EncodingException {
     String data;
       try {
          data = encode();
       }catch(EncodingException ex) {
          throw(ex);
       }
     return data;
    }
 };

 class Encode8bit extends encoder { 

  public Encode8bit(){ 
     super();
  }

  public Encode8bit(byte[] p_data){
     super(p_data);
  }

  public Encode8bit(String p_data){
     super(p_data);
  }

  public String encode() throws EncodingException {
   int dataLength  = i_data.length;
   int CRLFCount   = 0;
     for (int i = 0;i < dataLength;i++) {
        if (i_data[i] == 10 && i_data[i-1] == 13) {
           CRLFCount     = 0;
        }
        if (CRLFCount  > 1000) {
           throw new EncodingException("Invalid data");
        }
     CRLFCount++;
     }
   return new String(i_data);
  }

  public String decode() throws EncodingException {
   String data;
     try {
        data = encode();
     }catch(EncodingException ex) {
        throw(ex);
     }
   return data;
  }

 };

 class EncodeBase64 extends encoder { 

  private static final char[] BASE_64_CHARACTER_LIST = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=".toCharArray();
  private byte bCRLF[] = {13, 10};
  private String CRLF = new String(bCRLF);

  public EncodeBase64() { 
     super();
  }

  public EncodeBase64(byte[] p_data) {
     super(p_data);
  }

  public EncodeBase64(String p_data) {
     super(p_data);
  }

  public int getEncodeLength() {
     return (((i_data.length+2)/3)*4);
  }

  public String encode() { // throw new EncodingException();
    int i;
    int cnt                 = 0;
    int dataLength          = i_data.length;
    int encodedLength       = getEncodeLength();
    char[] encodedData      = new char[encodedLength];
    StringBuffer  outString = new StringBuffer();
    boolean quad            = false;
    boolean trip            = false;
    int val;

      for (i=0; i<dataLength; i+=3, cnt+=4) {
        val = (0xFF & (int)i_data[i]);
        val <<= 8;

        if ((i+1) < dataLength) {
           val |= (0xFF & (int) i_data[i+1]);
           trip = true;
        }

        val <<= 8;

        if ((i+2) < dataLength) {
           val |= (0xFF & (int) i_data[i+2]);
           quad = true;
        }

        encodedData[cnt+3] = BASE_64_CHARACTER_LIST[(quad?(val & 0x3F):64)];
        val >>= 6;
        encodedData[cnt+2] = BASE_64_CHARACTER_LIST[(trip?(val & 0x3F):64)];
        val >>= 6;
        encodedData[cnt+1] = BASE_64_CHARACTER_LIST[val & 0x3F];
        val >>= 6;
        encodedData[cnt+0] = BASE_64_CHARACTER_LIST[val & 0x3F];
      }

      for(i=0;i<encodedLength;i++) {
        outString.append(encodedData[i]);
        if(((i%76)==0) && i>0) {
          outString.append(CRLF);
        }
      }
      return outString.toString();
    }

    public int getDecodeLength() {
       return i_data.length;
    }

    public String decode() throws EncodingException {
       return "";
    }
 };

 class EncodingException extends Exception {

    public EncodingException() {
       super();
    }

    public EncodingException(String p_message) {
       super(p_message);
    }
 };


/*
 *   Encoder. E-Mail mime encoder utils library.
 *   Copyright (C) 2001  Jim Hurst
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
 *  To contact the author email: java@xlevel.org.uk
*/
package uk.org.xlevel.Encoder;

/**
 * The class <code>EncoderBase64</code> provides a way to
 * verifing and encode the data using the MIME Base 64 encoding
 * standard.
 * <p>
 * @author Jim Hurst
 * @version 1.0
 * @since 1.0
 */
public class EncoderBase64 extends Encoder
{

    /**
     *
     */
    private static final char[] BASE_64_CHARACTER_LIST =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=".
        toCharArray();

    private byte bCRLF[] = {13, 10};
    private String CRLF = new String(bCRLF);

    /**
     * Creates a new <code>EncoderBase64</code> object.
     */
    public EncoderBase64()
    {
        super();
    }

    /**
     * Creates a new <code>EncoderBase64intable</code> object.
     * <p>
     * p_data data to be encoded or decoded.
     */
    public EncoderBase64(byte[] p_data)
    {
        super(p_data);
    }

    /**
     * Creates a new <code>EncoderBase64</code> object.
     * <p>
     * p_data data to be encoded or decoded.
     */
    public EncoderBase64(String p_data)
    {
        super(p_data);
    }

    /**
     * Gets the length of the data array that will be returned
     * by the <code>encode()</code> method.
     * <p>
     * @return the length of the encoded data array.
     */
    public int getEncodeLength()
    {
        return (((i_data.length+2)/3)*4);
    }

    /**
     * Encodes the data.  If the data cannot be encoded, it throws a
     * <code>EncodingException</code>.
     * <p>
     * @return the encoded data.
     * @exception if the data cannot be encoded.
     */
    public String encode() throws EncodingException
    {
        int i;
        int cnt = 0;
        int dataLength = i_data.length;
        int encodedLength = getEncodeLength();
        char[] encodedData = new char[encodedLength];
        StringBuffer outString = new StringBuffer();
        boolean quad = false;
        boolean trip = false;
        int val;


        for (i=0; i<dataLength; i+=3, cnt+=4)
        {
            val = (0xFF & (int) i_data[i]);
            val <<= 8;

            if ((i+1) < dataLength)
            {
                val |= (0xFF & (int) i_data[i+1]);
                trip = true;
            }

            val <<= 8;

            if ((i+2) < dataLength)
            {
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


        for(i=0;i<encodedLength;i++)
        {
            outString.append(encodedData[i]);

            if(((i%76)==0) && i>0)
            {
                outString.append(CRLF);
            }
        }

        return outString.toString();
    }

    /**
     * Gets the length of the data array that will be returned
     * by the <code>decode()</code> method.
     * <B>Not Yet Implemented</B>
     * <p>
     * @return the length of the decoded data array.
     */
    public int getDecodeLength()
    {
        //TODO: Calculate the decoded data length.

        return i_data.length;
    }

    /**
     * Decodes the data.  If the data cannot be decoded, it throws a
     * <code>EncodingException</code>.
     * <B>Not Yet Implemented</B>
     * <p>
     * @return the decoded data.
     * @exception if the data cannot be decoded.
     */
    public String decode() throws EncodingException
    {

        //TODO: decode the data.

        return "";
    }
}
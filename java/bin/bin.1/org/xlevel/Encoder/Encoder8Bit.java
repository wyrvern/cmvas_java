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
 * The class <code>Encoder8Bit</code> provides a way to verifing that data fits the
 * rules so that it can be transmitted using the MIME 8Bit encoding
 * standard.
 * <p>
 * The <code>Encoder8Bit</code> does not actually do any
 * encoding, but rather checks that the provided data obays the rules.
 * <ul>
 * <li> No single line of text can be greater than 1000 characters
 * before a CRLF character pair is encounted.</li>
 * </ul>
 * <p>
 * @author Jim Hurst
 * @version 1.0
 * @since 1.0
 */
public class Encoder8Bit extends Encoder
{

    /**
     * Creates a new Encoder8Bit object.
     */
    public Encoder8Bit()
    {
        super();
    }

    /**
     * Creates a new Encoder8Bit object.
     * <p>
     * p_data data to be encoded or decoded.
     */
    public Encoder8Bit(byte[] p_data)
    {
        super(p_data);
    }

    /**
     * Creates a new Encoder8Bit object.
     * <p>
     * p_data data to be encoded or decoded.
     */
    public Encoder8Bit(String p_data)
    {
        super(p_data);
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
        int dataLength;
        int CRLFCount = 0;

        dataLength = i_data.length;

        for(int i=0;i<dataLength;i++)
        {
            /* Now check the length of text between the CRLF's.  This
            cannot be more than 1000 characters or it is invalid. */
            if(i_data[i] == 10 && i_data[i-1] == 13)
            {
                CRLFCount = 0;
            }

            if(CRLFCount > 1000)
            {
                throw new EncodingException("Invalid data");
            }

            CRLFCount++;
        }
        return new String(i_data);
    }

    /**
     * Decodes the data.  If the data cannot be decoded, it throws a
     * <code>EncodingException</code>.
     * <p>
     * @return the decoded data.
     * @exception if the data cannot be decoded.
     */
    public String decode() throws EncodingException
    {
        String data;

        try
        {
            // Call encode, as it does the same thing decode would do.
            data = encode();
        }
        catch(EncodingException ex)
        {
            // Pass on the exception.
            throw ex;
        }
        return data;
    }
}
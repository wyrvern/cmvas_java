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
 *
 * <p>
 * @author Jim Hurst
 * @version 1.0
 * @since 1.0
 */
public abstract class Encoder
{
    protected byte[] i_data;

    /**
     * Creates a new Encoder object.
     */
    public Encoder()
    {}

    /**
     * Creates a new Encoder object.
     * <p>
     * p_data data to be encoded or decoded.
     */
    public Encoder(byte[] p_data)
    {
        i_data = p_data;
    }

    /**
     * Creates a new Encoder object.
     * <p>
     * p_data data to be encoded or decoded.
     */
    public Encoder(String p_data)
    {
        i_data = this.convertToByte(p_data);
    }

    /**
     * Sets the data to be encoded or decoded.
     * <p>
     * @param p_data sets the data to be encoded or decoded.
     */
    public void setData(byte[] p_data)
    {
        i_data = p_data;
    }

    /**
     * Sets the data to be encoded or decoded.
     * <p>
     * @param p_data sets the data to be encoded or decoded.
     */
    public void setData(String p_data)
    {
        i_data = this.convertToByte(p_data);
    }

    /**
     * Gets the length of the data array that will be returned
     * by the <code>encode()</code> method.
     * <p>
     * @return the length of the encoded data array.
     */
    public int getEncodeLength()
    {
        return i_data.length;
    }

    /**
     * Encodes the data.  If the data cannot be encoded, it throws a
     * <code>EncodingException</code>.
     * <p>
     * @return the encoded data.
     * @exception if the data cannot be encoded.
     */
    public abstract String encode() throws EncodingException;

    /**
     * Gets the length of the data array that will be returned
     * by the <code>decode()</code> method.
     * <p>
     * @return the length of the decoded data array.
     */
    public int getDecodeLength()
    {
        return i_data.length;
    }

    /**
     * Decodes the data.  If the data cannot be decoded, it throws a
     * <code>EncodingException</code>.
     * <p>
     * @return the decoded data.
     * @exception if the data cannot be decoded.
     */
    public abstract String decode() throws EncodingException;

    /**
     * Converts a <code>String</code> into a byte array.
     * <p>
     * @param p_data the String to be converted.
     * @return the byte array.
     */
    private byte[] convertToByte(String p_data)
    {
        char[] charData;
        byte[] byteData;
        int arrayLength;

        //Convert the String into an array
        charData = p_data.toCharArray();
        arrayLength = charData.length;
        byteData = new byte[arrayLength];

        //Iterate through the array, copying it into the byte array.
        for(int i=0;i<arrayLength;i++)
        {
            byteData[i] = (byte)charData[i];
        }
        return byteData;
    }
}

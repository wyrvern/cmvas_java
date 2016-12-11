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
 * Thrown when the user tries to an inappropriate encoding
 * mechanism on the provided data.
 * <p>
 * @author Jim Hurst
 * @version 1.0
 * @since 1.0
 */
public class EncodingException extends Exception
{
    /**
     * Constructs a <code>EncodingException</code> without
     * a message string.
     */
    public EncodingException()
    {
        super();
    }

    /**
     * Constructs a <code>EncodingException</code> with
     * a message string.
     * <p>
     * @param p_message exception message string.
     */
    public EncodingException(String p_message)
    {
        super(p_message);
    }

}

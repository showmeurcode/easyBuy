/**
 * 
 */
package cn.easybuy.util;

import java.util.regex.Pattern;



/**
 * @author x
 *
 */
public class MathUtil {
	
	public static boolean isNumeric(String str){
	    Pattern pattern = Pattern.compile("[0-9]*");
	    return pattern.matcher(str).matches();   
	}

}

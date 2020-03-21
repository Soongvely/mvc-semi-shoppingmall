package ezo.shop.util;

import java.security.MessageDigest;

import javax.servlet.ServletException;

public class SecurityUtils {

	public static String sha256hex(String str) {

		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(str.getBytes());
			return bytesToHex(md.digest());
		} catch (Exception e) {
			/**
			 * ServletException으로 wrapping 한 이유는 ?
			 * 
			 * */
			new ServletException(e.getMessage());
		}
		return null;
	}

	private static String bytesToHex(byte[] bytes) {
		StringBuilder builder = new StringBuilder();
		for (byte b : bytes) {
			builder.append(String.format("%02x", b));
		}
		return builder.toString();
	}

}

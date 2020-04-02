package ezo.shop.util;

import javax.servlet.http.Cookie;

public class CookieUtils {

	/**
	 * 쿠키에서 지정된 이름을 설정된 값을 반환한다.
	 * @param cookies 요청메세지에서 가져온 모든 쿠키들(배열)
	 * @param name 조회할 쿠키이름
	 * @return 쿠키값
	 */
	public static String getCookieValue(Cookie[] cookies, String name) {
		if (cookies == null) {
			return null;
		}
		if (cookies.length == 0) {
			return null;
		}

		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(name)) {
				return cookie.getValue();
			}
		}
		return null;
	}
}

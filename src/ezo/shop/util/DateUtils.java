package ezo.shop.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
	
	private static SimpleDateFormat normalFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	/**
	 * 날짜를 yyyy-MM-dd 패턴으로 형식화한 문자열을 반환한다.
	 * @param date 날짜
	 * @return 형식화된 문자 (에 : 2018-10-14)
	 */
	public static String dateToString(Date date) {
		if (date == null) {
			return "";
		}
		return normalFormat.format(date);
	}
}

package ezo.shop.util;

import java.text.DecimalFormat;

public class NumberUtils {
	
	private NumberUtils() {}
	
	private static DecimalFormat numberFormat = new DecimalFormat("#,###");
	
	/**
	 * 첫번째 숫자를 두번째 숫자로 나눈 값에 대한 ceil값을 반환한다.
	 * @param num1 첫번째 숫자
	 * @param num2 두번째 숫자(나누는 수)
	 * @return ceil 값
	 */
	public static int ceil(double num1, double num2) {
		return (int) Math.ceil(num1/num2);
	}
	
	/**
	 * 문자를 숫자로 변환한다.
	 * @param str 숫자로 변환할 문자열
	 * @return 정수값이 반환된다. 변환실패시 0이 반환된다.
	 */
	public static int stringToNumber(String str) {
		return stringToNumber(str, 0);
	}
	
	/**
	 * 문자를 숫자로 변환한다.
	 * @param str 숫자로 변환할 문자열
	 * @param defaultNumber 변환실패시 사용될 기본값
	 * @return 정수값이 반환된다. 변활실패시 기본값으로 지정된 값이 반환된다.
	 */
	public static int stringToNumber(String str, int defaultNumber) {
		
		/**
		 * 제가 지적한 다른 포인트 부분도 이해했다면 아래 구문도 refactoring 할 수 있을 겁니다.
		 * */
		
		// 페이지번호가 없으면 디폴트
		if (str == null) {
			return defaultNumber;
		}
		try {
			// 정상적인 번호여야 페이지 번호 
			return Integer.parseInt(str);
		} catch (NumberFormatException e) {
			// 이상한 값이어도 디폴트
			return defaultNumber;
		}
	}
	
	/**
	 * 숫자를 , 가 포함된 문자열로 반환한다.
	 * @param number 숫자
	 * @return 세자리마다 , 가 포함된 문자열을 반환한다. number가 null이면 빈문자열을 반환한다.
	 */
	public static String numberWithComma(Integer number) {
		if (number == null) {
			return "";
		}
		return numberFormat.format(number);
	}
}

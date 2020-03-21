package ezo.shop.util;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class IbatisUtil {
	
	private static SqlMapClient sqlMap;
	
	static {
		/**
		 * 해당 구문은 싱크레톤이라 큰 문제가 되지 않을 수 있으나 다른 경우였다면 아래와 같은 IO 핸들링은 시스템 장애를 불러옵니다.
		 * refactoring 해 보세요 
		 * 
		 * */
		try {
			 Reader reader = Resources.getResourceAsReader("ezo/shop/ibatis/SqlMapConfig.xml");
			 sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	public static SqlMapClient getSqlmap() {
		return sqlMap;
	}
	
}

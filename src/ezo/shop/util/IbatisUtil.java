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
		 * 해당 구문은 싱크레톤(싱글톤인가요?)이라 큰 문제가 되지 않을 수 있으나 다른 경우였다면 아래와 같은 IO 핸들링은 시스템 장애를 불러옵니다.
		 * refactoring 해 보세요
		 *
		 * 요즘 잘 쓰이지않는다는 부분이 Ibatis 자체를 말씀하시는 건지,
		 * IOException관련하여 try catch 말씀하시는 건지,
		 * Resourece를 읽어오는 소스륾 말씀하시는 건지 정확히 모르겠습니다.
		 *
		 * 해당 프로잭트는 spring 및 my-batis를 사용하지 않고 servlet, i-batis를 사용하여 최근 사용 방식과 다르다는 것은 알고 있습니다.
		 * */
		try {
		Reader reader = Resources.getResourceAsReader("ezo/shop/ibatis/SqlMapConfig.xml");
		sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static SqlMapClient getSqlmap() {
		return sqlMap;
	}
	
}

package ezo.shop.util;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class IbatisUtil {
	
	private static SqlMapClient sqlMap;
	
	static {
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

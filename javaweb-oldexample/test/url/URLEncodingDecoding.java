package url;

import java.net.URLDecoder;
import java.net.URLEncoder;

import org.junit.Test;

public class URLEncodingDecoding {

	@Test
	public void test1() throws Exception {
		//String str = "あいうえお";
		String str = "아이우에오";

		System.out.println(URLEncoder.encode(str, "UTF-8"));
	}

	@Test
	public void test2() throws Exception {
		//String str = "%E3%81%82%E3%81%84%E3%81%86%E3%81%88%E3%81%8A";
		String str = "%EC%95%84%EC%9D%B4%EC%9A%B0%EC%97%90%EC%98%A4";

		System.out.println(URLDecoder.decode(str, "UTF-8"));
	}
	
	@Test
	public void test3() throws Exception {
		String str = "%EC%95%84%EC%9D%B4%EC%9A%B0%EC%97%90%EC%98%A4";

		System.out.println(URLEncoder.encode(str, "UTF-8"));
	}

	@Test
	public void test4() throws Exception {
		char ch = '$';

		System.out.println((int)ch);
	}

}

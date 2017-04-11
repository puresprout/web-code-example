/*
 * 이 Bean이 수정될때마다 서블릿 엔진에 변경사항을 적용하기 위해선 server.xml 파일의 <Context> 태그의 reloadable 속성을 true로 설정해야 한다
 */

package javaBeans;

import java.sql.*;
import java.util.*;
import java.io.*;

public class LogInBean {
	private String ID;
	private String password;
	
	public LogInBean() {
		ID = null;
		password = null;
	}

	public void setID(String ID) {
		this.ID = ID;
	}
	
	public String getID() {
		return ID;
	}
	
	// 앙호는 설정할수만 있다
	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return password;
	}
    
	// 로그인을 수행하는 메소드
	public boolean doLogIn() throws Exception {
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		Properties prop = new Properties();
		
		// 프로퍼티 파일을 로드한다.
		try {
			InputStream is = getClass().getResourceAsStream("LogInBean.properties");
			prop.load(is);
			
			if (is != null)
				is.close();

            System.err.println("프로퍼티 얻기 성공");
		} catch (Exception e) { // IOException 예외가 던져질 수 있음
            System.err.println("프로퍼티 오류 : LogInBean.properties 파일이 없을 수도 있습니다.");
            e.printStackTrace(System.err);
            throw e;
        }
		
		// 프로퍼티 읽기
		String driver = prop.getProperty("driver");
		String url = prop.getProperty("url");
		String user = prop.getProperty("user");
		String password = prop.getProperty("password");
		
		// 드라이버 적재
		try {
			Class.forName(driver);
            
            System.err.println("드라이버 적재 성공");
		} catch (Exception e) { // ClassNotFound 예외가 던져질 수 있음
            System.err.println("드라이버 적재 오류");
            e.printStackTrace(System.err);
            throw e;
        }
		
		// 데이터베이스 커넥션 얻기
		try {
			con = DriverManager.getConnection(url);
			
            System.err.println("연결 얻기 성공");
            
			// 로그인 질의
			pstm = con.prepareStatement("SELECT * FROM 사용자 WHERE 아이디=? AND 비밀번호=?");
			pstm.setString(1, ID);
			pstm.setString(2, this.password);   // password 는 프로퍼티 것이고 this.password 는 Bean 객체 것. 혼동하지 말것
            
            System.err.println("ID : " + ID);
            System.err.println("Password : " + this.password);
			
            rs = pstm.executeQuery();
            
			if (rs.next() == true) {
				return true;    // 로그인 성공
			} else {
				return false;
			}
        } catch (Exception e) { // SQLException 예외가 던져질 수 있음
            System.err.println("질의 오류");
            e.printStackTrace(System.err);
            throw e;
		} finally {
	        try {
    	        if (rs != null)
        	        rs.close();
	            if (pstm != null)
    	            pstm.close();
    	        if (con != null)
        	        con.close();
	        } catch (SQLException e) {
                throw e;
        	}
        }
	}
}
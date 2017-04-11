<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
모든 테이블 출력<br>
<%
	String sql = "SELECT * FROM TAB";
	
	Context ctx = null;
	DataSource ds = null;
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		ctx = new InitialContext();
		ds = (javax.sql.DataSource) ctx.lookup("TheOracle");	// JNDI명인 TheOracle 를 찾기
		con = ds.getConnection();	// DataSource로부터 연결 얻기
		con.setAutoCommit(false);
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		out.println("<table><tr><td>TNAME</td><td>TABTYPE</td><td>CLUSTERID</td></tr>");
		while (rs.next()) {
			out.println("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td></tr>");
		}
		out.println("</table>");
	} catch (Exception e) {
		out.println(e.toString());
	} finally {
		rs.close();
		stmt.close();
		con.close();
	}
%>

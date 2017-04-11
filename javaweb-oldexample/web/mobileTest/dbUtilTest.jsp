<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="org.apache.commons.dbutils.*, javax.naming.*, java.sql.*, java.util.*"
    import="org.apache.commons.dbutils.handlers.*, java.math.*, javax.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int totalGiftMoneyCount = 0;

	try {
		// 컨텍스트 초기화
		InitialContext ctx = new InitialContext();
		// 데이터소스 초기화
		DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/cms");
		// QueryRunner 초기화
		QueryRunner run = new QueryRunner(ds);
		
		List list = (List) run.query(QUERY_GIFT_MONEY, new Object[] {"pookis", "02", "99100001", "pookis", "02", "98"}, new MapListHandler());
		
		out.println("이용권 개수: " + list.size());
		
		for (int i = 0; i < list.size(); i++) {
			Map map = (Map) list.get(i);
			Object obj = map.get("amount_remain");
			
			totalGiftMoneyCount = ((Integer) obj).intValue() + totalGiftMoneyCount;
		}
		
		out.println("이용권 메시지 개수: " + totalGiftMoneyCount);
	} catch (SQLException e) {
		e.printStackTrace();
	} catch (NamingException e) {
		e.printStackTrace();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<%!
	private static final String QUERY_GIFT_MONEY = "SELECT giftcard_user.card_no,giftcard.cid, giftcard.title title, contents.cid cid_kind_code, contents.title title_name, giftcard_user.amount_remain "
		+ "FROM giftcard "
		+ "JOIN giftcard_user ON giftcard_user.cid=giftcard.cid "
		+ "JOIN giftcard_contents ON giftcard_contents.cid=giftcard_user.cid "
		+ "JOIN contents ON contents.cid=giftcard_contents.contents_cid "
		+ "WHERE giftcard_user.validtime_end>=now() AND giftcard_user.validtime_start<=now() "
		+ "AND giftcard_user.user_id=? AND giftcard.site=? AND giftcard_contents.contents_cid=? AND giftcard_user.amount_remain>0 AND giftcard_user.is_deleted='N'"
		+ "UNION "
		+ "SELECT giftcard_user.card_no,giftcard.cid, giftcard.title title, kind.kind_code cid_kind_code, kind.name title_name, giftcard_user.amount_remain "
		+ "FROM giftcard "
		+ "JOIN giftcard_user ON giftcard_user.cid=giftcard.cid "
		+ "JOIN giftcard_kind ON giftcard_kind.cid=giftcard_user.cid "
		+ "JOIN kind ON kind.kind_code=giftcard_kind.kind_code "
		+ "WHERE giftcard_user.validtime_end>=now() AND giftcard_user.validtime_start<=now() "
		+ "AND giftcard_user.user_id=? AND giftcard.site=? AND giftcard_kind.kind_code=? AND giftcard_user.amount_remain>0  AND giftcard_user.is_deleted='N'";
%>
</body>
</html>
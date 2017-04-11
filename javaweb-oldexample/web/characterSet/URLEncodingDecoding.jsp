<!--
    get ������� jsp ���Ͽ� �����͸� �����ϴµ� �־�, URL�� �ѱ��̳� Ư�����ڰ� �ִٸ� Ư�� �������� URL�� ���ڵ��ؾ� �Ѵ�.
    �̷��� ������ 'x-www-form-urlencoded' ��� �Ѵ�.

    1. 'a' ���� 'z' ����, 'A' ���� 'Z' ������ ���ĺ�, '0' ���� '9' ������ ����, '-', '_', '.', '*' �� �״�� �д�.
    2. ������ '+' ��ȣ�� �ٲ۴�.
    3. �� �̿��� ��� ���ڴ� '%xy'�� ���� 3�ڸ� ���ڷ� �ٲٴµ� ���⼭ 'xy'�� �ش� ������ 16���� �ڵ尪�� �ȴ�.

    public static String java.net.URLEncoder.encode(String s) �޼ҵ带 ����� URL ���ڵ��� �Ѵ�.
    
    'Hello' -> 'Hello'
    '�ѱ�' -> '%C7%D1%B1%DB'

    '�ѱ�' �̶�� �ڹ� ���ڿ��� �����ڵ��ε� URL ���ڵ��� ���� EUC-KR ���ڼ� �������̴�. ��, �����ڵ带 �ش� �ý����� �⺻ ���ڼ����� ��ȯ�� �Ŀ�
    �װ��� �ٽ� URL �������� ���ڵ��� �ϴ� ���̴�.

    '�ѱ�'�� URL ���ڵ��� �� ������ '%3F%3F' ��� ��µǴ� ��찡�ִµ� �̴� �ý����� �⺻ ���ڼ��� 8859_1�� ��� '�ѱ�' �����ڵ带 8859_1�� �����
    ��ȯ�� �� �����Ƿ� '%3F%3F' ��� �����ϰ� ���� ������.

    �Ʒ��� �ҽ����� �� ������ ��ũ�� �ִµ�,
    ù��°�� URLEncoding ���� �Ķ���͸� get ������� �ѱ�� �ִ�. �̴� �ý����� �⺻ ���ڼ����� �״�� �� �������� â�� �� ����('Hello', '�ѱ�') ��
    ��Ÿ����. ���� ��ũ ���������� �ƹ��� �������� �� �������� �ٸ� �ý������� �� ���α׷��� �ű�� URLEncoding �� �� �Ǿ����Ƿ� ����� Ʋ���� ���� ��
    �ִ�. (������)
    �ι�°�� URLEncoding�� ���� �� ������ �ּ�â�� �Ķ���Ͱ� URL ���ڵ��� ���·� ���� ���̴�. ����� �ùٸ��� ���´�. (������)
-->

<%@page contentType="text/html; charset=euc-kr"%>
<html>
<head><title>URL Encoding/Decoding</title></head>
<body>

<%
    String englishMsg = "Hello";
    String koreanMsg = "�ѱ�";
%>

<!--
<a href="CharacterSetParameter.jsp?msg=<%= englishMsg %>">���� �޽���</a><br>
<a href="CharacterSetParameter.jsp?msg=<%= koreanMsg %>">�ѱ� �޽���</a>
-->

<a href="CharacterSetParameter.jsp?msg=<%= java.net.URLEncoder.encode(englishMsg) %>">���� �޽���</a><br>
<a href="CharacterSetParameter.jsp?msg=<%= java.net.URLEncoder.encode(koreanMsg) %>">�ѱ� �޽���</a>

</body>
</html>

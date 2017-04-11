<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="formName"%>
<%@ attribute name="nameOfPageNo" required="true"%>
<%@ attribute name="nameOfPageSize"%>
<%@ attribute name="isDisplayPageSizeEditor"%>
<%@ attribute name="totalCount" required="true"%>
<%@ attribute name="pageSize"%>
<%@ attribute name="pagesSize"%>
<%@ attribute name="exclusionParamNames"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ww" uri="/webwork"%>

<%-- 만일 formName 속성으로 값이 들어오면 navigator의 페이지 번호를 누를때 동적으로 그 폼에 pageNo에 관한
input 요소를 추가하고 폼을 전송한다. 들어오지 않으면 url에 pageNo 파라미터를 붙여서 호출한다.
nameOfPageNo 속성은 action에 전달될 페이지 번호의 파라미터 이름을 의미하고 그 이름을 여기 navigator에서
현재 페이지 번호로 인식한다. exclusionParamNames 속성은 파라미터중 제외시킬 파라미터를 ','로 나열한다. --%>

<%-- 페이지 크기(한 화면에 나타낼 행 수) --%>
<c:choose>
	<c:when test="${empty pageSize}">
		<%-- 페이지 크기는 기본이 10이다. --%>
		<c:set var="pageSize" value="10" />
	</c:when>
</c:choose>

<%-- 페이지 범위 크기(navigator에 한번에 나타낼 페이지 번호 개수) --%>
<c:choose>
	<c:when test="${empty pagesSize}">
		<c:set var="pagesSize" value="10" />
	</c:when>
</c:choose>

<%-- 페이지 개수 --%>
<fmt:parseNumber var="totalPageCount" integerOnly="true"
	value="${((totalCount - 1) / pageSize) + 1}" />

<%-- 현재 페이지 번호--%>
<c:choose>
	<c:when test="${empty param[nameOfPageNo]}">
		<c:set var="pageNo" value="1" />
	</c:when>
	<c:otherwise>
		<c:set var="pageNo" value="${param[nameOfPageNo]}" />
	</c:otherwise>
</c:choose>

<%-- 화면에 표시할 시작 페이지 번호와 끝 페이지 번호 --%>
<fmt:parseNumber var="startPageNo" integerOnly="true"
	value="${(pageNo - 1) / pagesSize}" />
<c:set var="startPageNo" value="${(startPageNo * pagesSize) + 1}" />
<c:set var="endPageNo" value="${startPageNo + pagesSize - 1}" />
<c:if test="${endPageNo > totalPageCount}">
	<c:set var="endPageNo" value="${totalPageCount}" />
</c:if>

<%-- 페이지 번호 표시 --%>
<ul class="paginate">
	<c:choose>
	<c:when test="${startPageNo > 1}">
		<a href="#" onclick="javascript:navigator_goPage(1);">&lt;&lt;</a>
		<a href="#" onclick="javascript:navigator_goPage(${startPageNo - 1});">&lt;</a>
	</c:when>
	<c:otherwise>
		<span>&lt;&lt;</span>
		<span>&lt;</span>
	</c:otherwise>
	</c:choose>
	
	<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
		<c:choose>
			<c:when test="${pageNo == i}">
				<span>${i}</span>
			</c:when>
			<c:otherwise>
				<a href="javascript:navigator_goPage(${i});">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<c:if test="${isDisplayPageSizeEditor}">
		<input size="3" type="text" id="psh.pageSize" name="${nameOfPageSize}" value="${pageSize}"/>
		<input type="button" value="pageSize" onclick="javascript:navigator_goPage(${pageNo});"/>
	</c:if>

	<c:choose>
	<c:when test="${endPageNo < totalPageCount}">
		<a href="#" onclick="javascript:navigator_goPage(${endPageNo + 1});">&gt;</a>
		<a href="#" onclick="javascript:navigator_goPage(${totalPageCount});">&gt;&gt;</a>
	</c:when>
	<c:otherwise>
		<span>&gt;</span>
		<span>&gt;&gt;</span>
	</c:otherwise>
	</c:choose>
<!-- /.paginate --></ul>

<script type="text/javascript">
<!--
function navigator_goPage(pageNo) {
<c:choose>	
	<c:when test="${empty formName}">
		var formerQ = "?${nameOfPageNo}=" + pageNo;

		var formerQ2 = "";
		<c:if test="${isDisplayPageSizeEditor}">
			var el = document.getElementById("psh.pageSize");
			formerQ2 = "&${nameOfPageSize}=" + el.value;
		</c:if>
		
		<%-- 쿼리스트링 만들때 제외시킬 파라미터들 --%>
		<c:set var="paramNames" value="${fn:split(exclusionParamNames, ',')}" />
		
		<c:forEach items="${pageContext.request.parameterNames}" var="item">
			<%-- 최종 테스트 결과 값 저장함. 기본이 쿼리스트링 만들때 추가한다는 뜻. --%>
			<c:set var="canAdd" value="true"/>
			
			<%-- 현 url에 존재하는 파라미터중에 제외시킬 파라미터가 있다면 --%>
			<c:forEach items="${paramNames}" var="paramName">
				<c:if test="${item == paramName}">
					<c:set var="canAdd" value="false"/>
				</c:if>
			</c:forEach>
			
			<%-- item 파라미터 키가 nameOfPageNo 값과 같다면 이 페이지 번호의 파라미터는 위에서 추가했음으로 제외 --%>
			<c:if test="${item == nameOfPageNo}">
				<c:set var="canAdd" value="false"/>
			</c:if>

			<%-- 결국 모든 테스트를 다 통과하면 쿼리스트링 만드는 곳에 추가한다. --%>
			<c:if test="${canAdd == true}">
				<c:set var="latterQ" value="${latterQ}&${item}=${param[item]}"/>
			</c:if>
		</c:forEach>		

		// url중 쿼리스트링부분만을 가지고 호출하면 현 url로 가게 됨.
		document.location.href=formerQ + formerQ2 + '${latterQ}';
	</c:when>
	<c:otherwise>
		// pageNo 파라미터를 넘길 수 있게 동적으로 노드 만들기.
		var tag = "<input type='hidden' name='${nameOfPageNo}' value='" + pageNo + "'>";
		${formName}.insertAdjacentHTML("BeforeEnd", tag);

		<c:if test="${isDisplayPageSizeEditor}">
			var el = document.getElementById("psh.pageSize");
			var tag2 = "<input type='hidden' name='${nameOfPageSize}' value='" + el.value + "'>";
			${formName}.insertAdjacentHTML("BeforeEnd", tag2);
		</c:if>
		
		${formName}.submit();
	</c:otherwise>
</c:choose>	
}
//-->
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guest.model.*,guest.service.*" %>   
<%@ page import="java.util.List" %>
  
<%

	String pNum = request.getParameter("page");
	// 전체 메세지 레코드 검색 
	// ListMessageService : 클래스로 중간매체 역할 (memberdao와 savemessage) => 뷰 화면이 아니므로 db를 
	ListMessageService service = ListMessageService.getInstance();
	List <Message> mList =  service.getMessageList(pNum);
	
	int totalPageCount = service.getTotalPage();	// 페이지 카운트하는 변수 선언
	
	int pageNum = 1;
	if(pNum != null){
		pageNum = Integer.parseInt(pNum);
	}
	
	
 	 
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 목록 </title>
</head>
<body>

	<% if( mList.isEmpty() ) { %>
		남겨진 메세지가 하나도~~없습니다. <br>
	<% } else { %>
	<table border="1">
	
		<% for(Message m : mList) { %>	<!-- mList 배열에 저장 된 입력 된 데이터를 반복문을 돌려 m에 각각 저장 -->
		<tr>	
			<td> <%= m.getMessageId() %> </td> 	<!-- m에 저장 된 id 값 받아옴 -->
			<td> <%= m.getGuestName() %> </td> 
			<td><a href= "deleteMessage.jsp?messageId=<%= m.getMessageId()%>">[삭제]</a></td>	
										<!--이동 할 링크? 가져갈 데이터의 파라미터명 & 파라미터의 값 부여 -->		
		</tr>
		<tr>
			<td colspan='3'> 
			<textarea cols=35 rows=3 style="font-family: '돋움', '돋움체'; font-size: 10pt; font-style: normal; line-height: normal; color: #003399;background-color:#D4EBFF;border:1 solid #00009C;">
			<%= m.getMessage() %>
			</textarea>
			</td>
		</tr>
		<% } %>
	</table>
	
	<% } // end if-else %>

	<a href="insertMessage.jsp">글쓰기</a>
	<hr/>
	<%if(pageNum>=1){%>
	<button onclick="location.href='listMessage.jsp?page=<%=pageNum-1%>'"><</button> 	<!-- 페이지가 1이상의 값이 받아져올때 리스트 목록에 해당하는 페이지 번호에 -1한 값을 넘겨줌 -->
	<% }else {%> 
	<button><</button>	<!-- 페이지가 1페이지보다 작은 값으로 받아져올때 버튼에 이벤트를 추가하지 않고 버튼의 형식만 나오게 출력 -->
	<%} %>
	<% for(int i=1; i<=totalPageCount; i++){ %>
		<a href="listMessage.jsp?page=<%=i%>">[<%= i %>]</a>
	<% }  // end of for %>
	<%if(pageNum<totalPageCount){%>
	<button onclick="location.href='listMessage.jsp?page=<%=pageNum+1%>'">></button>
	<%}else{%>
	<button>></button>
	<%} %>
</body>
</html>
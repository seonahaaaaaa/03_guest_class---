<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 삭제 </title>

<% String mId = request.getParameter("messageId"); %>


</head>
<body>
	<%=mId %>메세지를 삭제하려면 암호를 입력하세요. <br/><br/>
	<form action="deleteConfirm.jsp" method="get">
		<input type='hidden' name='messageId' value='<%=mId%>'/>
			<!-- deleteConfirm.jsp 서버로 이동할때 이전에 받아온 messageId는 자동으로 받아오지 못하기 때문에 hidden 타입으로 가져옴 -->
		암호 : <input type="password" name="password" />
		<input type="submit" value="메세지 삭제"/>
	</form>
</body>
</html>
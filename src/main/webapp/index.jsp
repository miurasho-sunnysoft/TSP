<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<html>

<h2>Hello World!</h2>
<body>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<p><a href="<%=basePath%>ServletTest">Hello Servlet</a></p>
<p>This is a paragraph.</p>
<form action="#" method="post">
���O�F<input type="text" name="name" size="20"><br>
�p�X���[�h�F<input type="password" name="password" size="20"><br>
���ʁF<input type="radio" name="sex" value="male">Male
<input type="radio" name="sex" value="female">Female<br>
<input type="submit" value="Submit">
</form>
<p>��������w�������擾����</p>
<form action="<%=basePath%>ServletTest" method="post">
�w��ID�F<input type="text" name="sid" size="20"><br>
<input type="submit" value="Submit">
</form>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tsm.Teacher" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>教師情報更新</title>
</head>
<body>
    <h1>教師情報更新</h1>
    <form action="update" method="post">
        <input type="hidden" name="id" value="<%= ((Teacher) request.getAttribute("teacher")).getId() %>">
        <label>名前:</label>
        <input type="text" name="name" value="<%= ((Teacher) request.getAttribute("teacher")).getName() %>"><br>
        <label>年齢:</label>
        <input type="text" name="age" value="<%= ((Teacher) request.getAttribute("teacher")).getAge() %>"><br>
        <label>性別:</label>
        <input type="text" name="sex" value="<%= ((Teacher) request.getAttribute("teacher")).getSex() %>"><br>
        <label>コース:</label>
        <input type="text" name="course" value="<%= ((Teacher) request.getAttribute("teacher")).getCourse() %>"><br>
        <input type="submit" value="更新">
    </form>
</body>
</html>

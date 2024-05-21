<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>教師情報登録</title>
</head>
<body>
    <h1>教師情報登録</h1>
    <form action="insert" method="post">
        <label>名前:</label>
        <input type="text" name="name"><br>
        <label>年齢:</label>
        <input type="text" name="age"><br>
        <label>性別:</label>
        <input type="text" name="sex"><br>
        <label>コース:</label>
        <input type="text" name="course"><br>
        <input type="submit" value="登録">
    </form>
</body>
</html>

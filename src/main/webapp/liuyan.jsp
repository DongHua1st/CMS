<%--
  Created by IntelliJ IDEA.
  User: 57555
  Date: 2023/6/28
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="gb2312"%>
<html>
<head>
    <title>���԰�</title>
    <style>
        body{
            background-image: url("CSS/icon/liuyan_back.png");
            background-size: 100% 100%;
            background-attachment: fixed;
        }
    </style>
</head>
<body>
    <form action="addServlet" method="post">
        <div style="position: relative;
	            margin: 20% auto;">
            <table border="1" style="margin: 0 auto;">
                <caption>��д������Ϣ</caption>
                <tr><td>���Ա���</td>
                    <td><input type="text" name="title"/></td></tr>
                <tr><td>��������</td>
                    <td><textarea name="content" rows="5" cols="35"></textarea></td></tr>
            </table>
            <div style="text-align: center">
                <input type="submit" value="�ύ" style="margin: 0 auto;"/>
                <input type="reset" value="����" style="margin: 0 auto;"/>
            </div>
        </div>
    </form>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: 57555
  Date: 2023/6/28
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="model.Liuyan"%>
<%@page import="db.DB"%>
<html>
<head>
    <link rel="stylesheet" href="CSS/main.css">
    <script src="JS/showContent.js"></script>
    <title>�ͻ���Դ����</title>
</head>
<body>
<div class="top-container">
    <h2 class="head-title">�ͻ���Դ����ϵͳ</h2>
</div>
<div class="left-container">
    <div class="head-photo">
        <div class="head-picture">

        </div>
    </div>
    <hr style="margin-top: 0; border-width: 2px">
    <div class="left-title" onclick="showContent(1)">
        <p class="left-title-word">ϵͳ��ҳ</p>
    </div>
    <div class="left-title" onclick="showContent(2)">
        <p class="left-title-word">�ͻ�����</p>
    </div>
    <div class="left-title" onclick="showContent(3)">
        <p class="left-title-word">�ͷ�����</p>
    </div>
    <div class="left-title" onclick="showContent(4)">
        <p class="left-title-word">�г��</p>
    </div>
    <div class="left-title" onclick="showContent(5)">
        <p class="left-title-word">�ճ̰���</p>
    </div>
    <div class="left-title" onclick="showContent(6)">
        <p class="left-title-word">���ݹ���</p>
    </div>
    <div class="left-title" onclick="showContent(7)">
        <p class="left-title-word">ϵͳ����</p>
    </div>
</div>
<div class="right-container">
    <div id="content1" style="display: block">ϵͳ��ҳ</div>
    <div id="content2" style="display: none">�ͻ�����</div>
    <div id="content3" style="display: none">�ͷ�����</div>
    <div id="content4" style="display: none">�г��</div>
    <div id="content5" style="display: none">�ճ̰���</div>
    <div id="content6" style="display: none">���ݹ���</div>
    <div id="content7" style="display: none">ϵͳ����</div>
</div>
</body>
</html>


<%--
  Created by IntelliJ IDEA.
  User: 57555
  Date: 2023/6/28
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="db.DB"%>
<%@ page import="model.CS" %>
<html>
<head>
    <link rel="stylesheet" href="CSS/main.css">
    <script src="JS/showContent.js"></script>
    <script src="JS/addCustomer.js"></script>
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
    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close-button" onclick="closeModal()">&times;</span>
            <form>
                <label for="name">������</label>
                <input type="text" id="name" name="name"><br><br>
                <label for="gender">�Ա�</label>
                <select id="gender" name="gender">
                    <option value="��">��</option>
                    <option value="Ů">Ů</option>
                </select><br><br>

                <label for="phone">�绰��</label>
                <input type="text" id="phone" name="phone"><br><br>

                <label for="email">���䣺</label>
                <input type="email" id="email" name="email"><br><br>

                <label for="address">��ַ��</label>
                <input type="text" id="address" name="address"><br><br>

                <label for="category">���</label>
                <select id="category" name="category">
                    <option value="�ͻ�">���пͻ�</option>
                    <option value="VIP�ͻ�">Ǳ�ڿͻ�</option>
                </select><br><br>

                <button type="submit">�ύ</button>
            </form>
        </div>
    </div>
    <div id="content1" style="display: block">

    </div>
    <!--      �ͻ�����-->
    <div id="content2" style="display: none">
        <div class="em_menu">
            <h3 style="display: inline-block">�ͻ�������Ϣ</h3>
            <input id="add_cs" type="button" value="�����ͻ�" onclick="add_cs()">
        </div>
        <div id="cs_table_container">
            <table id="cs_table">
                <tr style="background-color: cornflowerblue">
                    <td>����</td>
                    <td width="50">�Ա�</td>
                    <td width="150">�绰</td>
                    <td>����</td>
                    <td>��ַ</td>
                    <td>���</td>
                    <td>����</td>
                    <td colspan="2" width="40">����</td>
                </tr>
                <%
                    ArrayList al=(ArrayList)session.getAttribute("al");
                    Iterator iter=al.iterator();
                    while(iter.hasNext()){
                        CS cs=(CS)iter.next();
                %>
                <tr>
                    <td><%= cs.getCs_name() %></td>
                    <td><%= cs.getCs_sex() %></td>
                    <td><%= cs.getCs_phone() %></td>
                    <td><%= cs.getCs_email() %></td>
                    <td><%= cs.getCs_address() %></td>
                    <td><%= cs.getCs_kind() %></td>
                    <td><%= cs.getCs_remark() %></td>
                    <td><input type="button" value="�޸�"></td>
                    <td><input type="button" value="ɾ��"></td>
                </tr>
                    <%
                        }
                    %>
            </table>
        </div>
    </div>
    <div id="content3" style="display: none">�ͷ�����</div>
    <div id="content4" style="display: none">�г��</div>
    <div id="content5" style="display: none">�ճ̰���</div>
    <div id="content6" style="display: none">���ݹ���</div>
    <div id="content7" style="display: none">ϵͳ����</div>
</div>
</body>
</html>


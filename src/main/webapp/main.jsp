<%--
  Created by IntelliJ IDEA.
  User: 57555
  Date: 2023/6/28
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="db.DB"%>
<%@ page import="model.CS" %>
<html>
    <head>
<%--        �˴�����ǿ�Ƽ���CSS���ԣ�ȫ���깤�����ɾ��--%>
        <link rel="stylesheet" type="text/css" href="CSS/main.css?v=<%= System.currentTimeMillis() %>">
        <script charset="utf-8" src="JS/showContent.js"></script>
        <script charset="utf-8"  src="JS/CRUD_Cs.js"></script>
        <title>�ͻ���Դ����</title>
    </head>
    <body>
        <div class="top-container">
            <h2 class="head-title">�ͻ���Դ����ϵͳ</h2>
        </div>
    <%--    ��೤������--%>
        <div class="left-container">
        <%--    ���ͷ������--%>
            <div class="head-photo">
                <div class="head-picture">

                </div>
            </div>
            <hr style="margin-top: 0; border-width: 2px">
        <%--    ����������--%>
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
        <%--�Ҳ�����������--%>
        <div class="right-container" >
        <%--    ϵͳ��ҳ��Ӧ���Ҳ�ҳ��--%>
            <div id="content1" style="display: block">

            </div>
        <!--      �ͻ������Ӧ���Ҳ�ҳ��-->
            <div id="content2" style="display: none">
        <%--        ��������--%>

                <div class="em_menu">
                    <h3 style="display: inline-block">�ͻ�������Ϣ</h3>
                    <input id="add_cs" type="button" value="�����ͻ�" onclick="add_cs()">
                </div>
                <%--    �����ͻ���ť����Ӧdiv��Ĭ������--%>
                <div id="modal" class="modal">
                    <div class="modal-content">
                        <span class="close-button" onclick="closeModal()">&times;</span>
                        <form action="addCsServlet" method="post">
                            <label for="Cs_id">&nbsp;I&nbsp;D��&nbsp;</label>
                            <input type="text" id="Cs_id" name="Cs_id"><br><br>
                            <label for="Cs_name">������</label>
                            <input type="text" id="Cs_name" name="Cs_name"><br><br>
                            <label for="Cs_sex">�Ա�</label>
                            <select id="Cs_sex" name="Cs_sex">
                                <option id="man" value="��">��</option>
                                <option id="woman" value="Ů">Ů</option>
                            </select><br><br>
                            <label for="phone">�绰��</label>
                            <input type="text" id="phone" name="Cs_phone"><br><br>

                            <label for="email">���䣺</label>
                            <input type="email" id="email" name="Cs_email"><br><br>

                            <label for="address">��ַ��</label>
                            <input type="text" id="address" name="Cs_address"><br><br>

                            <label for="kind">���</label>
                            <select id="kind" name="Cs_kind">
                                <option value="���пͻ�">���пͻ�</option>
                                <option value="Ǳ�ڿͻ�">Ǳ�ڿͻ�</option>
                            </select><br><br>

                            <label for="remark">������</label>
                            <input type="text" id="remark" name="Cs_remark"><br><br>
                            <button type="submit" id="cs_submit_btn" name="Cs_btn" value="�ύ">�ύ</button>
                            <button type="submit" id="cs_modify_btn" name="Cs_btn" value="�޸�" style="display: none">�޸�</button>
                        </form>
                    </div>
                </div>
                <%--    �û����������--%>
                <div id="cs_table_container">
                    <table id="cs_table">
                        <tr style="background-color: cornflowerblue">
                            <td>ID</td>
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
                            ArrayList al=new DB().findCsInfo();
                            Iterator iter=al.iterator();
//                          ����ȷ������һ�еİ�ť
                            int i = 0;
                            while(iter.hasNext()){
                                CS cs=(CS)iter.next();
                                i++;
                        %>
                        <tr>
                            <td><%= cs.getCs_id()%></td>
                            <td><%= cs.getCs_name() %></td>
                            <td><%= cs.getCs_sex() %></td>
                            <td><%= cs.getCs_phone() %></td>
                            <td><%= cs.getCs_email() %></td>
                            <td><%= cs.getCs_address() %></td>
                            <td><%= cs.getCs_kind() %></td>
                            <td><%= cs.getCs_remark() %></td>
                            <td><input type="button" value="�޸�" class="cs_modify" onclick="modify_cs(<%= i%>)"></td>
                            <td><input type="button" value="ɾ��" class="cs_modify" onclick="delete_cs(<%= i%>)"></td>
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


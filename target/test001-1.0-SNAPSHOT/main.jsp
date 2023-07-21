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
<%@ page import="javax.lang.model.type.ArrayType" %>
<%@ page import="model.EM" %>
<html>
    <head>
<%--        �˴�����ǿ�Ƽ���CSS���ԣ�ȫ���깤�����ɾ��--%>
        <link rel="stylesheet" type="text/css" href="CSS/main.css?v=<%= System.currentTimeMillis() %>">
        <script charset="utf-8" src="JS/showContent.js?v=<%= System.currentTimeMillis() %>"></script>
        <script charset="utf-8"  src="JS/CRUD_Cs.js?v=<%= System.currentTimeMillis() %>"></script>
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
                <p class="left-title-word">Ա������</p>
            </div>
        </div>
        <%--�Ҳ�����������--%>
        <div class="right-container" class="main_content">
        <%--    ϵͳ��ҳ��Ӧ���Ҳ�ҳ��--%>
            <div id="content1" style="display: block">

            </div>
        <!--      �ͻ������Ӧ���Ҳ�ҳ��-->
            <div id="content2" style="display: none" class="main_content">
        <%--        ��������--%>
                <div class="em_menu">
                    <h3 style="display: inline-block">�ͻ�������Ϣ</h3>
                    <select id="cs_classify_select">
                        <option value="cs_id">ID</option>
                        <option value="cs_name">����</option>
                        <option value="cs_sex">�Ա�</option>
                        <option value="cs_phone">�绰</option>
                        <option value="cs_email">����</option>
                        <option value="cs_address">��ַ</option>
                        <option value="cs_kind">���</option>
                    </select>
                    <input id="cs_classify_outer" readonly>
                    <input id="cs_classify_inner" >
                    <input id="cs_classify_btn" type="submit" value="" onclick="classifyCs()">
                    <input class="refresh-button" type="button" onclick="cs_refresh_page()">
                    <input id="add_cs" type="button" value="�����ͻ�" onclick="add_cs()">
                    <input id="print_cs_table" type="button" value="��ӡ���" onclick="print_cs_table()">
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
                            <button type="submit" class="cs_btn" id="cs_submit_btn" name="Cs_btn" value="�ύ" >�ύ</button>
                            <button type="submit" class="cs_btn" id="cs_modify_btn" name="Cs_btn" value="�޸�" style="display: none;">�޸�</button>
                        </form>
                    </div>
                </div>
                <%--    �û����������--%>
                <div id="cs_table_container">
                    <table id="cs_table">
                        <tr style="background-color: cornflowerblue">
                            <th>ID</th>
                            <th>����</th>
                            <th width="50">�Ա�</th>
                            <th width="150">�绰</th>
                            <th>����</th>
                            <th>��ַ</th>
                            <th>���</th>
                            <th>����</th>
                            <th colspan="3" >����</th>
                        </tr>
                        <%
                            ArrayList cs_al1=new DB().findCsInfo();
                            Iterator cs_iter=cs_al1.iterator();
                            ArrayList cs_al2;
                            if(session.getAttribute("cs_al") != null){
                                cs_al2 = (ArrayList) session.getAttribute("cs_al");
                                cs_iter = cs_al2.iterator();
                            }
//                          ����ȷ������һ�еİ�ť
                            int cs_i = 0;
                            while(cs_iter.hasNext()){
                                CS cs=(CS)cs_iter.next();
                                cs_i++;
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
                            <td width="25"><input type="button" value="�޸�" class="cs_modify" onclick="modify_cs(<%= cs_i%>)"></td>
                            <td width="25"><input type="button" value="ɾ��" class="cs_modify" onclick="delete_cs(<%= cs_i%>)"></td>
                            <td width="25"><input type="button" value="��ӡ" class="cs_modify" onclick="print_cs(<%= cs_i%>)"></td>
                        </tr>
                            <%
                            }
                            %>
                    </table>
                </div>
            </div>
            <div id="content3" style="display: none" class="main_content">

            </div>
            <div id="content4" style="display: none" class="main_content">�г��</div>
            <div id="content5" style="display: none" class="main_content">�ճ̰���</div>
            <div id="content6" style="display: none" class="main_content">���ݹ���</div>
            <div id="content7" style="display: none" class="main_content">
                <div class="em_menu">
                    <h3 style="display: inline-block">�ͻ�������Ϣ</h3>
                    <select id="em_classify_select">
                        <option value="em_id">ID</option>
                        <option value="em_name">����</option>
                        <option value="em_gender">�Ա�</option>
                        <option value="em_age">����</option>
                        <option value="em_position">ְλ</option>
                        <option value="em_department">����</option>
                        <option value="em_phone">�绰</option>
                        <option value="em_email">����</option>
                    </select>
                    <input id="em_classify_outer" readonly>
                    <input id="em_classify_inner" >
                    <input id="em_classify_btn" type="submit" value="" onclick="classifyEm()">
                    <input class="refresh-button" type="button" onclick="em_refresh_page()">
                    <input id="add_em" type="button" value="���Ա��" onclick="add_em()">
                    <input id="print_em_table" type="button" value="��ӡ���" onclick="print_em_table()">
                </div>
                <%--    ���Ա����ť����Ӧdiv��Ĭ������--%>
                <div id="em_modal" class="em_modal">
                    <div class="modal-content">
                        <span class="close-button" onclick="closeEmModal()">&times;</span>
                        <form action="addEmServlet" method="post">
                            <label for="em_id">&nbsp;I&nbsp;D��&nbsp;</label>
                            <input type="text" id="em_id" name="em_id"><br><br>
                            <label for="em_name">������</label>
                            <input type="text" id="em_name" name="em_name"><br><br>
                            <label for="em_gender">�Ա�</label>
                            <select id="em_gender" name="em_gender">
                                <option  value="��">��</option>
                                <option  value="Ů">Ů</option>
                            </select><br><br>
                            <label for="em_age">���䣺</label>
                            <input type="text" id="em_age" name="em_age"><br><br>

                            <label for="em_position">ְλ��</label>
                            <input type="text" id="em_position" name="em_position"><br><br>

                            <label for="em_department">���ţ�</label>
                            <input type="text" id="em_department" name="em_department"><br><br>

                            <label for="em_phone">�绰��</label>
                            <input type="text" id="em_phone" name="em_phone"><br><br>

                            <label for="em_email">���䣺</label>
                            <input type="email" id="em_email" name="em_email"><br><br>
                            <button type="submit" class="em_btn" id="em_submit_btn" name="em_btn" value="�ύ" >�ύ</button>
                            <button type="submit" class="em_btn" id="em_modify_btn" name="em_btn" value="�޸�" style="display: none;">�޸�</button>
                        </form>
                    </div>
                </div>
                <%--    �û����������--%>
                <div id="em_table_container">
                    <table id="em_table">
                        <tr style="background-color: cornflowerblue">
                            <th>ID</th>
                            <th>����</th>
                            <th width="50">�Ա�</th>
                            <th width="50">����</th>
                            <th>ְλ</th>
                            <th>����</th>
                            <th>�绰</th>
                            <th>����</th>
                            <th colspan="3" >����</th>
                        </tr>
                        <%
                            ArrayList em_al1=new DB().findEmInfo();
                            Iterator em_iter=em_al1.iterator();
                            ArrayList em_al2;
                            if(session.getAttribute("em_al") != null){
                                em_al2 = (ArrayList) session.getAttribute("em_al");
                                em_iter = em_al2.iterator();
                            }
//                          ����ȷ������һ�еİ�ť
                            int em_i = 0;
                            while(em_iter.hasNext()){
                                EM em=(EM)em_iter.next();
                                em_i++;
                        %>
                        <tr>
                            <td><%= em.getEm_id()%></td>
                            <td><%= em.getEm_name() %></td>
                            <td><%= em.getEm_gender() %></td>
                            <td><%= em.getEm_age() %></td>
                            <td><%= em.getEm_position() %></td>
                            <td><%= em.getEm_department() %></td>
                            <td><%= em.getEm_phone() %></td>
                            <td><%= em.getEm_email() %></td>
                            <td width="25"><input type="button" value="�޸�" class="cs_modify" onclick="modify_em(<%= em_i%>)"></td>
                            <td width="25"><input type="button" value="ɾ��" class="cs_modify" onclick="delete_em(<%= em_i%>)"></td>
                            <td width="25"><input type="button" value="��ӡ" class="cs_modify" onclick="print_em(<%= em_i%>)"></td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>


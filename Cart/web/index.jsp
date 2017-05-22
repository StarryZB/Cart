<%@ page import="com.entity.cart" %>
<%@ page import="com.entity.item" %>
<%@ page import="com.util.DBHelper" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: 34432
  Date: 2017/5/19
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index</title>
</head>
<body>
<%
    String sql = "select * from item";
    Connection conn = DBHelper.getConn();
    if(conn == null) {
        System.out.println("----------------------------");
    }
    Statement stmt = DBHelper.createStmt(conn);
    ResultSet rs = DBHelper.executeQuery(stmt,sql);
    List<item> items = new ArrayList<item>();
    try {
        while (rs.next()) {
            item it = new item();
            it.setName(rs.getString("name"));
            it.setId(rs.getInt("id"));
            it.setPrice(rs.getInt("price"));
            it.setPlace(rs.getString("place"));
            items.add(it);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        DBHelper.closers(rs);
        DBHelper.closestmt(stmt);
        DBHelper.closeconn(conn);
    }

%>

<%
    Iterator<item> i= items.iterator();
    while (i.hasNext()){
        item m = i.next();
%>
    <div align="center">
        <form method="post" action="CartServlet.do">
        Name : <%=m.getName()%><br>
        ID : <%=m.getId()%><br>
        Price : <%=m.getPrice()%><br>
        Place : <%=m.getPlace()%><br>
        Numbers : <input type="number" name="numbers" value="0" min="0" step="1"><br>
            <input type="hidden" name="name" value="<%=m.getName()%>">
            <input type="hidden" name="id" value="<%=m.getId()%>">
            <input type="hidden" name="price" value="<%=m.getPrice()%>">
            <input type="hidden" name="place" value="<%=m.getPlace()%>">
            <input type="hidden" name="m" value="<%=m%>">
            <input type="SUBMIT" name="submit" value="Buy"><br>
        </form>
    </div>
<%
    }
%>
</body>
</html>

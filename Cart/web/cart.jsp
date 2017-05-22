<%@ page import="com.entity.cart" %>
<%@ page import="com.entity.item" %>
<%@ page import="java.util.*" %><%--
  Created by IntelliJ IDEA.
  User: 34432
  Date: 2017/5/19
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart</title>
</head>
<body>
<%
    double sum = (double)session.getAttribute("sum");
    int id = (int)request.getAttribute("id");
    String idName = Integer.toString(id);
    int num = (int)session.getAttribute(idName);
    cart cart = (cart)session.getAttribute("cart");
    List<item> it = cart.getLists();
    Map<String,item> map = new HashMap<String,item>();
%>

Sum : <%=sum%><br>
Your cart :
<%
    Iterator<item> i = it.iterator();
    while (i.hasNext()){
        item m = i.next();
        String name = m.getName();
        map.put(name,m);
        request.setAttribute("map",map);
        request.setAttribute("sum_num",idName);

%>
<div align="center">
    <form method="post" action="CartServlet.do">
        Name : <%=m.getName()%><br>
        ID : <%=m.getId()%><br>
        Price : <%=m.getPrice()%><br>
        Place : <%=m.getPlace()%><br>
        Number : <%=num%><br>
    </form>
</div>
<%
    }
    request.getRequestDispatcher("sum.jsp").forward(request,response);
%>
</body>
</html>

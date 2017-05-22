<%@ page import="com.entity.item" %>
<%@ page import="java.util.*" %><%--
  Created by IntelliJ IDEA.
  User: 34432
  Date: 2017/5/21
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sum</title>
</head>
<body>
<a href="index.jsp">Back</a> <br>

<%
    Map<String,item> map = (Map<String, item>) request.getAttribute("map");
    Set<String> set = map.keySet();
    List<Integer> msum = new ArrayList<Integer>();
    Iterator<String> i = set.iterator();
    int total_sum = 0;
    int flag = 0;
    int sum = 0;
    while (i.hasNext()) {
        String key = i.next();
        item m = map.get(key);
        String id = Integer.toString(m.getId());
        int num = (int)session.getAttribute(id);
        sum = num * (int)m.getPrice();
        msum.add(sum);
        flag = flag + 1;
%>

<div align="center">
    <form method="post" action="CartServlet.do">
        Name : <%=m.getName()%><br>
        ID : <%=m.getId()%><br>
        Price : <%=m.getPrice()%><br>
        Place : <%=m.getPlace()%><br>
        Number : <%=num%><br>
        Sum : <%=sum%>
    </form>

</div>
<%
    }
    Iterator<Integer> in = msum.iterator();
    while (in.hasNext()) {
        int t = in.next();
        total_sum += t;
    }
%>
<div align="center">
    Total amount : <%=total_sum%>
</div>

</body>
</html>

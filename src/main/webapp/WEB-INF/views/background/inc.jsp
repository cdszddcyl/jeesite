<%@ page import="java.net.InetAddress" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/5/20
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<input   type="hidden" id="serviceIp"   name="serviceIp"   value="<%=InetAddress.getLocalHost().getHostAddress()%>">
<input   type="hidden" id="servicePort"   name="serviceIp"   value="<%=request.getServerPort()%>">
<script>
    var serviceIP = document.getElementById("serviceIp").value;
    var servicePort = document.getElementById("servicePort").value;
    //document.domain=serviceIP+":"+servicePort;
</script>
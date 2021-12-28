<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<header class="search">
    <a href="/${contextPath}" class="logo">
<%--        <img src="https://s2.loli.net/2021/12/28/7u1gA3yHG9YOINd.jpg" style="width: 201px;height: 83px;margin-left: 24px;border-radius: 3%">--%>
    </a>
    <div class="search">
        <form action="search" >
        <input type="text" placeholder="搜索 课程" name="keyword">
        <button class="search-button" type="submit">搜索</button>
        </form>
        <ul class="search-below">
            <c:forEach items="${categories}" var="c" varStatus="vs">
                <li><a href="category?cid=${c.id}">${c.name}</a></li>
            </c:forEach>
        </ul>

    </div>

</header>
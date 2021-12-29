<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>


<script src="js/index.js"></script>

<header class="index-top">
    <a href="/" class="logo">
        <img src="https://s2.loli.net/2021/12/29/hD172qzn9avJExF.png" style="width: 201px;height: 133px;margin-left: 24px;border-radius: 3%">
    </a>
    <div class="search">
        <div>
            <form action="search" >
                <input type="text" placeholder="搜索 课程" name="keyword">
                <button class="search-button" type="submit">搜索</button>
            </form>
            <ul class="search-below">
                <c:forEach items="${categories}" var="c" varStatus="vs">
                    <c:if test="${vs.count>=1 and vs.count<=8}">
                        <li><a href="category?cid=${c.id}">${c.name}</a></li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
    </div>

</header>
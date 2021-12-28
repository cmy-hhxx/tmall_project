<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>


<section class="head-bar">
    <div class="c-menu">
        <span class="glyphicon glyphicon-th-list icon"></span>
        <span>商品分类</span>
    </div>
    <div class="r-menu">
<%--        <a href="#nowhere"><img src="img/chaoshi.png"></a>--%>
<%--        <a href="#nowhere"><img src="img/guoji.png"></a>--%>
        <c:forEach items="${categories}" var="c" varStatus="vs">
            <c:if test="${vs.count>=1 and vs.count<=4}">
                <button class="btn-xs"><a href="category?cid=${c.id}">${c.name}</a></button>
            </c:if>
        </c:forEach>
    </div>
</section>

<section class="carousel">
    <div data-ride="carousel" class="carousel-of-product carousel slide" id="carousel-of-product" >
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li class="active" data-slide-to="0" data-target="#carousel-of-product"></li>
            <li data-slide-to="1" data-target="#carousel-of-product" class=""></li>
            <li data-slide-to="2" data-target="#carousel-of-product" class=""></li>
            <li data-slide-to="3" data-target="#carousel-of-product" class=""></li>
        </ol>
        <!-- Wrapper for slides -->
        <div role="listbox" class="carousel-inner">
            <div class="item active">
                <img src="https://s2.loli.net/2021/12/25/Ez28CShyKevqG31.jpg" class="carousel carousel-image" style="width: 1200px">
            </div>
            <div class="item">
                <img src="https://s2.loli.net/2021/12/16/RDy5PdCjJX3T1Vw.jpg" class="carousel-image" style="width: 1200px">
            </div>
            <div class="item">
                <img src="https://i.loli.net/2021/11/27/G3JMi9nt7SP2Iwv.png" class="carousel-image" style="width: 1200px">
            </div>
            <div class="item">
                <img src="https://s2.loli.net/2021/12/28/Ri3LObWY6ThVlPm.jpg" class="carousel-image" style="width: 1200px">
            </div>
        </div>

        <div class="m-menu">
            <ul>
            <c:forEach items="${categories}" var="c" varStatus="vs">
                <c:if test="${vs.count>=1 and vs.count<=13}">
                    <li cid="${c.id}"><span class="glyphicon glyphicon-link"></span><a href="#nowhere">${c.name}</a></li>
                </c:if>
            </c:forEach>
            </ul>
        </div>
        <c:forEach items="${categories}" var="c" varStatus="vs">
        <div class="d-menu" cid="${c.id}" style="display: none">
            <c:forEach items="${c.products}" var="p" varStatus="vs">
                <a href="product?pid=${p.id}">${p.subTitle}</a>
            </c:forEach>
        </div>
        </c:forEach>
    </div>

</section>

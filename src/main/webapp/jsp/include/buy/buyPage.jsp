<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<script>
    $(function () {
        $(".comment-input").click(function () {
            $(this).css({"height":"57px","border":"1px solid #ff0036"});
        });
        $(".address-table input,.address-table textarea").keyup(function () {
            $("#address-text").text($("textarea[name=address]").val());
            $("#name-and-phone").text($("input[name=receiver]").val()+" "+$("input[name=mobile]").val());

        })
    });
</script>
<main class="buy-page">
    <form action="createOrder" method="post">
        <div class="address-tip">输入您的信息</div>
        <table class="address-table">
            <tbody>
            <tr>
                <td class="first-column left-column">邮箱<span class="red-star">*</span></td>
                <td class="right-column"><textarea placeholder="课程资料将通过您的邮箱发送，请注意查收"
                                                   name="address"></textarea></td>
            </tr>
            <tr>
                <td class="left-column">姓名<span class="red-star">*</span></td>
                <td class="right-column"><input type="text" placeholder="长度不超过25个字符" name="receiver"></td>
            </tr>
            <tr>
                <td class="left-column">手机号码 <span class="red-star">*</span></td>
                <td class="right-column"><input type="text" placeholder="请输入11位手机号码" name="mobile"></td>
            </tr>
            </tbody>
        </table>
        <div class="buy-list-tip">确认订单信息</div>
        <table class="buy-list">
            <thead>
            <tr>
                <th class="shop-and-wangwang" colspan="2">
                    <img src="https://s2.loli.net/2021/12/29/rVNnCY1s2Dv9xAb.png" class="tmall-small-png">
                    <a href="#nowhere" class="market-link">店铺：cmy的小店</a>
                </th>
                <th width="120px">单价</th>
                <th width="120px">数量</th>
                <th width="120px">小计</th>
            </tr>
            <tr class="row-border">
                <td colspan="2"></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cartItems}" var="item" varStatus="vs">
            <tr class="buy-item">
                <td class="buy-item-image"><img src="${item.product.url}"></td>
                <td class="buy-item-name"><a href="product?pid=${item.product.id}">${item.product.name}</a>
                    <div class="cart-item-title-bottom">
                        <img title="支持信用卡支付" src="img/creditcard.png">
                        <img title="消费者保障服务,承诺7天退货" src="img/7day.png">
                        <img title="消费者保障服务,承诺如实描述" src="img/promise.png">
                    </div>
                </td>
                <td class="buy-item-price">
                    <span>￥${item.product.nowPrice}</span>
                </td>
                <td class="buy-item-num">
                    <span>${item.number}</span>
                </td>
                <td class="buy-item-sum">
                    <span>￥${item.sum}</span>
                </td>
            <input type="hidden" name="ciid" value="${item.id}">
            </tr>
            </c:forEach>

            </tbody>
        </table>
        <table class="sum-bar">
            <tr>
                <td rowspan="2" width="45%" class="comment-td">给卖家留言：
                    <textarea class="comment-input" name="userMessage" placeholder="选填:对本次交易的说明(建议填写已和卖家协商一致的内容)"></textarea>
                </td>
                <td>
                    运送方式：
                    <select class="delivery-select">
                        <option>快递 免邮费</option>
                    </select>
                    <span class="pull-right deliver-num">0.00</span>
                </td>
            </tr>
            <tr>
                <td class="sum-num-td">
                <span class="pull-right">
                    店铺合计(含运费) <span class="sum-num">￥${total}</span>
                </span>
                </td>
            </tr>
        </table>
        <div class="confirm-frame pull-right">
            <div class="line pull-right">实付款：
                <span class="yen-big">￥</span>
                <span class="price-num">${total}</span>
            </div>
            <div class="pull-right clear line-small">
                <b>寄送至：</b>
                <span id="address-text"></span>
            </div>
            <div class="pull-right clear line-small">
                <b>收货人：</b>
                <span id="name-and-phone"></span>
            </div>
        </div>
        <button class="submit-order pull-right clear" type="submit">
            提交订单
        </button>
    </form>
</main>

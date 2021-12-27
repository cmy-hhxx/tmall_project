<%--
  Created by IntelliJ IDEA.
  User: xen
  Date: 2017/12/9
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    var msg = "${msg}";
    if(msg !== ""){
        alert(msg);
    }
    $(function () {
        $("#refer").val(document.referrer);
        $("#form").submit(function () {
            if($("#password").val() == "" || $("#name").val() == ""){
                alert("用户名或密码为空");
                return false;
            }
            return true;
        });
    });
</script>

<main class="login">
    <div class="login-content">
        <form method="post" action="loginIn" id="form">
        <div class="login-frame">
            <div class="login-tip">密码登录</div>
            <div class="login-input">
        <span class="login-input-icon">
                    <span class=" glyphicon glyphicon-user"></span>
                </span>
                <input type="text" placeholder="手机/会员名/邮箱" name="name" id="name" autofocus>
            </div>
            <div class="login-input">
        <span class="login-input-icon ">
                    <span class=" glyphicon glyphicon-lock"></span>
                </span>
                <input type="password" placeholder="密码" name="password" id="password" >
                <input type="hidden" name="refer" id="refer">
            </div>
        <div class="login-input">
            <span class="login-input-icon ">
                    <span class=" glyphicon glyphicon-camera"></span>
                </span>
            <input type="text" placeholder="验证码" name="verify" id="verify" >
        </div>
            <canvas id="canvas" width="260px" height="50px"></canvas>

            <div class="login-button">
                <button type="submit" class="login-button">登 录</button>
            </div>
            <div class="login-bottom">
                <a href="#nowhere">忘记登录密码</a>
                <a class="" href="register">免费注册</a>
            </div>

        </div>
        </form>
    </div>
    <script>
        //生成随机数
        function randomNum(min,max){
            return Math.floor(Math.random()*(max-min)+min);
        }
        //生成随机颜色RGB分量
        function randomColor(min,max){
            var _r = randomNum(min,max);
            var _g = randomNum(min,max);
            var _b = randomNum(min,max);
            return "rgb("+_r+","+_g+","+_b+")";
        }
        //先阻止画布默认点击发生的行为再执行drawPic()方法
        document.getElementById("canvas").onclick = function(e){
            e.preventDefault();
            drawPic();
        };
        function drawPic(){
            //获取到元素canvas
            var $canvas = document.getElementById("canvas");
            var _str = "0123456789";//设置随机数库
            var _picTxt = "";//随机数
            var _num = 4;//4个随机数字
            var _width = $canvas.width;
            var _height = $canvas.height;
            var ctx = $canvas.getContext("2d");//获取 context 对象
            ctx.textBaseline = "bottom";//文字上下对齐方式--底部对齐
            ctx.fillStyle = randomColor(180,240);//填充画布颜色
            ctx.fillRect(0,0,_width,_height);//填充矩形--画画
            for(var i=0; i<_num; i++){
                var x = (_width-10)/_num*i+10;
                var y = randomNum(_height/2,_height);
                var deg = randomNum(-45,45);
                var txt = _str[randomNum(0,_str.length)];
                _picTxt += txt;//获取一个随机数
                ctx.fillStyle = randomColor(10,100);//填充随机颜色
                ctx.font = randomNum(16,40)+"px SimHei";//设置随机数大小，字体为SimHei
                ctx.translate(x,y);//将当前xy坐标作为原始坐标
                ctx.rotate(deg*Math.PI/180);//旋转随机角度
                ctx.fillText(txt, 0,0);//绘制填色的文本
                ctx.rotate(-deg*Math.PI/180);
                ctx.translate(-x,-y);
            }
            for(var i=0; i<_num; i++){
                //定义笔触颜色
                ctx.strokeStyle = randomColor(90,180);
                ctx.beginPath();
                //随机划线--4条路径
                ctx.moveTo(randomNum(0,_width), randomNum(0,_height));
                ctx.lineTo(randomNum(0,_width), randomNum(0,_height));
                ctx.stroke();
            }
            for(var i=0; i<8; i++){
                ctx.fillStyle = randomColor(0,255);
                ctx.beginPath();
                //随机画原，填充颜色
                ctx.arc(randomNum(0,_width),randomNum(0,_height), 1, 0, 2*Math.PI);
                ctx.fill();
            }
            document.cookie="verify_code=" + _picTxt;
            return _picTxt;//返回随机数字符串
        }
        drawPic();
    </script>
</main>
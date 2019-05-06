<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,minimum-scale=1.0, maximum-scale=2.0; charset=UTF-8">
    <meta http-equiv="refresh" content="90;url=index.jsp">
    <title>链接</title>
    <!--导入jquery-->
    <script src="js/jquery-3.3.1.js"></script>

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

    <!-- Main Style -->
    <link rel="stylesheet" type="text/css" href="css/main.css">

    <!--Icon Fonts-->
    <link rel="stylesheet" media="screen" href="fonts/font-awesome/font-awesome.min.css"/>

</head>
<body>
<section id="pricing-table">
    <div class="container">
        <div class="row">
            <div class="pricing">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="pricing-table">
                        <div class="pricing-header">
                            <%
                                String path = request.getContextPath();
                                String basePath = request.getScheme() + "://"
                                        + request.getServerName() + ":" + request.getServerPort()
                                        + path + "/";
                                String fileName = (String) request.getAttribute("fileName");
                            %>
                            <div style="color: #eeeeee">打开扫一扫完成支付</div>
                            <img src="<%=basePath%><%=fileName%>">
                            <div id="timer" style="color:red"></div>
                            <div style="text-align: center;color: #5bc0de">请在<span style="color: red">三分钟</span>内完成支付,逾期订单无效!</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<SCRIPT LANGUAGE="JavaScript">
    var maxtime = 3*30; //半个小时，按秒计算，自己调整!
    function CountDown(){
        if(maxtime>=0){
            minutes = Math.floor(maxtime/30);
            seconds = Math.floor(maxtime%30);
            msg = "距离结束还有"+minutes+"分"+seconds+"秒";
            document.all["timer"].innerHTML=msg;
            if(maxtime == 5*30) alert('注意，还有5分钟!');
            --maxtime;
        }
        else{
            clearInterval(timer);
            alert("时间到，结束!");
        }
    }
    timer = setInterval("CountDown()",1000);
</SCRIPT>

</body>
</html>

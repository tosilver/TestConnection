<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,
    minimum-scale=1.0, maximum-scale=2.0,charset=UTF-8">
    <title>测试页面</title>
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
<!-- Pricing Table Section -->
<section id="pricing-table">
    <div class="container">
        <div class="row">
            <div class="pricing">
                <div class="col-md-4 col-sm-12 col-xs-12">
                    <div class="pricing-table">
                        <div class="pricing-header">
                            <p class="pricing-title">支付宝</p>
                            <p class="pricing-rate"><sup>¥</sup> 100 <span>元</span></p>
                            <form action="mallServlet" method="post" name="Personal" id="testform">
                                <a href="mallServlet?amount=20000" class="btn btn-custom">点击请求</a>
                            </form>

                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-12 col-xs-12">
                    <div class="pricing-table">
                        <div class="pricing-header">
                            <p class="pricing-title">支付宝</p>
                            <p class="pricing-rate"><sup>¥</sup> 200 <span>元</span></p>
                            <a href="mallServlet?amount=20000" class="btn btn-custom">点击请求</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-12 col-xs-12">
                    <div class="pricing-table">
                        <div class="pricing-header">
                            <p class="pricing-title">支付宝</p>
                            <p class="pricing-rate"><sup>¥</sup> 500 <span>元</span></p>
                            <a href="mallServlet?amount=50000" class="btn btn-custom">点击请求</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Pricing Table Section End -->

</body>
</html>

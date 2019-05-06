<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta name="viewport"  content="width=device-width,
    minimum-scale=1.0, maximum-scale=2.0; charset=UTF-8">
    <title>链接</title>
    <!--导入jquery-->
    <script src="js/jquery-3.3.1.js"></script>

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

    <!-- Main Style -->
    <link rel="stylesheet" type="text/css" href="css/main.css">

    <!--Icon Fonts-->
    <link rel="stylesheet" media="screen" href="fonts/font-awesome/font-awesome.min.css" />

</head>
<body>

<section id="pricing-table">
    <div class="container">
        <div class="row">
            <div class="pricing">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="pricing-table">
                        <div class="pricing-header">
                            <%String qrCode = (String) request.getAttribute("qrCode");%>
                            <a href="<%=qrCode%>" class="btn btn-custom">确认支付</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>

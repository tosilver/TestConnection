<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<head>
    <title>测试</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content=""/>
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- Meta tag Keywords -->
    <!-- Style-CSS -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <!-- web-fonts -->
    <link href="http://fonts.googleapis.com/css?family=Oswald:200,300,400,500,600,700" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <!-- //web-fonts -->
</head>

<body>
<!--header-->
<h1>
    <span>宝芝琳</span>测试页</h1>
<!--//header-->
<!-- content -->
<div class="main-content-agile">
    <div class="sub-main-w3">
        <form action="${pageContext.request.contextPath}/qrcodeServlet" method="post">
            <h2> 选择你的测试金额和类型:</h2>
            <div class="form-style-agile">
                <select class="category" required="" name="type">
                    <option value="">支付类型</option>
                    <option value="0">支付宝</option>
                    <option value="1">微信</option>
                    <option value="">未完待续...</option>
                </select>
            </div>
            <div class="form-style-agile">
                <input placeholder="请输入测试金额" name="amount" type="text" required="">
            </div>
            <input type="submit" value="测试">
        </form>
    </div>
</div>
<!-- //content -->
<!-- footer -->
<div class="footer">
    <p>Copyright &copy; 2019.Company name All rights reserved.9</p>
</div>
<!-- //footer -->


<!-- js -->
<script src="js/jquery-2.1.4.min.js"></script>

<!-- date-->
<link rel="stylesheet" href="css/jquery-ui.css" />
<script src="js/jquery-ui.js"></script>
<script>
    $(function () {
        $("#datepicker,#datepicker1").datepicker();
    });
</script>
<!-- //date -->

<!-- time -->
<script src="js/wickedpicker.js"></script>
<script>
    $('.timepicker').wickedpicker({
        twentyFour: false
    });
</script>
<link href="css/wickedpicker.css" rel="stylesheet" type='text/css' media="all" />
<!-- //time -->


</body>

</html>

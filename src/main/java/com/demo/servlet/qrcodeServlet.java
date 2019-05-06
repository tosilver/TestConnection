package com.demo.servlet;

import com.alibaba.fastjson.JSONObject;
import com.demo.signature.HmacSHA1Signature;
import com.demo.signature.SignatureUtil;
import com.demo.util.Constants;
import com.demo.util.DateUtil;
import com.demo.util.HttpsUtils;
import com.demo.util.qrcodeUtlis.QRCodeUtil;
import org.apache.commons.lang3.RandomStringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.security.SignatureException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "qrcodeServlet",urlPatterns = {"/qrcodeServlet"})
public class qrcodeServlet extends HttpServlet {

    //private static final String serverUrl = "http://192.168.101.69:9988"; // 开发环境
    //private static final String serverUrl = "http://api.b4bisi.com"; // 测试环境
    //private static final String serverUrl = "http://api.b4888.net"; // 测试环境
    //private static final String serverUrl = "http://api.b4187.com"; // 测试环境
    private static final String serverUrl = "http://122.114.77.138:9988"; // 彗星专属

    private static final HmacSHA1Signature hmacSHA1Signature = new HmacSHA1Signature();

    private static final String uploadPath="";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //修改中文乱码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        String qrCode = register(request, response);
        System.out.println(qrCode);
        String fileName = createQrcode(qrCode,request);
        request.setAttribute("fileName", fileName);
        request.getRequestDispatcher("link.jsp").forward(request, response);
    }

    /**
     * 处理提交请求
     *
     * @param request
     * @param response
     */
    private String register(HttpServletRequest request, HttpServletResponse response) {
        try {
            String amount = request.getParameter("amount");
            String type = request.getParameter("type");
            BigDecimal totalAmount = new BigDecimal(amount).multiply(new BigDecimal(100));
            System.out.println("支付金额为:"+totalAmount);
            System.out.println("支付类型为:"+type);
            Map<String, String> params = new HashMap<>();
            Calendar calendar = Calendar.getInstance();
            String tradeNo = String.format("%s%s", DateUtil.dateToStr(calendar.getTime(), DateUtil.YMdhmsS_noSpli), RandomStringUtils.randomNumeric(15));
            System.out.println("订单号:::" + tradeNo);

            //获得当前系统的时间
            Date d = new Date();
            System.out.println(d);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String dateNowStr = sdf.format(d);
            System.out.println("格式化后的日期：" + dateNowStr);

            // 业务参数
            params.put("tradeNo", tradeNo);
            params.put("totalAmount",totalAmount.toPlainString());
            params.put("notifyUrl", "https://www.alipay.com");
            params.put("time", dateNowStr);
            params.put("type", type);
            System.out.println(params);
            JSONObject jsonObject = JSONObject.parseObject(post("/pay/qrPay.do", params));
            System.out.println(jsonObject);
            String data = jsonObject.getString("data");
            JSONObject dataJson = JSONObject.parseObject(data);
            String qrCode = dataJson.getString("qrcode");
            return qrCode;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 生成二维码图片
     * @param qrCode
     */
    private String createQrcode(String qrCode,HttpServletRequest request){

        //2.每天生成一个当天日期的目录:2018-09-23用于保存用户上传的下发表格
        String now = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        //3. 创建目录对象
        File file = new File(request.getSession().getServletContext().getRealPath("/"),now);
        if (!file.exists()) {
            file.mkdirs();
        }
        System.out.println(file.getAbsolutePath());
        String fileName="qrcode.jpg";
        fileName= UUID.randomUUID().toString().replaceAll("-", "")+fileName;
        String destPath=file+"/"+fileName;
        System.out.println(destPath);
        try {
            QRCodeUtil.encode(qrCode,destPath);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return now+"/"+fileName;
    }


    protected static String post(String apiUri, Map<String, String> params) throws IOException, SignatureException {
        return HttpsUtils.post(serverUrl + apiUri, null, signParams(params));
    }


    private static Map<String, String> signParams(Map<String, String> params) throws IOException, SignatureException {
        params.remove("signature");
        // 系统级别参数 merchantId、timestamp、signature
        params.put("merchantId", "100000000000005");
        String timestamp = System.currentTimeMillis() + "";
        params.put("timestamp", timestamp);
        System.out.println(timestamp);
        String content = SignatureUtil.getSignatureContent(params, true);
        String sign = hmacSHA1Signature.sign(content, "c33367701511b4f6020ec61ded352059", Constants.CHARSET_UTF8);//阿里签名
        System.out.println(sign);
        params.put("signature", sign);
        return params;
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


}

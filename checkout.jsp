<%@ page import="org.owasp.esapi.ESAPI"%>
<%@ include file="functions.jsp" %>
<%
//Below are the constants this program needs
//replace them with your values

String memberId = "11344"; //put in your merchantid you received after signing up
String totype = "docspartner"; // put in your partner name
String amount = "1.00"; //your script should substitute the amount here
String TMPL_AMOUNT = "5.00"; //your script should substitute the amount here
String merchantTransactionId = "412827484"; //your script should substitute the order id here
String orderDescription = "description about order"; //your script should substitute detailed description of your order here ( This field is not mandatory )
String merchantRedirectUrl = "http://localhost:8081/stdKit/redirecturl.jsp"; //You need to change the URL as per your website and the location where you have kept provided redirecturl.jsp file
String key = "9P8vdzPP4oL9BeDgko3ti6HGnou59LEB"; //put in the 32 bit alphanumeric key in the quotes provided here
String country = "IN";//your script should substitute the customer's country code
String TMPL_CURRENCY = "";//your script should substitute the currency symbol in which you want to display amount 
String currency = "USD";//your script should substitute the currency symbol in which you want to display amount 
String city = "Mumbai";//your script should substitute the customer's city
String state = "Maharashtra";//your script should substitute the customer's state
String street = "4 Bunglow";//your script should substitute the customer's street
String postcode = "400052";//your script should substitute the customer's zip
String phone = "226370256";//your script should substitute the customer's actual telno
String telnocc = "091";//your script should substitute the customer's contry code for tel no
String email = "john.doe@xyz.com";//your script should substitue the customer's email address
String ip = "127.0.0.1"; // your script should replace it with your ip address
String reservedField1 = ""; //As of now this field is reserved and you need not put anything
String reservedField2 = ""; //As of now this field is reserved and you need not put anything
String terminalid="";		//terminalid if provided 
String paymentMode="";		//payment type as applicable Credit Cards = CC, Vouchers = PV,  Ewallet = EW, NetBanking = NB
String paymentBrand="";        //card type as applicable Visa = VISA; MasterCard=MC; Dinners= DINER; Amex= AMEX; Disc= DISC; CUP=CUP
String customerId = "44444";    // customer ID if the customer is registered 

String checksum ="";
try
{
checksum = getchecksum(memberId, totype, amount, merchantTransactionId, merchantRedirectUrl, key);
}
catch (NoSuchAlgorithmException e)
{
System.out.println("Error : " + e.getMessage());
}

//String testurl = "http://localhost:8081/transaction/PayProcessController";
String testurl = "https://testUrl.com/transaction/PayProcessController";
String liveurl = "https://secure.live.com/transaction/PayProcessController";

%>
<html>
<head><title>Payment Page Transaction Request</title></head>
<body bgcolor="white">
<font size=4/>
<form name="frm1" method="post" action=<%=testurl%>>
<input type=hidden name=memberId maxlength="10"  value=<%=memberId%>>
<input type=hidden name=totype value=<%=totype%>>
<input type=hidden name=TMPL_AMOUNT value=<%=TMPL_AMOUNT%>>
<input type=hidden name=amount value=<%=amount%>>
<input type=hidden name=merchantTransactionId maxlength="100"  value=<%=merchantTransactionId%>>
<input type=hidden name=orderDescription value=<%=orderDescription%>>
<input type=hidden name=merchantRedirectUrl value=<%=merchantRedirectUrl%>>
<input type=hidden name=checksum value=<%=checksum%>>
<input type=hidden name=ip value=<%=ip%>>
<input type=hidden name=reservedField1 value=<%=reservedField1%>>
<input type=hidden name=reservedField2 value=<%=reservedField2%>>
<input type="hidden" name="country" value="<%=country%>">
<input type="hidden" name="currency" value="<%=currency%>">
<input type="hidden" name="TMPL_CURRENCY" value="<%=TMPL_CURRENCY%>">
<input type="hidden" name="city" value="<%=city%>">
<input type="hidden" name="state" value="<%=state%>">
<input type="hidden" name="street" value="<%=street%>">
<input type="hidden" name="postcode" value="<%=postcode%>">
<input type="hidden" name="phone" value="<%=phone%>">
<input type="hidden" name="telnocc" value="<%=telnocc%>">
<input type="hidden" name="email" value="<%=email%>">
<input type="hidden" name="terminalid" value="<%=terminalid%>">
<input type="hidden" name="paymentMode" value="<%=paymentMode%>">
<input type="hidden" name="paymentBrand" value="<%=paymentBrand%>">
<input type="hidden" name="customerId" value="<%=customerId%>">
<input type="submit" value="submit">
</form>
</body></html>



<html>
<head><title>Payment Page Transaction Request</title></head>
<body bgcolor="white">
<font size=4>
    <%@ include file="functions.jsp" %>
    <%
        String key = "kS4oNFBT6o3Rvvd7nBkpBIUrf1PsUVaw"; //put in the 32 bit alphanumeric key in the quotes provided here
	 String paymentId = request.getParameter("paymentId");
        String merchantTransactionId = request.getParameter("merchantTransactionId");
        String amount = request.getParameter("amount");
        String status = request.getParameter("status");
        String checksum = request.getParameter("checksum");
	 String billingdiscriptor = request.getParameter("descriptor");
	 String token = request.getParameter("token");
	 String currency = request.getParameter("currency");
	 String timestamp = request.getParameter("timestamp");
	 String resultCode = request.getParameter("resultCode");
	 String cardBin = request.getParameter("cardBin");
	 String cardLast4Digits = request.getParameter("cardLast4Digits");
 	 String apiCode = request.getParameter("resultCode");
	 String apiDesc = request.getParameter("resultDescription");
	 String tmpl_currency = request.getParameter("tmpl_currency");
	 String tmpl_amount = request.getParameter("tmpl_amount");

        String str = "";
        try
        {
            str = verifychecksum(paymentId,merchantTransactionId, amount, status, checksum, key);
        }
        catch (NoSuchAlgorithmException e)
        {
            System.out.println("Error : " + e.getMessage());
        }

        if ("true".equals(str) && "Y".equals(status))
        {
out.println("Thank you for shopping with us. Your credit card has been charged and your  transaction is successful. We will be shipping your order to you soon.");

//Here you need to put in, the routines for a successful
//transaction such as sending an email to customer,
//setting database status, informing logistics etc etc.
        }
        else if ("true".equals(str) && "N".equals(status))
        {
out.println("Thank you for shopping with us. However it seems your credit card transaction failed.");

//Here you need to put in, the routines for a failed
//transaction such as sending an email to customer
//setting database status etc etc.
        }
        else if ("true".equals(str) && "P".equals(status))
        {
out.println("Your Transaction has been classified as a HIGH RISK Transaction by our Credit Card processor.This requires you to Fax us an Authorisation for this transaction in order to complete the processing. This process is required by our Credit Card Processor to ensure that this transaction is being done by a genuine card-holder. The transaction will NOT be completed (and your card will NOT be charged) if you do not fax required documents.");

//Here you need to put in, the routines for a HIGH RISK
//transaction such as sending an email to customer and explaining him a procedure,
//setting database status etc etc.
        }
        else
        {
out.println("Security Error. Illegal access detected");
out.println("apiCode----"+apiCode);
out.println("apiDesc----"+apiDesc);
//Here you need to simply ignore this and don’t need
//to perform any operation in this condition
        }
    %>
</font>
</body>
</html>

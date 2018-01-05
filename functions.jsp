<%@ page import="java.security.MessageDigest, java.security.NoSuchAlgorithmException,
java.util.Date,
java.util.Random" %>
<%!
public String verifychecksum(String trackingid,String description, String amount, String status, String checksum, String key) throws NoSuchAlgorithmException
{
String str = trackingid +"|"+ description + "|" + amount + "|" + status + "|" + key;
MessageDigest messageDigest = MessageDigest.getInstance("MD5");
String generatedCheckSum = getString(messageDigest.digest(str.getBytes()));
if (generatedCheckSum.equals(checksum))
{
return "true";
}
else
{
return "false";
}
}

public String getchecksum(String memberid, String totype, String amount, String description, String redirecturl, String key) throws NoSuchAlgorithmException
{
String str = memberid + "|" + totype + "|" + amount + "|" + description + "|" + redirecturl + "|" + key ;
MessageDigest messageDigest = MessageDigest.getInstance("MD5");
String generatedCheckSum = getString(messageDigest.digest(str.getBytes()));
return generatedCheckSum;
}
private static String getString(byte buf[])
{
StringBuffer sb = new StringBuffer(2 * buf.length);
for (int i = 0; i < buf.length; i++)
{
int h = (buf[i] & 0xf0) >> 4;
int l = (buf[i] & 0x0f);
sb.append(new Character((char) ((h > 9) ? 'a' + h - 10 : '0' + h)));
sb.append(new Character((char) ((l > 9) ? 'a' + l - 10 : '0' + l)));
}
return sb.toString();
}
public String getOrderId()
{
String pwdData = "1234567890";
int len = pwdData.length();
Date date = new Date();
Random rand = new Random(date.getTime());
StringBuffer key = new StringBuffer();
int index = -1;
for (int i = 0; i < 3; i++)
{
index = rand.nextInt(len);
key.append(pwdData.substring(index, index + 1));
}
return key.toString();
}
%>

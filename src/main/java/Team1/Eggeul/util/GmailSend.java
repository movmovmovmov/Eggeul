package Team1.Eggeul.util;

import Team1.Eggeul.domain.MailVO;
import lombok.extern.log4j.Log4j;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Log4j
public class GmailSend {
    private final String user = "eggeulauth@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
    private final String password = "dlRmfdlswmd";

    // SMTP 서버 정보를 설정한다.
    private Properties prop = new Properties();
    private Session session;

    public GmailSend(){
        System.setProperty("https.protocols", "TLSv1,TLSv1.1,TLSv1.2");

//        prop.put("mail.smtp.host", "smtp.gmail.com");
//        prop.put("mail.smtp.port", 465);
//        prop.put("mail.smtp.auth", "true");
//        prop.put("mail.smtp.ssl.enable", "true");
//        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.ssl.trust", "*");
        //검색하고 추가로 삽입
        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

//        prop.setProperty("mail.transport.protocol", "smtp");
//        prop.setProperty("mail.host", "smtp.gmail.com");
//        prop.put("mail.smtp.auth", "true");
//        prop.put("mail.smtp.port", "465");
//        prop.put("mail.debug", "true");
//        prop.put("mail.smtp.socketFactory.port", "465");
//        prop.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
//        prop.put("mail.smtp.socketFactory.fallback", "false");

    }

    public boolean sendAuthMail(MailVO vo) throws Exception{

        session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(user));

        //수신자메일주소
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getReceiver()));

        // Subject
        message.setSubject(vo.getSubject());

        // Text
        message.setText(vo.getText(), "utf-8", "html");

        // send the message
        Transport.send(message);
        log.info("메일이 성공적으로 전송되었습니다!");

        return true;
    }


}

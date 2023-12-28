package com.choongang.s202350103.htService;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class EmailService {
	private final JavaMailSender javaMailSender;

    public void sendEmail(String to, String subject, String text) throws MessagingException {
    	System.out.println("sendEmail service Start");
    	MimeMessage message1 = javaMailSender.createMimeMessage();
        MimeMessageHelper message = new MimeMessageHelper(message1, true);
        
        String htmlContent = "<html>\n";
        htmlContent += "<head>\n";
        htmlContent += "  <style>\n";
        htmlContent += "    body {\n";
        htmlContent += "      font-family: 'Arial', sans-serif;\n";
        htmlContent += "      margin: 0;\n";
        htmlContent += "      padding: 0;\n";
        htmlContent += "    }\n";
        htmlContent += "    .container {\n";
        htmlContent += "      width: 80%;\n";
        htmlContent += "      margin: 0 auto;\n";
        htmlContent += "      border: 1px solid #ddd;\n";
        htmlContent += "      border-radius: 10px;\n";
        htmlContent += "      overflow: hidden;\n";
        htmlContent += "    }\n";
        htmlContent += "    h2 {\n";
        htmlContent += "      color: #007bff;\n";
        htmlContent += "      padding: 20px;\n";
        htmlContent += "      margin: 0;\n";
        htmlContent += "      background-color: #f8f8f8;\n";
        htmlContent += "      border-bottom: 1px solid #ddd;\n";
        htmlContent += "    }\n";
        htmlContent += "    p {\n";
        htmlContent += "      font-size: 16px;\n";
        htmlContent += "      color: #333;\n";
        htmlContent += "      padding: 20px;\n";
        htmlContent += "      margin: 0;\n";
        htmlContent += "    }\n";
        htmlContent += "  </style>\n";
        htmlContent += "</head>\n";
        htmlContent += "<body>\n";
        htmlContent += "  <div class='container'>\n";
        htmlContent += "    <h2>"+subject+"</h2>\n";
        htmlContent += "    <p>"+text+"</p>\n";
        htmlContent += "  </div>\n";
        htmlContent += "</body>\n";
        htmlContent += "</html>";

        message.setTo(to);
        message.setSubject(subject);
        message.setText(htmlContent, true);
        
        System.out.println("sendEmail message--> " + message);
        try {
        	javaMailSender.send(message1);
		} catch (Exception e) {
			System.out.println("EmailService Exception -> " + e.getMessage());
		}
    }
}

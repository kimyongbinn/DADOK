package com.choongang.s202350103.htService;


import java.net.URI;
import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choongang.s202350103.domain.KakaoPayApprovalVO;
import com.choongang.s202350103.domain.KakaoPayReadyVO;
import com.choongang.s202350103.model.Member;

import lombok.extern.java.Log;

@Service
@Log
public class KakaoPay {
 
    private static final String HOST = "https://kapi.kakao.com";
    
    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    
    public String kakaoPayReady(@ModelAttribute("ka") KakaoPayApprovalVO ka, RedirectAttributes redirect) {
    	System.out.println("KakaoPay service Start....");
 
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "ce89e6732790b14c29f319954de36e31");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        System.out.println("KakaoPay service ka ---> 여기까지 왔어 1" + ka);
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        System.out.println("KakaoPay service 여기까지 왔어 2");
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", ka.getPartner_order_id()); //가맹점 주문번호, 결제 준비 API 요청과 일치해야 함
        params.add("partner_user_id", ka.getPartner_user_id()); // 가맹점 회원 id, 결제 준비 API 요청과 일치해야 함
        params.add("install_month", String.valueOf(ka.getInstall_month())); //주문유형(선물여부)
        params.add("item_name", ka.getItem_name());
        params.add("cid_secret", ka.getCid_secret());
        params.add("item_code", ka.getItem_code());
        params.add("quantity", String.valueOf(ka.getQuantity()));
        params.add("total_amount", String.valueOf(ka.getAmount().getTotal()));
        params.add("point_amount", String.valueOf(ka.getAmount().getPoint()));
        params.add("tax_free_amount", "100");
        
        
        String plus = "partner_order_id="+ka.getPartner_order_id()+
		  			  "&partner_user_id="+ka.getPartner_user_id()+
		  			  "&amount.total="+ka.getAmount().getTotal()+
		  			  "&amount.point="+ka.getAmount().getPoint()+
		  			  "&install_month="+ka.getInstall_month()+
		  			  "&cid_secret="+ka.getCid_secret()+
		  			  "&item_code="+ka.getItem_code()+
		  			  "&item_name="+ka.getItem_name()+
		  			  "&quantity="+ka.getQuantity();
        String total = "http://localhost:8200/kakaoPaySuccess?" + plus;
        
        params.add("approval_url", total);
        params.add("cancel_url", "http://localhost:8200/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8200/kakaoPaySuccessFail");
        System.out.println("KakaoPay service 여기까지 왔어 3");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
         System.out.println("KakaoPay service 여기까지 왔어 4");
         System.out.println("확인용 body -> "+body);
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            System.out.println("kakaoPayReadyVO -> " + kakaoPayReadyVO);
            System.out.println("KakaoPay service 여기까지 왔어 5");
            
            System.out.println("KakaoPay getNext_redirect_pc_url --> "+kakaoPayReadyVO.getNext_redirect_pc_url() );
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
           
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        System.out.println("KakaoPay service 여기까지 왔어 6");
        return "/pay";
        
    }
    
    public KakaoPayApprovalVO kakaoPayInfo(String pg_token, @ModelAttribute("ka") KakaoPayApprovalVO ka) {
    	 
        System.out.println("KakaoPayInfoVO............................................");
        System.out.println("-----------------------------");
        
        System.out.println("KakaoPayApprovalVO service ka ---> " + ka);
        
        RestTemplate restTemplate = new RestTemplate();
        
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "ce89e6732790b14c29f319954de36e31");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", ka.getPartner_order_id());
        params.add("partner_user_id", ka.getPartner_user_id());
        params.add("install_month", String.valueOf(ka.getInstall_month())); //주문유형(선물여부)
        params.add("pg_token", pg_token);
        params.add("total_amount", String.valueOf(ka.getAmount().getTotal()));
        params.add("point_amount", String.valueOf(ka.getAmount().getPoint()));
        params.add("cid_secret", ka.getCid_secret());
        params.add("item_code", ka.getItem_code());
        
        
        System.out.println("희라 확인용 params -> "+params);
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        System.out.println("희라 확인용 body -> "+body);
       
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            
            // 추가 parameter 임의 세팅
            kakaoPayApprovalVO.setInstall_month(ka.getInstall_month());
            kakaoPayApprovalVO.getAmount().setPoint(ka.getAmount().getPoint());
            kakaoPayApprovalVO.setCid_secret(ka.getCid_secret());
            kakaoPayApprovalVO.setItem_code(ka.getItem_code());
            
            
            System.out.println("kakaoPayApprovalVO -> " + kakaoPayApprovalVO);
          
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }
    
}
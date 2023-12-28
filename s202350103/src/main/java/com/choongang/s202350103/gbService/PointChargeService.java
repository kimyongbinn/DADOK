package com.choongang.s202350103.gbService;

import org.springframework.stereotype.Service;

import com.choongang.s202350103.domain.KakaoPayApprovalVO;
import com.choongang.s202350103.gbDao.PointChargeDao;
import com.choongang.s202350103.model.Orderr;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PointChargeService {
	private final PointChargeDao pcd;
	
	public int InsertUpdatePointCharge(KakaoPayApprovalVO kakaoDto) {
		System.out.println("PointChargeService InsertUpdatePointCharge start...");
		int result = 0;
		
		result = pcd.InsertUpdatePointCharge(kakaoDto);
		System.out.println("PointChargeService InsertUpdatePointCharge result -> "+result);
		
		return result;
	}
}

package com.choongang.s202350103.htService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.s202350103.htDao.ReviewDao;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.Orderr;
import com.choongang.s202350103.model.Review;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	private final ReviewDao rd;

	
	
	@Override
	public int reviewInsert(Review review) {
		System.out.println("ReviewServiceImpl reviewInsert() Start...");
		int result = rd.reviewInsert(review);
		System.out.println("ReviewServiceImpl reviewInsert() result--> " + result);
		return result;
	}

	@Override
	public List<Review> listReview(Review review) {
		System.out.println("ReviewServiceImpl listReview() Start...");
		List<Review> list = rd.listReview(review);
		return list;
	}
	
	@Override
	public int reviewTotal(Review review) {
		System.out.println("ReviewServiceImpl reviewTotal() Start..." );
		int total = rd.reviewTotal(review);
		System.out.println("ReviewServiceImpl reviewTotal() total--> " + total);
		return total;
	}

	@Override
	public int reviewRating(Review review) {
		System.out.println("ReviewServiceImpl reviewRating() Start..." );
		int total = rd.reviewRating(review);
		System.out.println("ReviewServiceImpl reviewRating() total--> " + total);
		return total;
	}

	@Override
	public double reviewAverage(Review review) {
		System.out.println("ReviewServiceImpl reviewAverage() Start..." );
		double average = rd.reviewAverage(review);
		System.out.println("ReviewServiceImpl reviewAverage() average--> " + average);
		return average;
	}

	@Override
	public List<Orderr> reviewWriteList(Orderr orderr) {
		System.out.println("ReviewServiceImpl reviewWriteList() Start...");
		List<Orderr> reviewWriteList = rd.reviewWriteList(orderr);
		System.out.println("ReviewServiceImpl reviewWriteList() reviewWriteList.getO_order_num --> "+ reviewWriteList.size());
		return reviewWriteList;
	}

	@Override
	public int totalReviewCnt(Orderr orderr) {
		System.out.println("ReviewServiceImpl totalReviewCnt() Start..." );
		int total = rd.myReviewTotal(orderr);
		System.out.println("ReviewServiceImpl totalReviewCnt() total--> " + total);
		return total;
	}

	@Override
	public int totalReviewedCnt(Review review) {
		System.out.println("ReviewServiceImpl totalReviewedCnt() Start..." );
		int total = rd.myReviewedTotal(review);
		System.out.println("ReviewServiceImpl totalReviewedCnt() total--> " + total);
		return total;
	}

	@Override
	public List<Review> reviewedWriteList(Review review) {
		System.out.println("ReviewServiceImpl reviewedWriteList() Start...");
		List<Review> reviewedWriteList = rd.reviewedWriteList(review);
		System.out.println("ReviewServiceImpl reviewedWriteList() reviewedWriteList.size() --> "+ reviewedWriteList.size());
		return reviewedWriteList;
	}

	@Override
	public Review writedReview(Review review) {
		System.out.println("ReviewServiceImpl writedReview() Start....");
		Review writedReview = rd.writedReview(review);
		return writedReview;
	}

	@Override
	public int reviewUpdate(Review review) {
		System.out.println("ReviewServiceImpl reviewUpdate() Start....");
		int result = rd.reviewUpdate(review);
		return result;
	}

	@Override
	public int reviewDelete(Review review) {
		System.out.println("ReviewServiceImpl reviewDelete() Start....");
		int result = rd.reviewDelete(review);
		return result;
	}

	@Override
	public Review reviewOne(Review review) {
		System.out.println("ReviewServiceImpl reviewOne() Start....");
		Review reviewOne = rd.reviewOne(review);
		return reviewOne;
	}

	
}

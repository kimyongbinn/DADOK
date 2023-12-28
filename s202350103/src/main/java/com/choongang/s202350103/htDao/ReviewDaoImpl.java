package com.choongang.s202350103.htDao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.Orderr;
import com.choongang.s202350103.model.Review;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ReviewDaoImpl implements ReviewDao {
	private final SqlSession session;


	@Override
	public List<Review> listReview(Review review) {
		System.out.println("ReviewDaoImpl listReview() Start...");
		List<Review> list = null;
		try {
			list = session.selectList("htReviewList", review);
		}catch (Exception e) {
			System.out.println("ReviewDaoImpl listReview() Exception-->" + e.getMessage());
		}
		return list;
	}
    
	
	@Override
	public int reviewTotal(Review review) {
		System.out.println("ReviewDaoImpl reviewTotal() Start....");
		int total = 0;
		try {
			total = session.selectOne("htReviewTotal", review);
		}catch (Exception e) {
			System.out.println("ReviewDaoImpl reviewTotal() total--> " + total);
		}
		return total;
	}
	
	@Override
	public int reviewRating(Review review) {
		System.out.println("ReviewDaoImpl reviewRating() Start....");
		int total = 0;
		try {
			total = session.selectOne("htReviewRating",review);
		}catch (Exception e) {
			System.out.println("ReviewDaoImpl reviewRating() total--> " + total);
		}
		return total;
	}

	@Override
	public double reviewAverage(Review review) {
		System.out.println("ReviewDaoImpl reviewAverage() Start....");
		double average = 0;
		try {
			average = session.selectOne("htReviewAverage", review);
			System.out.println("ReviewDaoImpl reviewAverage() average->"+average);
		}catch (Exception e) {
			System.out.println("ReviewDaoImpl reviewAverage() average--> " + average);
		}
		return average;
	}

	@Override
	public List<Orderr> reviewWriteList(Orderr orderr) {
		System.out.println("ReviewDaoImpl reviewWriteList() Start...");
		List<Orderr> list2 = null;
		try {
			list2 = session.selectList("htMyReviewList", orderr);
			System.out.println("ReviewDaoImpl reviewWriteList() list2-> " + list2);
		}catch (Exception e) {
			System.out.println("ReviewDaoImpl reviewWriteList() Exception-->" + e.getMessage());
		}
		return list2;
	}

	@Override
	public int myReviewTotal(Orderr orderr) {
		System.out.println("ReviewDaoImpl myReviewTotal() Start....");
		int total = 0;
		try {
			total = session.selectOne("htMyReviewCnt", orderr);
		}catch (Exception e) {
			System.out.println("ReviewDaoImpl myReviewTotal() total--> " + total);
		}
		return total;
	}

	
	@Override
	public int reviewInsert(Review review) {
		System.out.println("ReviewDaoImpl reviewInsert() Start....");
		int result = 0;
		try {
			result = session.insert("htReviewInsert", review);
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl reviewInsert() Exception-->" + e.getMessage());
		}
		return result;
	}


	@Override
	public int myReviewedTotal(Review review) {
		System.out.println("ReviewDaoImpl myReviewedTotal() Start....");
		int total = 0;
		try {
			total = session.selectOne("htMyReviewedCnt", review);
		}catch (Exception e) {
			System.out.println("ReviewDaoImpl myReviewedTotal() total--> " + total);
		}
		return total;
	}


	@Override
	public List<Review> reviewedWriteList(Review review) {
		System.out.println("ReviewDaoImpl reviewedWriteList() Start...");
		List<Review> list = null;
		try {
			list = session.selectList("htMyReviewedList", review);
			System.out.println("ReviewDaoImpl reviewedWriteList() list-> " + list);
			for(Review review1 : list) {
				System.out.println("ReviewDaoImpl reviewedWriteList() review1-> " + review1);
				
			}
			
			
		}catch (Exception e) {
			System.out.println("ReviewDaoImpl reviewedWriteList() Exception-->" + e.getMessage());
		}
		return list;
	}


	@Override
	public Review writedReview(Review review) {
		System.out.println("ReviewDaoImpl writedReview() Start....");
		Review writedReview = null;
		try {
			writedReview = session.selectOne("htWritedReview",review);
		}catch (Exception e) {
			System.out.println("ReviewDaoImpl writedReview() Exception--> " + e.getMessage());
		}
		return writedReview;
	}


	@Override
	public int reviewUpdate(Review review) {
		System.out.println("ReviewDaoImpl reviewUpdate() Start....");
		int result = 0;
		try {
			System.out.println("ReviewDaoImpl reviewUpdate review--> "+ review );
			result = session.update("htReviewUpdate", review);
			System.out.println("ReviewDaoImpl reviewUpdate() result--> " + result);
		}catch (Exception e) {
			System.out.println("ReviewDaoImpl reviewUpdate() Exception--> " + e.getMessage());
		}
		return result;
	}


	@Override
	public int reviewDelete(Review review) {
		System.out.println("ReviewDaoImpl reviewDelete() Start....");
		int result = 0;
		try {
			System.out.println("ReviewDaoImpl reviewDelete review--> "+ review );
			result = session.delete("htReviewDelete", review);
			System.out.println("ReviewDaoImpl reviewDelete() result--> " + result);
		}catch (Exception e) {
			System.out.println("ReviewDaoImpl reviewDelete() Exception--> " + e.getMessage());
		}
		return result;
	}


	@Override
	public Review reviewOne(Review review) {
		System.out.println("ReviewDaoImpl reviewOne() Start....");
		System.out.println("reviewOne--->"+review);
		
		Review reviewOne2 = null;
		try {
			reviewOne2 = session.selectOne("htReviewOne",review);
			System.out.println("reviewOne reviewOne2--> " + reviewOne2);
		}catch (Exception e) {
			System.out.println("ReviewDaoImpl reviewOne() Exception--> " + e.getMessage());
		}
		return reviewOne2;
	}

}

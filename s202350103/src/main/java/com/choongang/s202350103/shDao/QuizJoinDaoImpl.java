package com.choongang.s202350103.shDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.QuizJoin;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class QuizJoinDaoImpl implements QuizJoinDao {

	private final SqlSession session;
	
	@Override
	public List<QuizJoin> listQuizJoin(int m_num) {
		List<QuizJoin> quizJoinList = session.selectList("shQuizJoinList",m_num);
		return quizJoinList;
	}

	@Override
	public int checkChance(QuizJoin quizJoin) {
		int result = 0;
		try {
			result = session.selectOne("shQuizChance",quizJoin);
		} catch (Exception e) {
			System.out.println("QuizJoinDao checkChance() Exception->"+e.getMessage());
		}
		return result;
	}

	@Override
	public void checkedAnswer(QuizJoin quizJoin) {
		try {
			session.insert("shQuizAnswer",quizJoin);
		} catch (Exception e) {
			System.out.println("QuizJoinDao checkedAnswer() Exception ->"+e.getMessage());
		}		
	}

	@Override
	public void savePoint(QuizJoin quizJoin) {
		try {
			session.update("shQuizPoint",quizJoin);
		} catch (Exception e) {
			System.out.println("QuizJoinDao savePoint()->"+e.getMessage());
		}
	}

	@Override
	public QuizJoin searchQuiz(QuizJoin quizJoin) {
		try {
			quizJoin = session.selectOne("shSearchQuiz",quizJoin);
		} catch (Exception e) {
			System.out.println("QuizJoinDao searchQuiz()->"+e.getMessage());
		}
		return quizJoin;
	}

	@Override
	public void quizPointList(QuizJoin quizJoin) {
		try {
			session.insert("shQuizPointList",quizJoin);
		} catch (Exception e) {
			System.out.println("QuizJoinDao quizPointList()->"+e.getMessage());
		}
		
	}

}

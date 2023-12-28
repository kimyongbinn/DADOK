package com.choongang.s202350103.shDao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.Quiz;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class QuizDaoImpl implements QuizDao {

	private final SqlSession session;

	@Override
	public int totalQuiz() {
		System.out.println("QuizDaoImpl totalQuiz() Start..");
		int totalQuiz = 0;
		try {
			totalQuiz = session.selectOne("shTotalQuiz");
		} catch (Exception e) {
			System.out.println("QuizDaoImpl totalQuiz() Exception->"+e.getMessage());
		}
		return totalQuiz;
	}

	@Override
	public Quiz quiz(int eNum) {
		System.out.println("QuizDao quiz() Start");
		Quiz quiz = session.selectOne("shQuiz",eNum);
		return quiz;
	}

	@Override
	public int createQuiz(Quiz quiz) {
		System.out.println("QuizDaoImpl createQuiz() Start");
		int result = 0 ;
		try {
			result = session.insert("shCreateQuiz",quiz);
		} catch (Exception e) {
			System.out.println("QuizDao createQuiz() Exception ->"+e.getMessage());
		}
		return result;
	}

	@Override
	public int updateQuiz(Quiz quiz) {
		System.out.println("QuizDao updateQuiz() Start...");
		int result = 0;
		try {
			result = session.update("shUpdateQuiz",quiz);
		} catch (Exception e) {
			System.out.println("QuizDao updateQuiz() Exception->"+e.getMessage());
		}
		return result;
	}

	@Override
	public int deleteQuiz(int q_num) {
		System.out.println("QuizDao deleteQuiz() Start...");
		int result = 0;
		try {
			result = session.delete("shDeleteQuiz",q_num);
		} catch (Exception e) {
			System.out.println("QuizDao deleteQuiz() Exception ->"+e.getMessage());
		}
		return result;
	}
	
}

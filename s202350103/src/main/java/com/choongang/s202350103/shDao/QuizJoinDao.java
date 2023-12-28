package com.choongang.s202350103.shDao;

import java.util.List;

import com.choongang.s202350103.model.QuizJoin;

public interface QuizJoinDao {

	List<QuizJoin> 		listQuizJoin(int m_num);
	int 				checkChance(QuizJoin quizJoin);
	void 				checkedAnswer(QuizJoin quizJoin);
	void 				savePoint  (QuizJoin quizJoin);
	QuizJoin 			searchQuiz(QuizJoin quizJoin);
	void 				quizPointList(QuizJoin quizJoin);

}

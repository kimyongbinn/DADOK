package com.choongang.s202350103.shDao;

import com.choongang.s202350103.model.Quiz;

public interface QuizDao {
	int 		totalQuiz();
	Quiz 		quiz(int eNum);
	int 		createQuiz(Quiz quiz);
	int 		updateQuiz(Quiz quiz);
	int 		deleteQuiz(int q_num);
}

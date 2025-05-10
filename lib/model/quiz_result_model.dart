class QuizResultModel {
  final String? status;
  final String? message;
  final ResultData? data;

  QuizResultModel({
    this.status,
    this.message,
    this.data,
  });

  QuizResultModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? ResultData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.toJson()
  };
}

class ResultData {
  final int? attemptCount;
  final int? totalQuestions;
  final int? rightAnswerCount;
  final int? wrongAnswerCount;
  final List<QuizScores>? quizScores;

  ResultData({
    this.attemptCount,
    this.totalQuestions,
    this.rightAnswerCount,
    this.wrongAnswerCount,
    this.quizScores,
  });

  ResultData.fromJson(Map<String, dynamic> json)
      : attemptCount = json['attempt_count'] as int?,
        totalQuestions = json['total_questions'] as int?,
        rightAnswerCount = json['right_answer_count'] as int?,
        wrongAnswerCount = json['wrong_answer_count'] as int?,
        quizScores = (json['quiz_scores'] as List?)?.map((dynamic e) => QuizScores.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'attempt_count' : attemptCount,
    'total_questions' : totalQuestions,
    'right_answer_count' : rightAnswerCount,
    'wrong_answer_count' : wrongAnswerCount,
    'quiz_scores' : quizScores?.map((e) => e.toJson()).toList()
  };
}

class QuizScores {
  final int? quizId;
  final String? quizName;
  final int? rightanswer;
  final int? totalquestion;
  final List<CorrectAnswers>? correctAnswers;

  QuizScores({
    this.quizId,
    this.quizName,
    this.rightanswer,
    this.totalquestion,
    this.correctAnswers,
  });

  QuizScores.fromJson(Map<String, dynamic> json)
      : quizId = json['quiz_id'] as int?,
        quizName = json['quiz_name'] as String?,
        rightanswer = json['rightanswer'] as int?,
        totalquestion = json['totalquestion'] as int?,
        correctAnswers = (json['correct_answers'] as List?)?.map((dynamic e) => CorrectAnswers.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'quiz_id' : quizId,
    'quiz_name' : quizName,
    'rightanswer' : rightanswer,
    'totalquestion' : totalquestion,
    'correct_answers' : correctAnswers?.map((e) => e.toJson()).toList()
  };
}

class CorrectAnswers {
  final String? question;
  final String? correctOption;

  CorrectAnswers({
    this.question,
    this.correctOption,
  });

  CorrectAnswers.fromJson(Map<String, dynamic> json)
      : question = json['question'] as String?,
        correctOption = json['correct_option'] as String?;

  Map<String, dynamic> toJson() => {
    'question' : question,
    'correct_option' : correctOption
  };
}
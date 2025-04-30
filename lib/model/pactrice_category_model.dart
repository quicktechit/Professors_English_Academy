class PracticeCategoryModel {
  final String? message;
  final List<Data>? data;

  PracticeCategoryModel({
    this.message,
    this.data,
  });

  PracticeCategoryModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'message' : message,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final int? id;
  final String? name;
  final String? image;
  final String? createdAt;
  final String? updatedAt;
  final List<Subcategories>? subcategories;
  final List<Quiz>? quiz;

  Data({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.subcategories,
    this.quiz,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        image = json['image'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        subcategories = (json['subcategories'] as List?)?.map((dynamic e) => Subcategories.fromJson(e as Map<String,dynamic>)).toList(),
        quiz = (json['quiz'] as List?)?.map((dynamic e) => Quiz.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'image' : image,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'subcategories' : subcategories?.map((e) => e.toJson()).toList(),
    'quiz' : quiz?.map((e) => e.toJson()).toList()
  };
}

class Subcategories {
  final int? id;
  final String? name;
  final String? image;
  final int? categoryId;
  final String? createdAt;
  final String? updatedAt;

  Subcategories({
    this.id,
    this.name,
    this.image,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
  });

  Subcategories.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        image = json['image'] as String?,
        categoryId = json['category_id'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'image' : image,
    'category_id' : categoryId,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class Quiz {
  final int? id;
  final dynamic lessonId;
  final int? categoryId;
  final int? subcategoryId;
  final String? name;
  final dynamic slug;
  final String? timer;
  final int? answered;
  final int? points;
  final int? examStatus;
  final String? amount;
  final String? passingscore;
  final String? passingpoint;
  final String? pdf;
  final String? createdAt;
  final String? updatedAt;
  final List<Questions>? questions;

  Quiz({
    this.id,
    this.lessonId,
    this.categoryId,
    this.subcategoryId,
    this.name,
    this.slug,
    this.timer,
    this.answered,
    this.points,
    this.examStatus,
    this.amount,
    this.passingscore,
    this.passingpoint,
    this.pdf,
    this.createdAt,
    this.updatedAt,
    this.questions,
  });

  Quiz.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        lessonId = json['lesson_id'],
        categoryId = json['category_id'] as int?,
        subcategoryId = json['subcategory_id'] as int?,
        name = json['name'] as String?,
        slug = json['slug'],
        timer = json['timer'] as String?,
        answered = json['answered'] as int?,
        points = json['points'] as int?,
        examStatus = json['exam_status'] as int?,
        amount = json['amount'] as String?,
        passingscore = json['passingscore'] as String?,
        passingpoint = json['passingpoint'] as String?,
        pdf = json['pdf'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        questions = (json['questions'] as List?)?.map((dynamic e) => Questions.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'lesson_id' : lessonId,
    'category_id' : categoryId,
    'subcategory_id' : subcategoryId,
    'name' : name,
    'slug' : slug,
    'timer' : timer,
    'answered' : answered,
    'points' : points,
    'exam_status' : examStatus,
    'amount' : amount,
    'passingscore' : passingscore,
    'passingpoint' : passingpoint,
    'pdf' : pdf,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'questions' : questions?.map((e) => e.toJson()).toList()
  };
}

class Questions {
  final int? id;
  final int? quizId;
  final String? question;
  final String? image;
  final int? answer;
  final String? createdAt;
  final String? updatedAt;
  final List<Options>? options;

  Questions({
    this.id,
    this.quizId,
    this.question,
    this.image,
    this.answer,
    this.createdAt,
    this.updatedAt,
    this.options,
  });

  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        quizId = json['quiz_id'] as int?,
        question = json['question'] as String?,
        image = json['image'] as String?,
        answer = json['answer'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        options = (json['options'] as List?)?.map((dynamic e) => Options.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'quiz_id' : quizId,
    'question' : question,
    'image' : image,
    'answer' : answer,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'options' : options?.map((e) => e.toJson()).toList()
  };
}

class Options {
  final int? id;
  final int? quizId;
  final int? mcqQuesId;
  final String? option;
  final int? isAnswer;
  final String? createdAt;
  final String? updatedAt;

  Options({
    this.id,
    this.quizId,
    this.mcqQuesId,
    this.option,
    this.isAnswer,
    this.createdAt,
    this.updatedAt,
  });

  Options.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        quizId = json['quiz_id'] as int?,
        mcqQuesId = json['mcq_ques_id'] as int?,
        option = json['option'] as String?,
        isAnswer = json['isAnswer'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'quiz_id' : quizId,
    'mcq_ques_id' : mcqQuesId,
    'option' : option,
    'isAnswer' : isAnswer,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}
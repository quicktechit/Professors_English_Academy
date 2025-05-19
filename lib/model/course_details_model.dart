import 'package:professors_english_academy/model/practice_question_model.dart';

class CourseDetailsModel {
  final String? message;
  final List<Data>? data;

  CourseDetailsModel({
    this.message,
    this.data,
  });

  CourseDetailsModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'message' : message,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final int? id;
  final int? instructorId;
  final int? categoryId;
  final dynamic subcategoryId;
  final dynamic childcategoryId;
  final dynamic childsubcategoryId;
  final int? enrolled;
  final String? name;
  final int? price;
  final int? discount;
  final int? oldPrice;
  final int? discountPrice;
  final int? revenue;
  final dynamic instructorCommision;
  final int? commisionAmount;
  final int? commisionDue;
  final int? commisionPaid;
  final dynamic commisionPaystatus;
  final String? thumbnilImage;
  final String? details;
  final String? detailsFile;
  final String? syllabusFile;
  final dynamic certificateImage;
  final dynamic certificateText;
  final dynamic zoomLink;
  final dynamic zoomPassword;
  final dynamic zoomVideo;
  final dynamic embedVideo;
  final dynamic courseType;
  final dynamic skillLevel;
  final String? buy;
  final String? level;
  final int? status;
  final int? trending;
  final int? featured;
  final int? favorite;
  final int? common;
  final String? createdAt;
  final String? updatedAt;
  final int? reviewCount;
  final int? enrolledCount;
  final String? reviewAvgRating;
  final int? quizCount;
  final int? classCount;
  final List<String>? syllabuslist;
  final bool? alreadyEnrolled;
  final int? moduleCompleted;
  final Instructor? instructor;
  final List<Modules>? modules;
  final List<Faqs>? faqs;
  final List<Review>? review;

  Data({
    this.id,
    this.instructorId,
    this.categoryId,
    this.subcategoryId,
    this.childcategoryId,
    this.childsubcategoryId,
    this.enrolled,
    this.name,
    this.price,
    this.discount,
    this.oldPrice,
    this.discountPrice,
    this.revenue,
    this.instructorCommision,
    this.commisionAmount,
    this.commisionDue,
    this.commisionPaid,
    this.commisionPaystatus,
    this.thumbnilImage,
    this.details,
    this.detailsFile,
    this.syllabusFile,
    this.certificateImage,
    this.certificateText,
    this.zoomLink,
    this.zoomPassword,
    this.zoomVideo,
    this.embedVideo,
    this.courseType,
    this.skillLevel,
    this.buy,
    this.level,
    this.status,
    this.trending,
    this.featured,
    this.favorite,
    this.common,
    this.createdAt,
    this.updatedAt,
    this.reviewCount,
    this.enrolledCount,
    this.reviewAvgRating,
    this.quizCount,
    this.classCount,
    this.syllabuslist,
    this.alreadyEnrolled,
    this.moduleCompleted,
    this.instructor,
    this.modules,
    this.faqs,
    this.review,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        instructorId = json['instructor_id'] as int?,
        categoryId = json['category_id'] as int?,
        subcategoryId = json['subcategory_id'],
        childcategoryId = json['childcategory_id'],
        childsubcategoryId = json['childsubcategory_id'],
        enrolled = json['enrolled'] as int?,
        name = json['name'] as String?,
        price = json['price'] as int?,
        discount = json['discount'] as int?,
        oldPrice = json['old_price'] as int?,
        discountPrice = json['discount_price'] as int?,
        revenue = json['revenue'] as int?,
        instructorCommision = json['instructor_commision'],
        commisionAmount = json['commision_amount'] as int?,
        commisionDue = json['commision_due'] as int?,
        commisionPaid = json['commision_paid'] as int?,
        commisionPaystatus = json['commision_paystatus'],
        thumbnilImage = json['thumbnil_image'] as String?,
        details = json['details'] as String?,
        detailsFile = json['details_file'] as String?,
        syllabusFile = json['syllabus_file'] as String?,
        certificateImage = json['certificate_image'],
        certificateText = json['certificate_text'],
        zoomLink = json['zoom_link'],
        zoomPassword = json['zoom_password'],
        zoomVideo = json['zoom_video'],
        embedVideo = json['embed_video'],
        courseType = json['course_type'],
        skillLevel = json['skill_level'],
        buy = json['buy'] as String?,
        level = json['level'] as String?,
        status = json['status'] as int?,
        trending = json['trending'] as int?,
        featured = json['featured'] as int?,
        favorite = json['favorite'] as int?,
        common = json['common'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        reviewCount = json['review_count'] as int?,
        enrolledCount = json['enrolled_count'] as int?,
        reviewAvgRating = json['review_avg_rating'].toString(),
        quizCount = json['quiz_count'] as int?,
        classCount = json['class_count'] as int?,
        syllabuslist = (json['syllabuslist'] as List?)?.map((dynamic e) => e as String).toList(),
        alreadyEnrolled = json['already_enrolled'] as bool?,
        moduleCompleted = json['module_completed'] as int?,
        instructor = (json['instructor'] as Map<String,dynamic>?) != null ? Instructor.fromJson(json['instructor'] as Map<String,dynamic>) : null,
        modules = (json['modules'] as List?)?.map((dynamic e) => Modules.fromJson(e as Map<String,dynamic>)).toList(),
        faqs = (json['faqs'] as List?)?.map((dynamic e) => Faqs.fromJson(e as Map<String,dynamic>)).toList(),
        review = (json['review'] as List?)?.map((dynamic e) => Review.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'instructor_id' : instructorId,
    'category_id' : categoryId,
    'subcategory_id' : subcategoryId,
    'childcategory_id' : childcategoryId,
    'childsubcategory_id' : childsubcategoryId,
    'enrolled' : enrolled,
    'name' : name,
    'price' : price,
    'discount' : discount,
    'old_price' : oldPrice,
    'discount_price' : discountPrice,
    'revenue' : revenue,
    'instructor_commision' : instructorCommision,
    'commision_amount' : commisionAmount,
    'commision_due' : commisionDue,
    'commision_paid' : commisionPaid,
    'commision_paystatus' : commisionPaystatus,
    'thumbnil_image' : thumbnilImage,
    'details' : details,
    'details_file' : detailsFile,
    'syllabus_file' : syllabusFile,
    'certificate_image' : certificateImage,
    'certificate_text' : certificateText,
    'zoom_link' : zoomLink,
    'zoom_password' : zoomPassword,
    'zoom_video' : zoomVideo,
    'embed_video' : embedVideo,
    'course_type' : courseType,
    'skill_level' : skillLevel,
    'buy' : buy,
    'level' : level,
    'status' : status,
    'trending' : trending,
    'featured' : featured,
    'favorite' : favorite,
    'common' : common,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'review_count' : reviewCount,
    'enrolled_count' : enrolledCount,
    'review_avg_rating' : reviewAvgRating,
    'quiz_count' : quizCount,
    'class_count' : classCount,
    'syllabuslist' : syllabuslist,
    'already_enrolled' : alreadyEnrolled,
    'module_completed' : moduleCompleted,
    'instructor' : instructor?.toJson(),
    'modules' : modules?.map((e) => e.toJson()).toList(),
    'faqs' : faqs?.map((e) => e.toJson()).toList(),
    'review' : review?.map((e) => e.toJson()).toList()
  };
}

class Instructor {
  final int? id;
  final String? name;
  final String? email;
  final dynamic bio;
  final String? phone;
  final dynamic mobileBanking;
  final String? gender;
  final String? dob;
  final String? image;
  final String? profession;
  final String? institution;
  final String? department;
  final String? address;
  final dynamic youtubeLink;
  final dynamic about;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  Instructor({
    this.id,
    this.name,
    this.email,
    this.bio,
    this.phone,
    this.mobileBanking,
    this.gender,
    this.dob,
    this.image,
    this.profession,
    this.institution,
    this.department,
    this.address,
    this.youtubeLink,
    this.about,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Instructor.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        email = json['email'] as String?,
        bio = json['bio'],
        phone = json['phone'] as String?,
        mobileBanking = json['mobile_banking'],
        gender = json['gender'] as String?,
        dob = json['dob'] as String?,
        image = json['image'] as String?,
        profession = json['profession'] as String?,
        institution = json['institution'] as String?,
        department = json['department'] as String?,
        address = json['address'] as String?,
        youtubeLink = json['youtube_link'],
        about = json['about'],
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'email' : email,
    'bio' : bio,
    'phone' : phone,
    'mobile_banking' : mobileBanking,
    'gender' : gender,
    'dob' : dob,
    'image' : image,
    'profession' : profession,
    'institution' : institution,
    'department' : department,
    'address' : address,
    'youtube_link' : youtubeLink,
    'about' : about,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class Modules {
  final int? id;
  final int? courseId;
  final String? name;
  final String? description;
  final dynamic image;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final bool? completed;
  final List<Lessons>? lessons;

  Modules({
    this.id,
    this.courseId,
    this.name,
    this.description,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.completed,
    this.lessons,
  });

  Modules.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        courseId = json['course_id'] as int?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        image = json['image'],
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        completed = json['completed'] as bool?,
        lessons = (json['lessons'] as List?)?.map((dynamic e) => Lessons.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'course_id' : courseId,
    'name' : name,
    'description' : description,
    'image' : image,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'completed' : completed,
    'lessons' : lessons?.map((e) => e.toJson()).toList()
  };
}

class Lessons {
  final int? id;
  final int? moduleId;
  final String? name;
  final String? description;
  final dynamic image;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final List<Videos>? videos;
  final List<QuestionData>? quizzes;

  Lessons({
    this.id,
    this.moduleId,
    this.name,
    this.description,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.videos,
    this.quizzes,
  });

  Lessons.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        moduleId = json['module_id'] as int?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        image = json['image'],
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        videos = (json['videos'] as List?)?.map((dynamic e) => Videos.fromJson(e as Map<String,dynamic>)).toList(),
        quizzes = (json['quizzes'] as List?)?.map((dynamic e) => QuestionData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'module_id' : moduleId,
    'name' : name,
    'description' : description,
    'image' : image,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'videos' : videos?.map((e) => e.toJson()).toList(),
    'quizzes' : quizzes?.map((e) => e.toJson()).toList()
  };
}

class Videos {
  final int? id;
  final int? lessonId;
  final String? name;
  final dynamic link;
  final dynamic duration;
  final String? image;
  final int? free;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  Videos({
    this.id,
    this.lessonId,
    this.name,
    this.link,
    this.duration,
    this.image,
    this.free,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Videos.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        lessonId = json['lesson_id'] as int?,
        name = json['name'] as String?,
        link = json['link'],
        duration = json['duration'],
        image = json['image'] as String?,
        free = json['free'] as int?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'lesson_id' : lessonId,
    'name' : name,
    'link' : link,
    'duration' : duration,
    'image' : image,
    'free' : free,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class Quizzes {
  final int? id;
  final int? lessonId;
  final int? categoryId;
  final int? subcategoryId;
  final String? name;
  final dynamic slug;
  final String? timer;
  final int? answered;
  final int? points;
  final dynamic examStatus;
  final dynamic amount;
  final dynamic passingscore;
  final dynamic passingpoint;
  final dynamic pdf;
  final String? createdAt;
  final String? updatedAt;
  final List<Questions>? questions;

  Quizzes({
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

  Quizzes.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        lessonId = json['lesson_id'] as int?,
        categoryId = json['category_id'] as int?,
        subcategoryId = json['subcategory_id'] as int?,
        name = json['name'] as String?,
        slug = json['slug'],
        timer = json['timer'] as String?,
        answered = json['answered'] as int?,
        points = json['points'] as int?,
        examStatus = json['exam_status'],
        amount = json['amount'],
        passingscore = json['passingscore'],
        passingpoint = json['passingpoint'],
        pdf = json['pdf'],
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
  final dynamic image;
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
        image = json['image'],
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

class Faqs {
  final int? id;
  final int? courseId;
  final String? question;
  final String? answer;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  Faqs({
    this.id,
    this.courseId,
    this.question,
    this.answer,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Faqs.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        courseId = json['course_id'] as int?,
        question = json['question'] as String?,
        answer = json['answer'] as String?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'course_id' : courseId,
    'question' : question,
    'answer' : answer,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class Review {
  final int? id;
  final String? studentId;
  final int? courseId;
  final dynamic ebookId;
  final String? rating;
  final String? reviewText;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final Student? student;

  Review({
    this.id,
    this.studentId,
    this.courseId,
    this.ebookId,
    this.rating,
    this.reviewText,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.student,
  });

  Review.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        studentId = json['student_id'] as String?,
        courseId = json['course_id'] as int?,
        ebookId = json['ebook_id'],
        rating = json['rating'] as String?,
        reviewText = json['review_text'] as String?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        student = (json['student'] as Map<String,dynamic>?) != null ? Student.fromJson(json['student'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'student_id' : studentId,
    'course_id' : courseId,
    'ebook_id' : ebookId,
    'rating' : rating,
    'review_text' : reviewText,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'student' : student?.toJson()
  };
}

class Student {
  final int? id;
  final String? name;
  final int? maxDevice;
  final String? phone;
  final String? email;
  final dynamic address;
  final dynamic image;
  final String? password;
  final String? verifyToken;
  final dynamic passresetToken;
  final dynamic gender;
  final dynamic religion;
  final dynamic blood;
  final dynamic institution;
  final dynamic course;
  final dynamic batch;
  final int? status;
  final dynamic enrolledcourse;
  final String? createdAt;
  final String? updatedAt;

  Student({
    this.id,
    this.name,
    this.maxDevice,
    this.phone,
    this.email,
    this.address,
    this.image,
    this.password,
    this.verifyToken,
    this.passresetToken,
    this.gender,
    this.religion,
    this.blood,
    this.institution,
    this.course,
    this.batch,
    this.status,
    this.enrolledcourse,
    this.createdAt,
    this.updatedAt,
  });

  Student.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        maxDevice = json['max_device'] as int?,
        phone = json['phone'] as String?,
        email = json['email'] as String?,
        address = json['address'],
        image = json['image'],
        password = json['password'] as String?,
        verifyToken = json['verifyToken'] as String?,
        passresetToken = json['passresetToken'],
        gender = json['gender'],
        religion = json['religion'],
        blood = json['blood'],
        institution = json['institution'],
        course = json['course'],
        batch = json['batch'],
        status = json['status'] as int?,
        enrolledcourse = json['enrolledcourse'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'max_device' : maxDevice,
    'phone' : phone,
    'email' : email,
    'address' : address,
    'image' : image,
    'password' : password,
    'verifyToken' : verifyToken,
    'passresetToken' : passresetToken,
    'gender' : gender,
    'religion' : religion,
    'blood' : blood,
    'institution' : institution,
    'course' : course,
    'batch' : batch,
    'status' : status,
    'enrolledcourse' : enrolledcourse,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}
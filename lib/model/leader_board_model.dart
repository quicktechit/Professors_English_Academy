class LeaderBoardModel {
  final int? rank;
  final int? studentId;
  final Student? student;
  final int? totalAttempts;
  final int? totalQuestions;
  final int? totalRightAnswers;

  LeaderBoardModel({
    this.rank,
    this.studentId,
    this.student,
    this.totalAttempts,
    this.totalQuestions,
    this.totalRightAnswers,
  });

  LeaderBoardModel.fromJson(Map<String, dynamic> json)
      : rank = json['rank'] as int?,
        studentId = json['student_id'] as int?,
        student = (json['student'] as Map<String,dynamic>?) != null ? Student.fromJson(json['student'] as Map<String,dynamic>) : null,
        totalAttempts = json['total_attempts'] as int?,
        totalQuestions = json['total_questions'] as int?,
        totalRightAnswers = json['total_right_answers'] as int?;

  Map<String, dynamic> toJson() => {
    'rank' : rank,
    'student_id' : studentId,
    'student' : student?.toJson(),
    'total_attempts' : totalAttempts,
    'total_questions' : totalQuestions,
    'total_right_answers' : totalRightAnswers
  };
}

class Student {
  final int? id;
  final String? name;
  final int? maxDevice;
  final String? phone;
  final String? email;
  final dynamic address;
  final String? image;
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
  final String? enrolledcourse;
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
        enrolledcourse = json['enrolledcourse'] as String?,
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
class SliderModel {
  final String? message;
  final List<Data>? data;

  SliderModel({
    this.message,
    this.data,
  });

  SliderModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'message' : message,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final int? id;
  final int? courseId;
  final String? photoName;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  Data({
    this.id,
    this.courseId,
    this.photoName,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        courseId = json['course_id'] as int?,
        photoName = json['photo_name'] as String?,
        status = json['status'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'course_id' : courseId,
    'photo_name' : photoName,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}
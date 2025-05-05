class PrivacyTermsModel {
  final String? message;
  final List<Datas>? data;

  PrivacyTermsModel({
    this.message,
    this.data,
  });

  PrivacyTermsModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => Datas.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'message' : message,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Datas {
  final int? id;
  final String? name;
  final String? details;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  Datas({
    this.id,
    this.name,
    this.details,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Datas.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        details = json['details'] as String?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'details' : details,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}
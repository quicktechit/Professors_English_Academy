class ProfileModel {
  final User? user;
  final List<EnrolledCourses>? enrolledCourses;

  ProfileModel({
    this.user,
    this.enrolledCourses,
  });

  ProfileModel.fromJson(Map<String, dynamic> json)
      : user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null,
        enrolledCourses = (json['enrolled_courses'] as List?)?.map((dynamic e) => EnrolledCourses.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'user' : user?.toJson(),
    'enrolled_courses' : enrolledCourses?.map((e) => e.toJson()).toList()
  };
}

class User {
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
  final String? enrolledcourse;
  final String? createdAt;
  final String? updatedAt;

  User({
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

  User.fromJson(Map<String, dynamic> json)
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

class EnrolledCourses {
  final int? id;
  final int? instructorId;
  final int? categoryId;
  final dynamic subcategoryId;
  final dynamic childcategoryId;
  final dynamic childsubcategoryId;
  final int? enrolled;
  final String? name;
  final int? price;
  final dynamic discount;
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
  final dynamic detailsFile;
  final dynamic syllabusFile;
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
  final int? moduleCompletedPercentage;
  final int? moduleCompleted;
  final List<Modules>? modules;

  EnrolledCourses({
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
    this.moduleCompletedPercentage,
    this.moduleCompleted,
    this.modules,
  });

  EnrolledCourses.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        instructorId = json['instructor_id'] as int?,
        categoryId = json['category_id'] as int?,
        subcategoryId = json['subcategory_id'],
        childcategoryId = json['childcategory_id'],
        childsubcategoryId = json['childsubcategory_id'],
        enrolled = json['enrolled'] as int?,
        name = json['name'] as String?,
        price = json['price'] as int?,
        discount = json['discount'],
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
        detailsFile = json['details_file'],
        syllabusFile = json['syllabus_file'],
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
        moduleCompletedPercentage = json['module_completed_percentage'] as int?,
        moduleCompleted = json['module_completed'] as int?,
        modules = (json['modules'] as List?)?.map((dynamic e) => Modules.fromJson(e as Map<String,dynamic>)).toList();

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
    'module_completed_percentage' : moduleCompletedPercentage,
    'module_completed' : moduleCompleted,
    'modules' : modules?.map((e) => e.toJson()).toList()
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

  Modules({
    this.id,
    this.courseId,
    this.name,
    this.description,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Modules.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        courseId = json['course_id'] as int?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        image = json['image'],
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'course_id' : courseId,
    'name' : name,
    'description' : description,
    'image' : image,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}
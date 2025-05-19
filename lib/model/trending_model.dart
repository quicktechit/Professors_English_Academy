class TrendingModel {
  final String? message;
  final List<Data>? data;

  TrendingModel({
    this.message,
    this.data,
  });

  TrendingModel.fromJson(Map<String, dynamic> json)
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
        classCount = json['class_count'] as int?;

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
    'class_count' : classCount
  };
}
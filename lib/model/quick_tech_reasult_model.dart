class ResultModel {
  final String? formattedScore;
  final int? score;
  final int? totalPoints;
  final String? percentage;

  ResultModel({
    this.formattedScore,
    this.score,
    this.totalPoints,
    this.percentage,
  });

  ResultModel.fromJson(Map<String, dynamic> json)
      : formattedScore = json['formattedScore'] as String?,
        score = json['score'] as int?,
        totalPoints = json['totalPoints'] as int?,
        percentage = json['percentage'].toString();

  Map<String, dynamic> toJson() => {
    'formattedScore' : formattedScore,
    'score' : score,
    'totalPoints' : totalPoints,
    'percentage' : percentage
  };
}
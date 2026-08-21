class ReviewEntity {
  final double rating;
  final String comment;
  final String date;
  final String reviewerName;

  const ReviewEntity({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
  });
}

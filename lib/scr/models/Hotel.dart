class Hotel {
  String name;
  double rating;
  String image;
  int stars;
  int numReviews;
  String location;
  List<Room> availableRooms;

  static String stringifyRating(double rating) {
    if (rating < 2.0) return "Terrible";
    if (rating >= 2.0 && rating < 4.0) return "Bad";
    if (rating >= 4.0 && rating < 6.0) return "Good";
    if (rating >= 6.0 && rating < 8.0) return "Very Good";

    return "Excellent";
  }

  Hotel(
      {required this.name,
      required this.image,
      required this.rating,
      required this.stars,
      required this.numReviews,
      required this.location,
      this.availableRooms = const []});
}

class Room {
  String type;
  DateTime? checkInDate;
  DateTime? checkOutDate;
  int price;
  String details;
  Room(
      {required this.type,
      required this.price,
      this.details = "1 night , 1 adult",
      this.checkInDate,
      this.checkOutDate});
}

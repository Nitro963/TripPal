

class Hotel{
  String name;
  double raiting;
  String image; 
  int stars;
  int numReviews;
  String location;
  List<Room> avalibaleRooms;
  static String stringRaiting(double raiting) 
  {
    if(raiting <2.0)return "Teribale";
    else if(raiting>=2.0 && raiting <4.0)return "Bad";
    else if (raiting >=4.0 && raiting <6.0)return "Good";
    else if (raiting >=6.0 &&raiting <8.0)return "Very Good";
    else return "Excellent";
  }
  Hotel({this.name,this.image,this.raiting,this.stars,this.numReviews,this.location,this.avalibaleRooms});
}

 class Room 
{
    String type;
    DateTime checkInDate;
    DateTime checkOutDate;
    int price;
    String details;
    Room({this.type,this.price,this.details="1 night , 1 adult"});
}
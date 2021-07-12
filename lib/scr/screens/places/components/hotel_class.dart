class Hotel {
  int id;
  String name;
  double starRating;
  String guestrating;
  String address;
  String street;
  String price;
  Coordinate coordinate;
  // Deals deals;
  String imgURL;
  String features;
  Hotel._internal(
      this.id,
      this.name,
      this.starRating,
      this.guestrating,
      this.address,
      this.street,
      this.price,
      this.coordinate,
      // this.deals,
      this.imgURL,
      this.features);

  static Map<int, Hotel> _cashe = <int, Hotel>{};

  factory Hotel(
    int id,
    String name,
    double starRating,
    String guestrating,
    String address,
    String street,
    String price,
    Coordinate coordinate,
    // Deals deals,
    String imgURL,
    String features,
  ) {
    if (_cashe.containsKey(id)) {
      return _cashe['id'];
    } else {
      final hotel = Hotel._internal(id, name, starRating, guestrating, address,
          street, price, coordinate, imgURL, features);
      _cashe[id] = hotel;
      return hotel;
    }
  }

  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    starRating = json['starRating'];
    guestrating = json['guestrating'];
    address = json['address'];
    street = json['street'];
    // price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    price = "120\$";
    coordinate = json['coordinate'] != null
        ? new Coordinate.fromJson(json['coordinate'])
        : null;
    // deals = json['deals'] != null ? new Deals.fromJson(json['deals']) : null;
    imgURL = json['imgURL'];
    // features = json['features'];
    // features = json['features'] != null
    //     ? new Features.fromJson(json['features'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['starRating'] = this.starRating;
    data['guestrating'] = this.guestrating;
    data['address'] = this.address;
    data['street'] = this.street;
    data['price'] = this.price;
    // if (this.price != null) {
    //   data['price'] = this.price.toJson();
    // }
    if (this.coordinate != null) {
      data['coordinate'] = this.coordinate.toJson();
    }
    // if (this.deals != null) {
    //   data['deals'] = this.deals.toJson();
    // }
    data['imgURL'] = this.imgURL;
    // if (this.features != null) {
    //   data['features'] = this.features.toJson();
    // }
    return data;
  }

  String stringRaitingExp() {
    double val = double.parse(guestrating);
    if (val < 2.0)
      return "Teribale";
    else if (val >= 2.0 && val < 4.0)
      return "Bad";
    else if (val >= 4.0 && val < 6.0)
      return "Good";
    else if (val >= 6.0 && val < 8.0)
      return "Very Good";
    else
      return "Excellent";
  }
}

// class Price {
//   int oldPrice;
//   String newPrice;

//   Price({this.oldPrice, this.newPrice});

//   Price.fromJson(Map<String, dynamic> json) {
//     oldPrice = json['old_price'];
//     newPrice = json['new_price'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['old_price'] = this.oldPrice;
//     data['new_price'] = this.newPrice;
//     return data;
//   }
// }

class Coordinate {
  double lat;
  double lon;

  Coordinate({this.lat, this.lon});

  Coordinate.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}

// class Deals {
//   String deal;
//   Deals({this.deal});

//   Deals.fromJson(Map<String, dynamic> json) {}

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     return data;
//   }
// }

class Features {
  bool paymentPreference;
  bool noCCRequired;

  Features({this.paymentPreference, this.noCCRequired});

  Features.fromJson(Map<String, dynamic> json) {
    paymentPreference = json['paymentPreference'];
    noCCRequired = json['noCCRequired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paymentPreference'] = this.paymentPreference;
    data['noCCRequired'] = this.noCCRequired;
    return data;
  }
}

import 'package:trip_pal_null_safe/models/user.dart';
import 'package:intl/intl.dart' as intl;
import 'abstract_model.dart';
import 'day.dart';
enum TripType {Extended,Foucesd}
extension TripTypeExtended on TripType {
 static TripType intToTripType(int? type)
  {
    switch (type) {
      case 1: return TripType.Extended;
      case 2: return TripType.Foucesd;
      default: return TripType.Extended;
    }
  }
 static int tripTypeToInt(TripType type){
    switch(type){
      case TripType.Extended: return 1;
      case TripType.Foucesd: return 2;
      default :return 2;
    }
    }
    static String stringify(TripType type){
      return type.toString().split(".")[1];
    }
  
}
class Trip extends IModel {
  User user;
  DateTime startDate;
  List<Day> days;
  String? imageUrl;
  List<String> cities;
  TripType? tripeType;

  Trip({id,required this.user, required this.startDate, required this.days,this.imageUrl,this.cities = const [],this.tripeType})
      : super(id);

  @override
  Map<String, dynamic> toJson() {
    return {
      'user': this.user.toJson(),
      'days': this.days,
      'start_date': intl.DateFormat("yyyy-mmmm-dd").format(this.startDate),
      'trip_type':TripTypeExtended.tripTypeToInt(this.tripeType!),
      'cities':this.cities,
      'image':this.imageUrl
    };
  }

  static Trip fromJson(dynamic json) {
    var days = (json['days'] as List).map((element) {
      try {
        var id = element as int;
        return Day.fromJson({'id': id,});
      } catch (e) {
        return Day.fromJson(element as Map<String, dynamic>);
      }
    }).toList();
    days.sort((a, b) => ((a.dayIndex?? -1) - (b.dayIndex?? -1))) ;
    List<String> cities =json['cities'] != null ?(json['cities'] as List).map((element){
      return element as String;
    }).toList() : [];
    return Trip(
      id: json['id'],
      user: User.fromJson(json['user']),
      startDate: intl.DateFormat('yyyy-mm-dd').parse(json['start_date']),
      days: days,
      tripeType:TripTypeExtended.intToTripType(json['trip_type']!),
      imageUrl: json['image'],
      cities: cities
    );
  }
}

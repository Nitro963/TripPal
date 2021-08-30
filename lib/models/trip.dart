import 'package:trip_pal_null_safe/models/user.dart';
import 'package:intl/intl.dart' as intl;
import 'abstract_model.dart';
import 'day.dart';

enum TripType { Extended, Foucesd }

extension TripTypeExtended on TripType {
  static TripType intToTripType(int? type) {
    switch (type) {
      case 1:
        return TripType.Extended;
      case 2:
        return TripType.Foucesd;
      default:
        return TripType.Extended;
    }
  }

  static int tripTypeToInt(TripType type) {
    switch (type) {
      case TripType.Extended:
        return 1;
      case TripType.Foucesd:
        return 2;
      default:
        return 2;
    }
  }

  static String stringify(TripType type) {
    return type.toString().split(".")[1];
  }
}

class Trip extends IModel {
  User? user;
  DateTime? startDate;
  List<Day> days;
  String? imageUrl;
  List<String> cities;
  TripType? tripeType;

  Trip(
      {id,
      this.user,
      this.startDate,
      this.days = const [],
      this.imageUrl,
      this.cities = const [],
      this.tripeType})
      : super(id);

  @override
  Map<String, dynamic> toJson() {
    var days = this.days.map((e) => e.toJson());
    return {
      'user': this.user?.toJson(),
      'days': days,
      'start_date': startDate != null
          ? intl.DateFormat("yyyy-MM-dd").format(startDate!)
          : null,
      'trip_type': TripTypeExtended.tripTypeToInt(this.tripeType!),
      'cities': this.cities,
      'image': this.imageUrl
    };
  }

  static final dateFormatter = intl.DateFormat('yyyy-MM-dd');
  static Trip fromJson(dynamic json) {
    var days = (json['days'] as List).map((element) {
      try {
        var id = element as int;
        return Day.fromJson({
          'id': id,
        });
      } catch (e) {
        return Day.fromJson(element as Map<String, dynamic>);
      }
    }).toList();
    days.sort((a, b) => ((a.dayIndex ?? -1) - (b.dayIndex ?? -1)));
    List<String> cities = json['cities'] != null
        ? (json['cities'] as List).map((element) {
            return element as String;
          }).toList()
        : [];
    var t = Trip(
        id: json['id'],
        user: User.fromJson(json['user']),
        startDate: dateFormatter.parse(json['start_date']),
        days: days,
        tripeType: TripTypeExtended.intToTripType(json['trip_type']!),
        imageUrl: json['image'],
        cities: cities);
    return t;
  }
}

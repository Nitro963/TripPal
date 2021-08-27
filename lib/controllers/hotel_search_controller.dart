import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

class HotelSearchController extends GetxController {
  final _cityName = ''.obs;
  final _rooms = 0.obs;
  final _adults = 0.obs;
  final _children = 0.obs;
  DateTime? checkInDate;
  DateTime? checkOutDate;
  final _formattedDateTime = 'Check-in Date - Check-out Date'.obs;
  final _formatter = intl.DateFormat(intl.DateFormat.MONTH_DAY);

  final key = GlobalKey<FormState>();

  String get cityName => _cityName.value;
  set cityName(String value) {
    _cityName.value = value;
  }

  int get rooms => _rooms.value;
  set rooms(int value) {
    _rooms.value = value;
  }

  int get adults => _adults.value;
  set adults(int value) {
    _adults.value = value;
  }

  int get children => _children.value;
  set children(int value) {
    _children.value = value;
  }

  String get formattedDate => _formattedDateTime.value;

  void updateDates(DateTime checkInDate, DateTime checkOutDate) {
    this.checkInDate = checkInDate;
    this.checkOutDate = checkOutDate;
    _formattedDateTime.value =
        '${_formatter.format(checkInDate)} - ${_formatter.format(checkOutDate)}';
  }
}

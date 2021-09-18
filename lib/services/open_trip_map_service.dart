import 'package:trip_pal_null_safe/models/map_place.dart';
import 'package:trip_pal_null_safe/utilities/api_request.dart';

class OpenTripMapApi {
  final apiKey = '5ae2e3f221c38a28845f05b61f6983d09ef19a35837145ac8fbff9e7';
  void getLocationId({
    required String cityName,
    Function(Map<String, dynamic>)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(
        url: "https://api.opentripmap.com/0.1/en/places/geoname?",
        data: {'name': cityName, 'apikey': apiKey}).get(
      onSuccess: (data) {
        onSuccess!(data);
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
  void getPlacesList({
    required double lat,
    required double lon,
    required int radius,
    required String kinds,
    Function(List<MapPlace>)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(
        url: "https://api.opentripmap.com/0.1/en/places/radius?",
        data: {'radius': radius, 'lon' : lon, 'lat' : lat, 'kinds': 'foods', 'apikey': apiKey}).get(
      onSuccess: (data) {
        print(data);
        onSuccess!((data['features'] as List).map((mapPlace) => MapPlace.fromJson(mapPlace))
            .toList());
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
  // void getHotelsList({
  //   Function(List<Hotel> hotels)? onSuccess,
  //   Function(dynamic error)? onError,
  // }) {
  //   ApiRequest(
  //           url: "https://hotels4.p.rapidapi.com/properties/list",
  //           data: {
  //             "destinationId": _searchController.hotelCityId,
  //             "pageNumber": "1",
  //             "pageSize": "25",
  //             "checkIn": _searchController.checkInDate,
  //             "checkOut": _searchController.checkOutDate,
  //             "adults1": _searchController.adultsCount,
  //             "sortOrder": _searchController.sortOrder,
  //             "locale": "en_US",
  //             "currency": "USD"
  //           },
  //           header: headers1)
  //       .get(
  //     onSuccess: (data) {
  //       onSuccess!((data['data']['body']['searchResults']['results'] as List)
  //           .map((hotelJson) => Hotel.fromJson(hotelJson))
  //           .toList());
  //     },
  //     onError: (error) => {if (onError != null) onError(error)},
  //   );
  // }

  // void getHotelDetails({
  //   Function(dynamic data)? onSuccess,
  //   Function(dynamic error)? onError,
  // }) {
  //   ApiRequest(
  //       header: headers1,
  //       url: "https://hotels4.p.rapidapi.com/properties/get-details",
  //       data: {
  //         "id": _searchController.selectedHotelId,
  //         "checkIn": "2020-01-08",
  //         "checkOut": "2020-01-15",
  //         "adults1": "1",
  //         "currency": "USD",
  //         "locale": "en_US"
  //       }).get(
  //     onSuccess: (data) {
  //       onSuccess!(data['data']['body']);
  //     },
  //     onError: (error) => {if (onError != null) onError(error)},
  //   );
  // }

  // void getHotelPhotos({
  //   Function(dynamic data)? onSuccess,
  //   Function(dynamic error)? onError,
  // }) {
  //   ApiRequest(
  //       header: headers1,
  //       url: "https://hotels4.p.rapidapi.com/properties/get-hotel-photos",
  //       data: {"id": _searchController.selectedHotelId}).get(
  //     onSuccess: (data) {
  //       onSuccess!(data);
  //     },
  //     onError: (error) => {if (onError != null) onError(error)},
  //   );
  // }
}

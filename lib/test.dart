import 'package:trip_pal_null_safe/utilities/networking_utils.dart';

void main() async {
  var client =
      DioConnect(baseUrl: '172.20.20.90:8085', httpScheme: HttpScheme.http);
  var x = await client.post(
      '/api/user-login', {'username': 'ahmad98', 'password': '123456789'});
  print(x);
}

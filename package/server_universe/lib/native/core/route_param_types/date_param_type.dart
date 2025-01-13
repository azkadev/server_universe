/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
import 'http_route_param_type.dart';

/// ServerUniverseUncompleteDocumentation
class DateParamType implements HttpRouteParamType {
  @override
  final String name = 'date';

  @override
  final String pattern =
      r'-?\d{1,6}/(?:0[1-9]|1[012])/(?:0[1-9]|[12][0-9]|3[01])';

  @override
  DateTime parse(String value) {
    // note: the RegExp enforces month between 1 and 12 and day between 1 and 31
    // but it does not care about leap years and actual number of days in month
    // DateTime will accept "invalid" dates and adjust the result accordingly
    // eg. 2021-02-31 --> 2021-03-03
    final components = value.split('/').map(int.parse).toList();
    return DateTime.utc(components[0], components[1], components[2]);
  }
}

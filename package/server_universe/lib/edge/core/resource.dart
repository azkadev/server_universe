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
import 'package:server_universe/edge/core/request.dart';

abstract class Resource {
  const factory Resource(String url) = StringValue;
  const factory Resource.uri(Uri uri) = UriValue;
  const factory Resource.request(Request request) = RequestValue;

  static Uri getUri(Resource resource) {
    if (resource is StringValue) {
      return Uri.parse(resource.url);
    } else if (resource is UriValue) {
      return resource.uri;
    } else {
      return (resource as RequestValue).request.url;
    }
  }
}

class StringValue implements Resource {
  final String url;

  const StringValue(this.url);
}

class UriValue implements Resource {
  final Uri uri;

  const UriValue(this.uri);
}

class RequestValue implements Resource {
  final Request request;

  const RequestValue(this.request);
}

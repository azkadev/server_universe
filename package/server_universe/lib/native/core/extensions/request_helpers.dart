// ignore_for_file: non_constant_identifier_names

/* <!-- START LICENSE -->


Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION 
Social Media: 

- Youtube: https://youtube.com/@Global_Corporation 
- Github: https://github.com/globalcorporation
- TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

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
import 'dart:io';

import '../../native.dart';
import '../route_matcher.dart';

/// Some convenience methods on the [HttpRequest] object to make the api
/// more like ExpressJS
///
extension RequestHelpers on HttpRequest {
  /// Parse the body automatically and return the result
  ///
  Future<Object?> get body async {
    const cachedBodyKey = '_cachedBodyResponse';
    final cachedBody = store.tryGet<Object?>(cachedBodyKey);
    if (cachedBody != null) {
      return cachedBody;
    } else {
      final dynamic body = (await HttpBodyHandler.processRequest(this)).body;
      store.set(cachedBodyKey, body);
      return body;
    }
  }

  /// Parse the body, and convert it to a json map
  ///
  Future<Map<String, dynamic>> get bodyAsJsonMap async =>
      Map<String, dynamic>.from((await body) as Map);

  /// Parse the body, and convert it to a json list
  ///
  Future<List<dynamic>> get bodyAsJsonList async => (await body) as List;

  /// Get the content type
  ///
  ContentType? get contentType => headers.contentType;

  /// Get params
  ///
  Map<String, dynamic> get params =>
      store.tryGet<HttpRouteMatch>('_internal_match')?.params ??
      <String, dynamic>{};

  /// Get the matched route URI of the current request
  ///
  String get route =>
      store.tryGet<HttpRouteMatch>('_internal_match')?.route.route ?? '';

  /// Get the matched route of the current request
  ///
  HttpRouteMatch? get match => store.tryGet<HttpRouteMatch>('_internal_match');

  /// Get the intercepted exception
  ///
  dynamic get exception => store.tryGet<dynamic>('_internal_exception');

  /// Get ServerUniverseNative instance which is associated with this request
  ///
  ServerUniverseNative get server_universe =>
      store.get<ServerUniverseNative>('_internal_server_universe');
}

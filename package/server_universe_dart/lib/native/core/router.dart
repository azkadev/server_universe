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
import 'dart:async';
import 'dart:io';

import 'package:server_universe_dart/native/core/route_group.dart';
import 'package:meta/meta.dart';

import 'server_universe_native.dart';
import 'http_route.dart';

mixin Router {
  @visibleForOverriding
  ServerUniverseNative get app;

  String get pathPrefix;

  /// Create a get route
  ///
  HttpRoute get(
    String path,
    FutureOr Function(HttpRequest req, HttpResponse res) callback, {
    List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware =
        const [],
  }) =>
      createRoute(Method.get, path, callback, middleware);

  /// Create a head route
  ///
  HttpRoute head(
    String path,
    FutureOr Function(HttpRequest req, HttpResponse res) callback, {
    List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware =
        const [],
  }) =>
      createRoute(Method.head, path, callback, middleware);

  /// Create a post route
  ///
  HttpRoute post(
    String path,
    FutureOr Function(HttpRequest req, HttpResponse res) callback, {
    List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware =
        const [],
  }) =>
      createRoute(Method.post, path, callback, middleware);

  /// Create a put route
  HttpRoute put(
    String path,
    FutureOr Function(HttpRequest req, HttpResponse res) callback, {
    List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware =
        const [],
  }) =>
      createRoute(Method.put, path, callback, middleware);

  /// Create a delete route
  ///
  HttpRoute delete(
    String path,
    FutureOr Function(HttpRequest req, HttpResponse res) callback, {
    List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware =
        const [],
  }) =>
      createRoute(Method.delete, path, callback, middleware);

  /// Create a patch route
  ///
  HttpRoute patch(
    String path,
    FutureOr Function(HttpRequest req, HttpResponse res) callback, {
    List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware =
        const [],
  }) =>
      createRoute(Method.patch, path, callback, middleware);

  /// Create an options route
  ///
  HttpRoute options(
    String path,
    FutureOr Function(HttpRequest req, HttpResponse res) callback, {
    List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware =
        const [],
  }) =>
      createRoute(Method.options, path, callback, middleware);

  /// Create a route that listens on all methods
  ///
  HttpRoute all(
    String path,
    FutureOr Function(HttpRequest req, HttpResponse res) callback, {
    List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware =
        const [],
  }) =>
      createRoute(Method.all, path, callback, middleware);

  HttpRoute createRoute(
    Method method,
    String path,
    FutureOr Function(HttpRequest req, HttpResponse res) callback, [
    List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware =
        const [],
  ]) {
    final route = HttpRoute(
        '${pathPrefix == '' ? '' : '$pathPrefix/'}$path', callback, method,
        middleware: middleware);
    app.addRoute(route);
    return route;
  }

  Router createRouteGroup(String path) {
    return RouteGroup(app, '${pathPrefix == '' ? '' : '$pathPrefix/'}$path');
  }
}

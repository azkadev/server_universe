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
import 'dart:async';

import 'package:server_universe/core/method.dart';

import '../../native.dart';

extension NestedRouteExtension on ServerUniverseNative {
  /// Creates one or multiple route segments that can be used
  /// as a common base for specifying routes with [get], [post], etc.
  ///
  /// You can define middleware that effects all sub-routes.
  NestedRoute route(String path,
          {List<FutureOr Function(HttpRequest req, HttpResponse res)>
              middleware = const []}) =>
      NestedRoute(
          server_universe: this, basePath: path, baseMiddleware: middleware);
}

class NestedRoute {
  final ServerUniverseNative _server_universe;
  final String _basePath;
  final List<FutureOr Function(HttpRequest req, HttpResponse res)>
      _baseMiddleware;

  NestedRoute(
      {required ServerUniverseNative server_universe,
      required String basePath,
      required List<FutureOr Function(HttpRequest req, HttpResponse res)>
          baseMiddleware})
      : _server_universe = server_universe,
        _basePath = basePath,
        _baseMiddleware = baseMiddleware;

  /// Create a get route
  ///
  HttpRoute get(String path,
          FutureOr Function(HttpRequest req, HttpResponse res) callback,
          {List<FutureOr Function(HttpRequest req, HttpResponse res)>
              middleware = const []}) =>
      _createRoute(path, callback, Method.get, middleware);

  /// Create a post route
  ///
  HttpRoute post(String path,
          FutureOr Function(HttpRequest req, HttpResponse res) callback,
          {List<FutureOr Function(HttpRequest req, HttpResponse res)>
              middleware = const []}) =>
      _createRoute(path, callback, Method.post, middleware);

  /// Create a put route
  HttpRoute put(String path,
          FutureOr Function(HttpRequest req, HttpResponse res) callback,
          {List<FutureOr Function(HttpRequest req, HttpResponse res)>
              middleware = const []}) =>
      _createRoute(path, callback, Method.put, middleware);

  /// Create a delete route
  ///
  HttpRoute delete(String path,
          FutureOr Function(HttpRequest req, HttpResponse res) callback,
          {List<FutureOr Function(HttpRequest req, HttpResponse res)>
              middleware = const []}) =>
      _createRoute(path, callback, Method.delete, middleware);

  /// Create a patch route
  ///
  HttpRoute patch(String path,
          FutureOr Function(HttpRequest req, HttpResponse res) callback,
          {List<FutureOr Function(HttpRequest req, HttpResponse res)>
              middleware = const []}) =>
      _createRoute(path, callback, Method.patch, middleware);

  /// Create an options route
  ///
  HttpRoute options(String path,
          FutureOr Function(HttpRequest req, HttpResponse res) callback,
          {List<FutureOr Function(HttpRequest req, HttpResponse res)>
              middleware = const []}) =>
      _createRoute(path, callback, Method.options, middleware);

  /// Create a route that listens on all methods
  ///
  HttpRoute all(String path,
          FutureOr Function(HttpRequest req, HttpResponse res) callback,
          {List<FutureOr Function(HttpRequest req, HttpResponse res)>
              middleware = const []}) =>
      _createRoute(path, callback, Method.all, middleware);

  /// Creates one or multiple route segments that can be used
  /// as a common base for specifying routes with [get], [post], etc.
  ///
  /// You can define middleware that effects all sub-routes.
  NestedRoute route(String path,
          {List<FutureOr Function(HttpRequest req, HttpResponse res)>
              middleware = const []}) =>
      NestedRoute(
          server_universe: _server_universe,
          basePath: _composePath(_basePath, path),
          baseMiddleware: [..._baseMiddleware, ...middleware]);

  HttpRoute _createRoute(
      String path,
      FutureOr Function(HttpRequest req, HttpResponse res) callback,
      Method method,
      [List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware =
          const []]) {
    final route = HttpRoute(_composePath(_basePath, path), callback, method,
        middleware: [..._baseMiddleware, ...middleware]);
    _server_universe.routes.add(route);
    return route;
  }
}

String _composePath(String first, String second) {
  if (first.endsWith('/') && second.startsWith('/')) {
    return first + second.substring(1);
  } else if (!first.endsWith('/') && !second.startsWith('/')) {
    return '$first/$second';
  }
  return first + second;
}

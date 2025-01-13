// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, empty_catches

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

import 'package:server_universe/core/core.dart';
import 'package:server_universe/edge/request/request.dart';

/// ServerUniverseUncompleteDocumentation
abstract class ServerUniverseEdgeBaseCore {
  /// ServerUniverseUncompleteDocumentation
  void createRoute({
    required String path,
    required RegExp method,
    required RequestHandler onRequest,
  }) {}
}

/// ServerUniverseUncompleteDocumentation
abstract class ServerUniverseEdgeBase extends ServerUniverseBase
    implements ServerUniverseEdgeBaseCore {
  /// ServerUniverseUncompleteDocumentation

  final RequestHandlerMore onError;

  /// ServerUniverseUncompleteDocumentation
  final RequestHandler onNotFound;

  /// ServerUniverseUncompleteDocumentation
  ServerUniverseEdgeBase({
    required this.onError,
    required this.onNotFound,
    super.serverUniverseLogType,
    super.pathPrefix,
    super.simultaneousProcessing,
    super.serverUniversePlatformType = ServerUniversePlatformType.supabase,
  });

  @override
  void ensureInitialized() {}

  /// ServerUniverseUncompleteDocumentation
  void all(String path, RequestHandler onRequest) {
    createRoute(
      path: path,
      method: RegExp(r"^(.*)$", caseSensitive: false),
      onRequest: onRequest,
    );
  }

  /// ServerUniverseUncompleteDocumentation
  void get(String path, RequestHandler onRequest) {
    createRoute(
      path: path,
      method: RegExp(r"^(get)$", caseSensitive: false),
      onRequest: onRequest,
    );
  }

  /// ServerUniverseUncompleteDocumentation
  void post(String path, RequestHandler onRequest) {
    createRoute(
      path: path,
      method: RegExp(r"^(post)$", caseSensitive: false),
      onRequest: onRequest,
    );
  }

  /// ServerUniverseUncompleteDocumentation
  void put(String path, RequestHandler onRequest) {
    createRoute(
      path: path,
      method: RegExp(r"^(put)$", caseSensitive: false),
      onRequest: onRequest,
    );
  }

  /// ServerUniverseUncompleteDocumentation
  void delete(String path, RequestHandler onRequest) {
    createRoute(
      path: path,
      method: RegExp(r"^(delete)$", caseSensitive: false),
      onRequest: onRequest,
    );
  }

  /// ServerUniverseUncompleteDocumentation
  void patch(String path, RequestHandler onRequest) {
    createRoute(
      path: path,
      method: RegExp(r"^(patch)$", caseSensitive: false),
      onRequest: onRequest,
    );
  }

  /// ServerUniverseUncompleteDocumentation
  void head(String path, RequestHandler onRequest) {
    createRoute(
      path: path,
      method: RegExp(r"^(head)$", caseSensitive: false),
      onRequest: onRequest,
    );
  }

  /// ServerUniverseUncompleteDocumentation
  void options(String path, RequestHandler onRequest) {
    createRoute(
      path: path,
      method: RegExp(r"^(options)$", caseSensitive: false),
      onRequest: onRequest,
    );
  }

  /// ServerUniverseUncompleteDocumentation
  void propfind(String path, RequestHandler onRequest) {
    createRoute(
      path: path,
      method: RegExp(r"^(propfind)$", caseSensitive: false),
      onRequest: onRequest,
    );
  }
}

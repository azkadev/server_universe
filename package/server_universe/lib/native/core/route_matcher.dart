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
import 'package:server_universe/core/method.dart';
import 'package:server_universe/native/native.dart';

/// ServerUniverseUncompleteDocumentation
class RouteMatcher {
  /// ServerUniverseUncompleteDocumentation
  static Iterable<HttpRouteMatch> match(String input, List<HttpRoute> options,
      ServerUniverseMethodType method) sync* {
    // decode URL path before matching except for "/"
    final inputPath =
        Uri.parse(input).path.normalizePath.decodeUri(DecodeMode.AllButSlash);

    for (final option in options) {
      // Check if http method matches
      if (option.method != method &&
          option.method != ServerUniverseMethodType.all) {
        continue;
      }

      // Match against route RegExp and capture params if valid
      final match = option.matcher.firstMatch(inputPath);
      if (match != null) {
        final routeMatch = HttpRouteMatch.tryParse(option, match);
        if (routeMatch != null) {
          yield routeMatch;
        }
      }
    }
  }
}

/// Retains the matched route and parameter values extracted
/// from the Uri
///
class HttpRouteMatch {
  HttpRouteMatch._(this.route, this.params);

  /// ServerUniverseUncompleteDocumentation
  static HttpRouteMatch? tryParse(HttpRoute route, RegExpMatch match) {
    try {
      final params = <String, dynamic>{};
      for (var param in route.params) {
        var value = match.namedGroup(param.name);
        if (value == null) {
          if (param.pattern != '*') {
            return null;
          }
          value = '';
        }
        params[param.name] = param.getValue(value);
      }
      return HttpRouteMatch._(route, params);
    } catch (e) {
      return null;
    }
  }

  /// ServerUniverseUncompleteDocumentation

  final HttpRoute route;

  /// ServerUniverseUncompleteDocumentation
  final Map<String, dynamic> params;
}

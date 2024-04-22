// ignore_for_file: unnecessary_brace_in_string_interps

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

import '../native.dart';

class HttpRoute {
  final Method method;
  final String route;
  final FutureOr Function(HttpRequest req, HttpResponse res) callback;
  final List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware;

  // The RegExp used to match the input URI
  late final RegExp matcher;

  // Returns `true` if route can match multiple routes due to usage of
  // wildcards (`*`)
  final bool usesWildcardMatcher;

  // The route parameters (name, type and pattern)
  final Map<String, HttpRouteParam> _params = <String, HttpRouteParam>{};

  Iterable<HttpRouteParam> get params => _params.values;

  HttpRoute(this.route, this.callback, this.method,
      {this.middleware = const []})
      : usesWildcardMatcher = route.contains('*') {
    // Split route path into segments

    /// Because in dart 2.18 uri parsing is more permissive, using a \ in regex
    /// is being counted as a /, so we need to add an r and join them together
    /// VERY happy for a more elegant solution here than some random escape
    /// sequence.
    const escapeChar = '@@@^';
    var escapedPath = route.normalizePath.replaceAll('\\', escapeChar);
    var segments =
        Uri.tryParse('/${escapedPath}')?.pathSegments ?? [route.normalizePath];
    segments = segments.map((e) => e.replaceAll(escapeChar, '\\')).toList();

    var pattern = '^';
    for (var segment in segments) {
      if (segment == '*' &&
          segment != segments.first &&
          segment == segments.last) {
        // Generously match path if last segment is wildcard (*)
        // Example: 'some/path/*' => should match 'some/path', 'some/path/', 'some/path/with/children'
        //                           but not 'some/pathological'
        pattern += r'(?:/.*|)';
        break;
      } else if (segment != segments.first) {
        // Add path separators
        pattern += '/';
      }

      // parse parameter if any
      final param = HttpRouteParam.tryParse(segment);
      if (param != null) {
        if (_params.containsKey(param.name)) {
          throw DuplicateParameterException(param.name);
        }
        _params[param.name] = param;
        // ignore: prefer_interpolation_to_compose_strings
        segment = r'(?<' + param.name + r'>' + param.pattern + ')';
      } else {
        // escape period character
        segment = segment.replaceAll('.', r'\.');
        // wildcard ('*') to anything
        segment = segment.replaceAll('*', '.*?');
      }

      pattern += segment;
    }

    pattern += r'$';
    matcher = RegExp(pattern, caseSensitive: false);
  }

  @override
  String toString() => route;
}

/// Throws when a route contains duplicate parameters
///
class DuplicateParameterException implements Exception {
  DuplicateParameterException(this.name);

  final String name;
}

/// Class used to retain parameter information (name, type, pattern)
///
class HttpRouteParam {
  HttpRouteParam(this.name, this.pattern, this.type);

  final String name;
  final String pattern;
  final HttpRouteParamType? type;

  dynamic getValue(String value) {
    // path has been decoded already except for '/'
    value = value.decodeUri(DecodeMode.SlashOnly);
    return type?.parse(value) ?? value;
  }

  static final paramTypes = <HttpRouteParamType>[];

  static HttpRouteParam? tryParse(String segment) {
    /// route param is of the form ":name" or ":name:pattern"
    /// the ":pattern" part can be a regular expression
    /// or a param type name
    if (!segment.startsWith(':')) return null;
    var pattern = '';
    var name = segment.substring(1);
    HttpRouteParamType? type;
    final idx = name.indexOf(':');
    if (idx > 0) {
      pattern = name.substring(idx + 1);
      name = name.substring(0, idx);
      final typeName = pattern.toLowerCase();
      type = paramTypes
          .cast<HttpRouteParamType?>()
          .firstWhere((t) => t!.name == typeName, orElse: () => null);
      if (type != null) {
        // the pattern matches a param type name
        pattern = type.pattern;
      }
    } else {
      // anything but a slash
      pattern = r'[^/]+?';
    }
    return HttpRouteParam(name, pattern, type);
  }
}

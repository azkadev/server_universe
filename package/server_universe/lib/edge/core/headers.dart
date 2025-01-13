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
import 'dart:js_util' show jsify;
import 'package:typings_fork/core.dart' as js_interop;

import 'package:server_universe/edge/core/interop/headers.dart' as interop;

/// ServerUniverseUncompleteDocumentation
class Headers {
  final interop.Headers _delegate;

  /// ServerUniverseUncompleteDocumentation
  Headers([Map<String, String>? headers])
      : _delegate = interop.Headers(jsify(headers ?? {}));

  Headers._(this._delegate);

  /// ServerUniverseUncompleteDocumentation
  bool has(String name) => _delegate.has(name);

  /// ServerUniverseUncompleteDocumentation
  void append(String name, String value) => _delegate.append(name, value);

  /// ServerUniverseUncompleteDocumentation
  void delete(String name) => _delegate.delete(name);

  /// ServerUniverseUncompleteDocumentation
  String? get(String name) => _delegate.get(name);

  /// ServerUniverseUncompleteDocumentation
  operator []=(String name, String value) {
    _delegate.set(name, value);
  }

  /// ServerUniverseUncompleteDocumentation
  String? operator [](String name) {
    return _delegate.get(name);
  }

  /// ServerUniverseUncompleteDocumentation
  Iterable<String> get keys => _delegate.keys;

  /// ServerUniverseUncompleteDocumentation
  Iterable<String> get values => _delegate.values;

  /// ServerUniverseUncompleteDocumentation
  Map<String, String> toMap() => _delegate.toMap();

  /// ServerUniverseUncompleteDocumentation
  js_interop.Headers toJsBindingsHeaders() => _delegate as js_interop.Headers;
}

/// ServerUniverseUncompleteDocumentation
extension HeadersExtension on Headers {
  // Returns the underlying JS object.
  /// ServerUniverseUncompleteDocumentation
  interop.Headers get delegate => _delegate;
}

// Creates a [Headers] instance from a JS object.
/// ServerUniverseUncompleteDocumentation
Headers headersFromJsObject(interop.Headers delegate) {
  return Headers._(delegate);
}

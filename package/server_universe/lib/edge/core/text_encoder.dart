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
import 'dart:typed_data' show Uint8List;

import 'package:typings_fork/core.dart' as interop;

/// ServerUniverseUncompleteDocumentation
class TextEncoder {
  final interop.TextEncoder _delegate;

  TextEncoder._(this._delegate);

  /// ServerUniverseUncompleteDocumentation

  String get encoding => _delegate.encoding;

  /// ServerUniverseUncompleteDocumentation
  Uint8List encode([String? input]) => _delegate.encode(input);

  /// ServerUniverseUncompleteDocumentation
  TextEncoderEncodeIntoResult encodeInto(String input, Uint8List destination) =>
      TextEncoderEncodeIntoResult._(
        _delegate.encodeInto(input, destination),
      );
}

/// ServerUniverseUncompleteDocumentation
extension TextEncoderExtension on TextEncoder {
  /// ServerUniverseUncompleteDocumentation
  interop.TextEncoder get delegate => _delegate;
}

/// ServerUniverseUncompleteDocumentation
TextEncoder textEncoderFromJsObject(interop.TextEncoder jsObject) =>
    TextEncoder._(jsObject);

/// ServerUniverseUncompleteDocumentation
class TextEncoderEncodeIntoResult {
  final interop.TextEncoderEncodeIntoResult _delegate;

  TextEncoderEncodeIntoResult._(this._delegate);

  /// ServerUniverseUncompleteDocumentation
  int get read => _delegate.read as int? ?? 0;

  set read(int newValue) {
    _delegate.read = newValue;
  }

  /// ServerUniverseUncompleteDocumentation
  int get written => _delegate.written as int? ?? 0;

  /// ServerUniverseUncompleteDocumentation
  set written(int newValue) {
    _delegate.written = newValue;
  }
}

/// ServerUniverseUncompleteDocumentation
extension TextEncoderEncodeIntoResultExtension on TextEncoderEncodeIntoResult {
  /// ServerUniverseUncompleteDocumentation
  interop.TextEncoderEncodeIntoResult get delegate => _delegate;
}

/// ServerUniverseUncompleteDocumentation
TextEncoder textEncoderEncodeIntoResultFromJsObject(
        interop.TextEncoder jsObject) =>
    TextEncoder._(jsObject);

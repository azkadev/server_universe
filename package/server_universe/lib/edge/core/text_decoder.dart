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
import 'package:typings_fork/core.dart' as interop;

/// ServerUniverseUncompleteDocumentation
class TextDecoder {
  final interop.TextDecoder _delegate;

  // TextDecoder._(this._delegate);

  // TODO: What happens if label is null? do we need to use undefined?
  /// ServerUniverseUncompleteDocumentation
  TextDecoder([String? label, TextDecoderOptions? options])
      : _delegate = interop.TextDecoder(label, options?._delegate);

  /// ServerUniverseUncompleteDocumentation
  String get encoding => _delegate.encoding;

  /// ServerUniverseUncompleteDocumentation
  bool get fatal => _delegate.fatal;

  /// ServerUniverseUncompleteDocumentation
  bool get ignoreBOM => _delegate.ignoreBOM;

  // TODO + TextDecodeOptions
  // String decode([Uint8List? input, TextDecodeOptions? options]) =>
  //     _delegate.decode(input, options?._delegate);
}

/// ServerUniverseUncompleteDocumentation

class TextDecodeOptions {}

/// ServerUniverseUncompleteDocumentation
class TextDecoderOptions {
  final interop.TextDecoderOptions _delegate;

  TextDecoderOptions._(this._delegate);

  /// ServerUniverseUncompleteDocumentation
  bool get fatal => _delegate.fatal ?? false;

  set fatal(bool newValue) {
    _delegate.fatal = newValue;
  }

  /// ServerUniverseUncompleteDocumentation
  bool get ignoreBOM => _delegate.ignoreBOM ?? false;

  set ignoreBOM(bool newValue) {
    _delegate.ignoreBOM = newValue;
  }
}

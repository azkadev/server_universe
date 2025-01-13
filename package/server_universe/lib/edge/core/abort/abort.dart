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

import 'package:typings_fork/core.dart' as interop;
import 'package:server_universe/edge/core/interop/utils_interop.dart';

/// ServerUniverseUncompleteDocumentation
class AbortController {
  final interop.AbortController _delegate;

  /// ServerUniverseUncompleteDocumentation
  AbortController() : _delegate = interop.AbortController();

  /// ServerUniverseUncompleteDocumentation
  AbortSignal get signal => AbortSignal._(_delegate.signal);

  /// ServerUniverseUncompleteDocumentation
  void abort([Object? reason]) =>
      _delegate.abort(reason != null ? jsify(reason) : jsUndefined);
}

/// ServerUniverseUncompleteDocumentation
class AbortSignal {
  final interop.AbortSignal _delegate;

  /// ServerUniverseUncompleteDocumentation

  AbortSignal() : _delegate = interop.AbortSignal();

  AbortSignal._(this._delegate);

  /// ServerUniverseUncompleteDocumentation
  static AbortSignal abort([Object? reason]) {
    if (reason == null) return AbortSignal._(interop.AbortSignal.abort());
    return AbortSignal._(interop.AbortSignal.abort(jsify(reason)));
  }

  /// ServerUniverseUncompleteDocumentation

  static AbortSignal timeout(int delay) {
    return AbortSignal._(interop.AbortSignal.timeout(delay));
  }

  /// ServerUniverseUncompleteDocumentation
  bool get aborted => _delegate.aborted;

  /// ServerUniverseUncompleteDocumentation
  Object get reason => _delegate.reason;

  /// ServerUniverseUncompleteDocumentation
  void throwIfAborted() => _delegate.throwIfAborted();
}

/// ServerUniverseUncompleteDocumentation
extension AbortSignalExtension on AbortSignal {
  /// ServerUniverseUncompleteDocumentation
  interop.AbortSignal get delegate => _delegate;
}

/// ServerUniverseUncompleteDocumentation
AbortSignal abortSignalToJsObject(interop.AbortSignal abortSignal) {
  return AbortSignal._(abortSignal);
}

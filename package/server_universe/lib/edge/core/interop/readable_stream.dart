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
import 'dart:js_util' as js_util;
import 'dart:typed_data';
import 'package:js/js.dart';

@JS()
@staticInterop
@anonymous

/// ServerUniverseUncompleteDocumentation
class ReadableStream {
  /// ServerUniverseUncompleteDocumentation
  external factory ReadableStream();
}

/// ServerUniverseUncompleteDocumentation
extension ReadableStreamProps on ReadableStream {
  /// ServerUniverseUncompleteDocumentation
  bool get locked => js_util.getProperty(this, 'locked');

  /// ServerUniverseUncompleteDocumentation
  ReadableStreamDefaultReader getReader() {
    final reader = js_util.callMethod<ReadableStreamDefaultReader>(
      this,
      'getReader',
      [],
    );

    return reader;
  }
}

/// ServerUniverseUncompleteDocumentation
class ReadResult {
  /// ServerUniverseUncompleteDocumentation
  final bool done;

  /// ServerUniverseUncompleteDocumentation
  final Uint8List? value;

  /// ServerUniverseUncompleteDocumentation
  ReadResult(this.done, this.value);
}

@JS()
@staticInterop
@anonymous

/// ServerUniverseUncompleteDocumentation
class ReadableStreamDefaultReader {
  /// ServerUniverseUncompleteDocumentation
  external factory ReadableStreamDefaultReader();
}

/// ServerUniverseUncompleteDocumentation
extension ReadableStreamReaderProps on ReadableStreamDefaultReader {
  /// ServerUniverseUncompleteDocumentation
  Future<ReadResult> read() async {
    final promise = js_util.callMethod(this, 'read', []);
    final future = js_util.promiseToFuture(promise);

    final result = await future;
    final done = js_util.getProperty<bool>(result, 'done');
    final value = js_util.getProperty<Uint8List?>(result, 'value');

    return ReadResult(done, value);
  }

  /// ServerUniverseUncompleteDocumentation
  bool get closed => js_util.getProperty(this, 'closed');

  /// ServerUniverseUncompleteDocumentation
  Future<void> cancel() async {
    await js_util.callMethod(this, 'cancel', []);
  }

  /// ServerUniverseUncompleteDocumentation
  Future<void> releaseLock() async {
    await js_util.callMethod(this, 'releaseLock', []);
  }
}

/// ServerUniverseUncompleteDocumentation
Stream<List<int>> streamFromJSReadable(ReadableStream jsStream) {
  final reader = jsStream.getReader();
  return streamFromJSReader(reader);
}

/// ServerUniverseUncompleteDocumentation
Stream<List<int>> streamFromJSReader(
    ReadableStreamDefaultReader reader) async* {
  while (true) {
    final result = await reader.read();

    if (result.done) {
      break;
    }

    yield result.value!;
  }
}

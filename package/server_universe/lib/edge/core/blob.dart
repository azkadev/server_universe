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
import 'dart:js_util';
import 'dart:typed_data';

import 'package:server_universe/edge/core/interop/readable_stream.dart';
import 'package:typings_fork/core.dart' as interop;

class Blob {
  final interop.Blob _delegate;

  Blob._(this._delegate);

  Blob([Iterable<dynamic>? blobParts, BlobPropertyBag? options])
      : _delegate = interop.Blob(
          blobParts?.toList() as List<Object>?,
          options?.delegate ?? interop.BlobPropertyBag(),
        );

  int get size => _delegate.size.toInt();
  String get type => _delegate.type;

  Blob slice([int? start, int? end, String? contentType]) {
    return Blob._(_delegate.slice(start, end, contentType));
  }

  Stream<List<int>> stream() {
    return streamFromJSReadable(callMethod(_delegate, 'stream', []));
  }

  Future<String> text() => _delegate.text();

  Future<ByteBuffer> arrayBuffer() => _delegate.arrayBuffer();
}

extension BlobExtension on Blob {
  interop.Blob get delegate => _delegate;
}

Blob blobFromJsObject(interop.Blob delegate) {
  return Blob._(delegate);
}

class BlobPropertyBag {
  String? type;
  interop.EndingType? endings;

  BlobPropertyBag({this.type, this.endings});
}

extension on BlobPropertyBag {
  interop.BlobPropertyBag get delegate {
    return interop.BlobPropertyBag(
      type: type,
      endings: endings,
    );
  }
}

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
import 'dart:convert';
import 'dart:js_util' show jsify, getProperty;
import 'dart:typed_data';

import 'package:typings_fork/core.dart' as interop;

import 'package:server_universe/edge/core/utils.dart';
import 'package:server_universe/edge/core/blob.dart';
import 'package:server_universe/edge/core/body.dart';
import 'package:server_universe/edge/core/form_data.dart';
import 'package:server_universe/edge/core/headers.dart';
import 'package:server_universe/edge/core/interop/readable_stream.dart';
import 'package:server_universe/edge/core/interop/utils_interop.dart';
import 'package:server_universe/edge/core/interop/headers.dart'
    as headers_interop;

/// ServerUniverseUncompleteDocumentation
class Response implements Body {
  final interop.Response _delegate;

  Response._(this._delegate);

  /// ServerUniverseUncompleteDocumentation

  Response(
    Object? body, {
    int? status,
    String? statusText,
    Headers? headers,
  }) : _delegate = interop.Response(
          convertBody(body),
          interop.ResponseInit(
            status: status ?? 200,
            statusText: statusText ?? '',
            headers: headers?.delegate ?? jsUndefined,
          ),
        );

  /// ServerUniverseUncompleteDocumentation
  factory Response.error() {
    return Response._(interop.Response.error());
  }

  /// ServerUniverseUncompleteDocumentation

  factory Response.redirect(Uri url, [int? status = 302]) {
    return Response._(
      interop.Response.redirect(url.toString(), status),
    );
  }

  factory Response.json(
    Object? data, {
    int? status,
    String? statusText,
    Headers? headers,
  }) {
    return Response._(
      interop.Response(
        data != null ? jsify(data) : null,
        interop.ResponseInit(
          status: status ?? 200,
          statusText: statusText ?? '',
          headers: headers?.delegate ?? jsUndefined,
        ),
      ),
    );
  }

  /// ServerUniverseUncompleteDocumentation
  interop.ResponseType get type => _delegate.type;

  /// ServerUniverseUncompleteDocumentation
  Uri get url => Uri.parse(_delegate.url);

  /// ServerUniverseUncompleteDocumentation
  bool get redirected => _delegate.redirected;

  /// ServerUniverseUncompleteDocumentation
  int get status => _delegate.status.toInt();

  /// ServerUniverseUncompleteDocumentation
  bool get ok => _delegate.ok;

  /// ServerUniverseUncompleteDocumentation

  String get statusText => _delegate.statusText;

  /// ServerUniverseUncompleteDocumentation
  Headers get headers {
    return headersFromJsObject(
      getProperty<headers_interop.Headers>(_delegate, 'headers'),
    );
  }

  /// ServerUniverseUncompleteDocumentation
  Response clone() => Response._(_delegate.clone());

  @override
  Future<ByteBuffer> arrayBuffer() => _delegate.arrayBuffer();

  @override
  Future<Object> blob() async => blobFromJsObject(await _delegate.blob());

  @override
  Stream<List<int>>? get body {
    final body = getProperty<ReadableStream?>(_delegate, 'body');
    return body == null ? null : streamFromJSReadable(body);
  }

  @override
  bool get bodyUsed => _delegate.bodyUsed;

  @override
  Future<FormData> formData() async =>
      formDataFromJsObject(await _delegate.formData());

  @override
  Future<Object?> json() async {
    // We don't call `_delegate.json()` directly, as it decodes the JSON
    // from JS `JSON.parse`, which does not translate all values back to Dart
    // correctly (e.g. a List is not translated to a JsArray).
    final text = await _delegate.text();
    return jsonDecode(text);
  }

  @override
  Future<String> text() => _delegate.text();
}

/// ServerUniverseUncompleteDocumentation
extension ResponseExtension on Response {
  /// ServerUniverseUncompleteDocumentation
  interop.Response get delegate => _delegate;
}

/// ServerUniverseUncompleteDocumentation
Response responseFromJsObject(interop.Response delegate) {
  return Response._(delegate);
}

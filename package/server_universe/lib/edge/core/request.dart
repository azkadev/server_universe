// ignore_for_file: non_constant_identifier_names

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

import 'package:server_universe/edge/core/abort/abort.dart';
import 'package:server_universe/edge/core/blob.dart';
import 'package:server_universe/edge/core/body.dart';
import 'package:typings_fork/core.dart' as interop;
import 'package:server_universe/edge/core/interop/readable_stream.dart';
import 'package:server_universe/edge/core/interop/utils_interop.dart'
    as interop;
import 'package:server_universe/edge/core/interop/headers.dart'
    as headers_interop;

import 'package:server_universe/edge/core/form_data.dart';
import 'package:server_universe/edge/core/headers.dart';
import 'package:server_universe/edge/core/resource.dart';

/// ServerUniverseUncompleteDocumentation
class Request implements Body {
  final interop.Request _delegate;

  /// ServerUniverseUncompleteDocumentation
  Request._(this._delegate);

  /// ServerUniverseUncompleteDocumentation
  Request(
    Resource resource, {
    String? method,
    Headers? headers,
    Object? body,
    String? referrer,
    interop.ReferrerPolicy? referrerPolicy,
    interop.RequestMode? mode,
    interop.RequestCredentials? credentials,
    interop.RequestCache? cache,
    interop.RequestRedirect? redirect,
    String? integrity,
    bool? keepalive,
    AbortSignal? signal,
  }) : _delegate = interop.Request(
          interop.requestFromResource(resource),
          interop.RequestInit(
            method: method,
            headers: headers?.delegate,
            // TODO(lesnitsky): support streams
            body: body,
            referrer: referrer,
            referrerPolicy: referrerPolicy,
            mode: mode,
            credentials: credentials,
            cache: cache,
            redirect: redirect,
            integrity: integrity,
            keepalive: keepalive,
            signal: signal?.delegate,
          ),
        );

  /// ServerUniverseUncompleteDocumentation
  String get method => _delegate.method;

  /// ServerUniverseUncompleteDocumentation
  Uri get url => Uri.parse(_delegate.url);

  /// ServerUniverseUncompleteDocumentation
  String? get base_name {
    // List<String> pathSegments = [...url.pathSegments];
    return url.pathSegments.firstOrNull;
  }

  /// ServerUniverseUncompleteDocumentation
  String get path {
    List<String> pathSegments = [...url.pathSegments];
    if (pathSegments.isNotEmpty) {
      pathSegments.removeAt(0);
    } else {
      pathSegments = ["/"];
    }
    String path_url = url.replace(pathSegments: pathSegments).path;
    if (path_url.isEmpty) {
      return "/";
    }
    return path_url;
  }

  /// ServerUniverseUncompleteDocumentation
  Headers get headers {
    return headersFromJsObject(
      getProperty<headers_interop.Headers>(_delegate, 'headers'),
    );
  }

  /// ServerUniverseUncompleteDocumentation
  interop.RequestDestination get destination => _delegate.destination;

  /// ServerUniverseUncompleteDocumentation
  String get referrer => _delegate.referrer;

  /// ServerUniverseUncompleteDocumentation
  interop.ReferrerPolicy get referrerPolicy => _delegate.referrerPolicy;

  /// ServerUniverseUncompleteDocumentation
  interop.RequestMode get mode => _delegate.mode;

  /// ServerUniverseUncompleteDocumentation
  interop.RequestCredentials get credentials => _delegate.credentials;

  /// ServerUniverseUncompleteDocumentation
  interop.RequestCache get cache => _delegate.cache;

  /// ServerUniverseUncompleteDocumentation
  interop.RequestRedirect get redirect => _delegate.redirect;

  /// ServerUniverseUncompleteDocumentation
  String get integrity => _delegate.integrity;

  /// ServerUniverseUncompleteDocumentation
  bool get keepalive => _delegate.keepalive;

  /// ServerUniverseUncompleteDocumentation
  AbortSignal get signal => abortSignalToJsObject(_delegate.signal);

  /// ServerUniverseUncompleteDocumentation
  Request clone() => Request._(_delegate.clone());

  @override
  Future<ByteBuffer> arrayBuffer() => _delegate.arrayBuffer();

  @override
  Future<Object> blob() async => blobFromJsObject(await _delegate.blob());

  ReadableStreamDefaultReader? _reader;

  @override
  Stream<List<int>>? get body {
    final body = getProperty<ReadableStream?>(_delegate, 'body');
    if (body == null) return null;

    _reader ??= body.getReader();

    return streamFromJSReader(_reader!);
  }

  @override
  bool get bodyUsed => _delegate.bodyUsed;

  @override
  Future<FormData> formData() async =>
      formDataFromJsObject(await _delegate.formData());

  @override
  Future<Object?> json() async =>
      // ignore: unnecessary_cast, Dart issue
      interop.dartify(await (_delegate as interop.Body).json());

  @override
  Future<String> text() => _delegate.text();
}

/// ServerUniverseUncompleteDocumentation
extension RequestExtension on Request {
  /// ServerUniverseUncompleteDocumentation
  interop.Request get delegate => _delegate;
}

/// ServerUniverseUncompleteDocumentation
Request requestFromJsObject(interop.Request request) => Request._(request);

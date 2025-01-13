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
import 'dart:js' as js;
import 'dart:js_util';

import 'package:typings_fork/core.dart' as interop hide AbortSignal;

import 'package:server_universe/edge/core/abort/abort.dart';
import 'package:server_universe/edge/core/headers.dart';
import 'package:server_universe/edge/core/interop/utils_interop.dart'
    as interop;
import 'package:server_universe/edge/core/resource.dart';
import 'package:server_universe/edge/core/response.dart';

/// ServerUniverseUncompleteDocumentation
Future<Response> fetch(Resource resource,
    {String? method,
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
    AbortSignal? signal}) async {
  var response = await interop.fetch(
    interop.requestFromResource(resource),
    interop.RequestInit(
        method: method,
        headers: headers?.delegate,
        body: body,
        referrer: referrer,
        referrerPolicy: referrerPolicy,
        mode: mode,
        credentials: credentials,
        cache: cache,
        redirect: redirect,
        integrity: integrity,
        keepalive: keepalive,
        signal: signal?.delegate),
  );
  try {
    return responseFromJsObject(
      await promiseToFuture(response),
    );
  } catch (e) {
    return responseFromJsObject(response);
  }
}

/// ServerUniverseUncompleteDocumentation
int setInterval(void Function() callback, Duration duration) => interop
    .setInterval(js.allowInterop(callback), duration.inMilliseconds)
    .toInt();

/// ServerUniverseUncompleteDocumentation
void clearInterval(int handle) => interop.clearInterval(handle);

/// ServerUniverseUncompleteDocumentation
int setTimeout(void Function() callback, Duration duration) => interop
    .setTimeout(js.allowInterop(callback), duration.inMilliseconds)
    .toInt();

/// ServerUniverseUncompleteDocumentation
void clearTimeout(int handle) => interop.clearTimeout(handle);

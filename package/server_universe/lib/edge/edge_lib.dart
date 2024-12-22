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
import 'dart:js';

export 'dart:async' show FutureOr;

export 'package:typings_fork/core.dart' show ReferrerPolicy, ResponseType, RequestCache, RequestCredentials, RequestDestination, RequestMode, RequestRedirect, atob, btoa;

export 'package:server_universe/edge/core/abort/abort.dart' show AbortController, AbortSignal;
export 'package:server_universe/edge/core/blob.dart' show Blob, BlobPropertyBag;
export 'package:server_universe/edge/core/cache/cache.dart' show Cache;
export 'package:server_universe/edge/core/cache/cache_query_options.dart' show CacheQueryOptions, MultiCacheQueryOptions;
export 'package:server_universe/edge/core/cache/cache_storage.dart' show CacheStorage, caches;
export 'package:server_universe/edge/core/file.dart' show File;
export 'package:server_universe/edge/core/form_data.dart' show FormData, FormDataEntryValue;
export 'package:server_universe/edge/core/headers.dart' show Headers;
export 'package:server_universe/edge/core/io_http_client.dart';
export 'package:server_universe/edge/core/request.dart' show Request;
export 'package:server_universe/edge/core/resource.dart' show Resource;
export 'package:server_universe/edge/core/response.dart' show Response;
export 'package:server_universe/edge/core/text_decoder.dart' show TextDecoder, TextDecodeOptions, TextDecoderOptions;
export 'package:server_universe/edge/core/text_encoder.dart' show TextEncoder, TextEncoderEncodeIntoResult;
export 'package:server_universe/edge/core/top.dart';

class ServerUniverseEdgeLib {
  /// This should be called before any other platform code is run.
  static void ensureInitialized() {
    // Dart to JS looks for some context properties to determine whether some
    // features are available. Uri.base checks whether window.location.href is
    // available, so we patch it in here.
    if (context['self']['location'] == null) {
      context['self']['location'] = JsObject.jsify({
        'href': '',
      });
    }

    // Dart to JS assumes we're in a browser context, so we need to patch in.
    context['window'] ??= context['self'];
    // HttpOverrides.global = FetchHttpOverride();
  }
}

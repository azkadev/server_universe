// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, empty_catches

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
 
import 'package:server_universe/core/log_level.dart';
import 'package:server_universe/core/platform_type.dart';
import 'package:server_universe/edge/core/request.dart';
import 'package:server_universe/edge/core/response.dart';
import 'package:server_universe/edge/function/function.dart';
import 'package:server_universe/edge/edge_lib.dart';
import 'package:server_universe/edge/response/response.dart';
import 'package:server_universe/edge/request/request.dart'; 
import 'package:server_universe/edge/supabase/supabase.dart'; 

import 'package:js/js.dart';
import 'package:server_universe/edge/core/interop/promise_interop.dart'; 

import 'package:typings/core.dart' as interop;
 
class ServerUniverseEdge extends ServerUniverseEdgeBase { 
  final List<ServerUniverseFunction> functions = [];


  ServerUniverseEdge({
    required super.onError,
    required super.onNotFound,
    super.serverUniverseLogType,
    super.pathPrefix,
    super.simultaneousProcessing, 
    super.serverUniversePlatformType = ServerUniversePlatformType.supabase,
  });
  @override
  void ensureInitialized() {
    ServerUniverseEdgeLib.ensureInitialized();
    if (serverUniversePlatformType == ServerUniversePlatformType.supabase) {
      server_universeDartSupabaseFetchHandler = allowInterop((interop.Request request) {
        return futureToPromise(Future(() async {
          Request requestDart = requestFromJsObject(request);
          if (serverUniverseLogType == ServerUniverseLogType.info || serverUniverseLogType == ServerUniverseLogType.all) {
            print("[REQUEST]: ${DateTime.now().toString()} ${requestDart.path}");
          }
          try {
            ServerUniverseFunction? server_universeDartFunction = await getServerUniverseFunctionApiByRequest(request: requestDart);
            if (server_universeDartFunction != null) {
              Response response = await server_universeDartFunction.onRequest(requestDart, ServerUniverseFunctionResponse());
              return response.delegate;
            }
            Response response = await onNotFound(requestDart, ServerUniverseFunctionResponse());
            return response.delegate;
          } catch (e, stack) {
            if (serverUniverseLogType == ServerUniverseLogType.error || serverUniverseLogType == ServerUniverseLogType.all) {
              print("""
---
---
[ERROR]: ${DateTime.now().toString()}
${e}
${stack}
---
---
"""
                  .trim());
            }
            try {
              Response response = await onError(requestDart, ServerUniverseFunctionResponse(), e, stack);
              return response.delegate;
            } catch (e) {
              return ServerUniverseFunctionResponse().status(500).send("crash").delegate;
            }
          }
        }));
      });
    }
  }

  FutureOr<ServerUniverseFunction?> getServerUniverseFunctionApiByRequest({
    required Request request,
  }) async {
    for (ServerUniverseFunction server_universeDartFunction in functions) {
      if (RegExp(server_universeDartFunction.path, caseSensitive: false).hasMatch(request.path)) {
        if (server_universeDartFunction.method.hasMatch(request.method)) {
          return server_universeDartFunction;
        }
      }
    }
    return null;
  } 

  @override 
  ServerUniverseEdge get app => this;

  @override
  void createRoute({
    required String path,
    required RegExp method,
    required RequestHandler onRequest,
  }) {
    final ServerUniverseFunction server_universeDartFunction = ServerUniverseFunction(
      path: parsePattern(path),
      method: method,
      onRequest: onRequest,
    );
    functions.add(server_universeDartFunction);
  }

}

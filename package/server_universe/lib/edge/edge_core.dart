// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, empty_catches

/* <!-- START LICENSE -->


Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION 
Social Media: 

- Youtube: https://youtube.com/@Global_Corporation 
- Github: https://github.com/globalcorporation
- TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

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

import 'package:server_universe/core/core.dart';
import 'package:server_universe/edge/core/request.dart';
import 'package:server_universe/edge/core/response.dart';
import 'package:server_universe/edge/edge_function.dart';
import 'package:server_universe/edge/edge_response.dart';
import 'package:server_universe/edge/request_handler.dart';
import 'package:server_universe/edge/supabase/supabase.dart';
import 'package:server_universe/edge/edge_lib.dart';

import 'package:js/js.dart';
import 'package:server_universe/edge/core/interop/promise_interop.dart';
export 'package:server_universe/edge/edge.dart';

import 'package:typings/core.dart' as interop;

class ServerUniverseEdge extends ServerUniverse {
  final RequestHandlerMore onError;
  final RequestHandler onNotFound;
  List<ServerUniverseFunction> server_universeDartFunctions = [];
  ServerUniverseLogLevelType server_universeDartLogLevelType;
  ServerUniversePlatformType server_universeDartPlatformType;
  ServerUniverseEdge({
    required this.onError,
    required this.onNotFound,
    super.logLevel,
    super.pathPrefix,
    super.simultaneousProcessing,
    this.server_universeDartLogLevelType = ServerUniverseLogLevelType.all,
    this.server_universeDartPlatformType = ServerUniversePlatformType.supabase,
  });
  @override
  void ensureInitialized() {
    ServerUniverseLib.ensureInitialized();
    if (server_universeDartPlatformType ==
        ServerUniversePlatformType.supabase) {
      server_universeDartSupabaseFetchHandler =
          allowInterop((interop.Request request) {
        return futureToPromise(Future(() async {
          Request requestDart = requestFromJsObject(request);
          if (server_universeDartLogLevelType ==
                  ServerUniverseLogLevelType.info ||
              server_universeDartLogLevelType ==
                  ServerUniverseLogLevelType.all) {
            print(
                "[REQUEST]: ${DateTime.now().toString()} ${requestDart.path}");
          }
          try {
            ServerUniverseFunction? server_universeDartFunction =
                await getServerUniverseFunctionApiByRequest(
                    request: requestDart);
            if (server_universeDartFunction != null) {
              Response response = await server_universeDartFunction.onRequest(
                  requestDart, ServerUniverseFunctionResponse());
              return response.delegate;
            }
            Response response =
                await onNotFound(requestDart, ServerUniverseFunctionResponse());
            return response.delegate;
          } catch (e, stack) {
            if (server_universeDartLogLevelType ==
                    ServerUniverseLogLevelType.error ||
                server_universeDartLogLevelType ==
                    ServerUniverseLogLevelType.all) {
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
              Response response = await onError(
                  requestDart, ServerUniverseFunctionResponse(), e, stack);
              return response.delegate;
            } catch (e) {
              return ServerUniverseFunctionResponse()
                  .status(500)
                  .send("crash")
                  .delegate;
            }
          }
        }));
      });
    }
  }

  FutureOr<ServerUniverseFunction?> getServerUniverseFunctionApiByRequest({
    required Request request,
  }) async {
    for (ServerUniverseFunction server_universeDartFunction
        in server_universeDartFunctions) {
      if (RegExp(server_universeDartFunction.path, caseSensitive: false)
          .hasMatch(request.path)) {
        if (server_universeDartFunction.method.hasMatch(request.method)) {
          return server_universeDartFunction;
        }
      }
    }
    return null;
  }

  @override
  String parsePattern(String path) {
    String get_pattern = "";
    if (path == "/") {
      get_pattern = "^${path}\$";
    } else {
      if (!RegExp(r"^(/)").hasMatch(path)) {
        get_pattern = "^/${path}";
      } else {
        get_pattern = path;
      }
    }
    return get_pattern;
  }

  void createRoute({
    required String path,
    required RegExp method,
    required RequestHandler onRequest,
  }) {
    ServerUniverseFunction server_universeDartFunction = ServerUniverseFunction(
      path: parsePattern(path),
      method: method,
      onRequest: onRequest,
    );
    server_universeDartFunctions.add(server_universeDartFunction);
  }

  void all(String path, RequestHandler onRequest) {
    createRoute(
      path: path,
      method: RegExp(r"^(.*)$", caseSensitive: false),
      onRequest: onRequest,
    );
  }

  void get(String path, RequestHandler onRequest) {
    createRoute(
      path: path,
      method: RegExp(r"^(get)$", caseSensitive: false),
      onRequest: onRequest,
    );
  }

  void post(String path, RequestHandler onRequest) {
    createRoute(
      path: path,
      method: RegExp(r"^(post)$", caseSensitive: false),
      onRequest: onRequest,
    );
  }

  void put(String path, RequestHandler onRequest) {
    createRoute(
      path: path,
      method: RegExp(r"^(put)$", caseSensitive: false),
      onRequest: onRequest,
    );
  }

  void delete(String path, RequestHandler onRequest) {
    createRoute(
      path: path,
      method: RegExp(r"^(delete)$", caseSensitive: false),
      onRequest: onRequest,
    );
  }

  void patch(String path, RequestHandler onRequest) {
    createRoute(
      path: path,
      method: RegExp(r"^(patch)$", caseSensitive: false),
      onRequest: onRequest,
    );
  }

  void head(String path, RequestHandler onRequest) {
    createRoute(
      path: path,
      method: RegExp(r"^(head)$", caseSensitive: false),
      onRequest: onRequest,
    );
  }

  void options(String path, RequestHandler onRequest) {
    createRoute(
      path: path,
      method: RegExp(r"^(options)$", caseSensitive: false),
      onRequest: onRequest,
    );
  }

  void propfind(String path, RequestHandler onRequest) {
    createRoute(
      path: path,
      method: RegExp(r"^(propfind)$", caseSensitive: false),
      onRequest: onRequest,
    );
  }
}

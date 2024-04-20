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

import 'package:server_universe_dart/edge/core/request.dart';
import 'package:server_universe_dart/edge/core/response.dart';
import 'package:server_universe_dart/edge/edge_function.dart';
import 'package:server_universe_dart/edge/edge_response.dart';
import 'package:server_universe_dart/edge/request_handler.dart';
import 'package:server_universe_dart/edge/supabase/supabase.dart';
import 'package:server_universe_dart/edge/edge_lib.dart';

import 'package:js/js.dart';
import 'package:server_universe_dart/edge/core/interop/promise_interop.dart';
export 'package:server_universe_dart/edge/edge.dart';

import 'package:typings/core.dart' as interop;

class ServerUniverseEdge {
  final RequestHandlerMore onError;
  final RequestHandler onNotFound;
  List<ServerUniverseDartFunction> server_universeDartFunctions = [];
  ServerUniverseDartLogLevelType server_universeDartLogLevelType;
  ServerUniverseDartPlatformType server_universeDartPlatformType;
  ServerUniverseEdge({
    required this.onError,
    required this.onNotFound,
    this.server_universeDartLogLevelType = ServerUniverseDartLogLevelType.all,
    this.server_universeDartPlatformType = ServerUniverseDartPlatformType.supabase,
  });
  void ensureInitialized() {
    ServerUniverseDartLib.ensureInitialized();
    if (server_universeDartPlatformType == ServerUniverseDartPlatformType.supabase) {
      server_universeDartSupabaseFetchHandler = allowInterop((interop.Request request) {
        return futureToPromise(Future(() async {
          Request requestDart = requestFromJsObject(request);
          if (server_universeDartLogLevelType == ServerUniverseDartLogLevelType.info || server_universeDartLogLevelType == ServerUniverseDartLogLevelType.all) {
            print("[REQUEST]: ${DateTime.now().toString()} ${requestDart.path}");
          }
          try {
            ServerUniverseDartFunction? server_universeDartFunction = await getServerUniverseDartFunctionApiByRequest(request: requestDart);
            if (server_universeDartFunction != null) {
              Response response = await server_universeDartFunction.onRequest(requestDart, ServerUniverseDartFunctionResponse());
              return response.delegate;
            }
            Response response = await onNotFound(requestDart, ServerUniverseDartFunctionResponse());
            return response.delegate;
          } catch (e, stack) {
            if (server_universeDartLogLevelType == ServerUniverseDartLogLevelType.error || server_universeDartLogLevelType == ServerUniverseDartLogLevelType.all) {
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
              Response response = await onError(requestDart, ServerUniverseDartFunctionResponse(), e, stack);
              return response.delegate;
            } catch (e) {
              return ServerUniverseDartFunctionResponse().status(500).send("crash").delegate;
            }
          }
        }));
      });
    }
  }

  FutureOr<ServerUniverseDartFunction?> getServerUniverseDartFunctionApiByRequest({
    required Request request,
  }) async {
    for (ServerUniverseDartFunction server_universeDartFunction in server_universeDartFunctions) {
      if (RegExp(server_universeDartFunction.path, caseSensitive: false).hasMatch(request.path)) {
        if (server_universeDartFunction.method.hasMatch(request.method)) {
          return server_universeDartFunction;
        }
      }
    }
    return null;
  }

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
    ServerUniverseDartFunction server_universeDartFunction = ServerUniverseDartFunction(
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

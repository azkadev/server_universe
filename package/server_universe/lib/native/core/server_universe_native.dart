// ignore_for_file: unnecessary_brace_in_string_interps, no_leading_underscores_for_local_identifiers, overridden_fields

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
import 'dart:async';
import 'dart:io';

import 'package:queue/queue.dart';
import 'package:server_universe/core/core.dart';
import 'package:server_universe/native/core/extensions/request_helpers.dart';
import 'package:server_universe/native/core/http_route.dart';
import 'package:server_universe/native/core/plugins/store_plugin.dart';
import 'package:server_universe/native/core/server_universe_native_exception.dart';
import 'package:server_universe/native/core/type_handlers/type_handler.dart';
// import 'package:server_universe/native.dart';

import 'route_matcher.dart';
import 'route_param_types/alpha_param_type.dart';
import 'route_param_types/date_param_type.dart';
import 'route_param_types/double_param_type.dart';
import 'route_param_types/hex_param_type.dart';
import 'route_param_types/int_param_type.dart';
import 'route_param_types/timestamp_param_type.dart';
import 'route_param_types/uint_param_type.dart';
import 'route_param_types/uuid_param_type.dart';
import 'type_handlers/binary_type_handlers.dart';
import 'type_handlers/directory_type_handler.dart';
import 'type_handlers/file_type_handler.dart';
import 'type_handlers/json_type_handlers.dart';
import 'type_handlers/serializable_type_handler.dart';
import 'type_handlers/string_type_handler.dart';
import 'type_handlers/websocket_type_handler.dart';

/// Server application class
///
/// This is the core of the server application. Generally you would create one
/// for each app.
class ServerUniverseNative extends ServerUniverseBase {
  /// List of routes
  ///
  /// Generally you don't want to manipulate this array directly, instead add
  /// routes by calling the [get,post,put,delete] methods.
  final routes = <HttpRoute>[];

  /// HttpServer instance from the dart:io library
  ///
  /// If there is anything the app can't do, you can do it through here.
  HttpServer? server;

  /// Writer to handle internal logging.
  ///
  /// It can optionally exchanged with your own logging solution.
  late void Function(dynamic Function() messageFn, ServerUniverseLogType type)
      logWriter;

  // @override
  @override
  ServerUniverseNative get app => this;

  /// Optional handler for when a route is not found
  ///
  FutureOr Function(HttpRequest req, HttpResponse res)? onNotFound;

  /// Optional handler for when the server throws an unhandled error
  ///
  FutureOr Function(
    HttpRequest req,
    HttpResponse res,
    Object error,
    StackTrace stackTrace,
  )? onError;

  /// Incoming request queue
  ///
  /// Set the number of simultaneous connections being processed at any one time
  /// in the [simultaneousProcessing] param in the constructor
  Queue requestQueue;

  /// An array of [TypeHandler] that ServerUniverseNative walks through in order to determine
  /// if it can handle a value returned from a route.
  ///
  var typeHandlers = <TypeHandler>[];

  final _onDoneListeners = <void Function(HttpRequest req, HttpResponse res)>[];

  /// Register a listener when a request is complete
  ///
  /// Typically would be used for logging, benchmarking or cleaning up data
  /// used when writing a plugin.
  ///
  Function registerOnDoneListener(
      void Function(HttpRequest, HttpResponse) listener) {
    _onDoneListeners.add(listener);
    return listener;
  }

  /// Dispose of any on done listeners when you are done with them.
  ///
  void removeOnDoneListener(Function listener) {
    _onDoneListeners.remove(listener);
  }

  /// Creates a new ServerUniverseNative application.
  ///
  /// The default [logWriter] can be tuned by changing the [logLevel]:
  /// - [ServerUniverseLogType.error]: prints errors
  /// - [ServerUniverseLogType.warn]: prints errors and warning
  /// - [ServerUniverseLogType.info]: prints errors, warning and requests
  /// - [ServerUniverseLogType.debug]: prints errors, warning, requests and further details
  ///
  /// *Note: Changing the [logLevel] only effects the default [logWriter].*
  ///
  /// [simultaneousProcessing] is the number of requests doing work at any one
  /// time. If the amount of unprocessed incoming requests exceed this number,
  /// the requests will be queued.
  ServerUniverseNative({
    super.pathPrefix,
    super.serverUniverseLogType,
    super.serverUniversePlatformType = ServerUniversePlatformType.io,
    super.simultaneousProcessing,
    this.onNotFound,
    this.onError,
  }) : requestQueue = Queue(parallel: simultaneousProcessing) {
    onError = null;
    _registerDefaultParamTypes();
    _registerDefaultTypeHandlers();
    _registerPluginListeners();
    _registerDefaultLogWriter(serverUniverseLogType);
  }

  void _registerDefaultLogWriter(ServerUniverseLogType logLevel) {
    logWriter = (dynamic Function() messageFn, type) {
      if (logLevel == ServerUniverseLogType.none) {
      } else {
        if (type.index >= logLevel.index) {
          var timestamp = DateTime.now();
          var logType = type.name;
          var message = messageFn().toString();
          print('${timestamp} - ${logType} - ${message}');
        }
      }
    };
  }

  void _registerDefaultTypeHandlers() {
    typeHandlers.addAll([
      stringTypeHandler,
      uint8listTypeHandler,
      listIntTypeHandler,
      binaryStreamTypeHandler,
      jsonListTypeHandler,
      jsonMapTypeHandler,
      jsonNumberTypeHandler,
      jsonBooleanTypeHandler,
      fileTypeHandler,
      directoryTypeHandler,
      websocketTypeHandler,
      serializableTypeHandler
    ]);
  }

  void _registerDefaultParamTypes() {
    HttpRouteParam.paramTypes.addAll([
      IntParamType(),
      UintParamType(),
      DoubleParamType(),
      DateParamType(),
      TimestampParamType(),
      HexParamType(),
      AlphaParamType(),
      UuidParamType()
    ]);
  }

  void _registerPluginListeners() {
    registerOnDoneListener(storePluginOnDoneHandler);
  }

  /// ServerUniverseUncompleteDocumentation

  void addRoute(HttpRoute route) {
    routes.add(route);
  }

  /// Call this function to fire off the server.
  ///
  ///
  ///
  @override
  Future<HttpServer> listen({
    int port = 3000,
    dynamic bindIp = '0.0.0.0',
    bool shared = true,
    int backlog = 0,
  }) async {
    final server = await HttpServer.bind(
      bindIp,
      port,
      backlog: backlog,
      shared: shared,
    );

    server.idleTimeout = Duration(seconds: 1);

    server.listen((HttpRequest request) {
      requestQueue.add(() async {
        final result = await runZonedGuarded(
          () async {
            return _incomingRequest(request);
          },
          (error, stack) {
            logWriter(
                () => 'Unhandled Error: $error', ServerUniverseLogType.error);
            logWriter(() => '${stack}', ServerUniverseLogType.error);
          },
        );
        return result;
      });
    });

    logWriter(() => 'HTTP Server listening on port ${server.port}',
        ServerUniverseLogType.info);
    return this.server = server;
  }

  /// ServerUniverseUncompleteDocumentation
  Future<HttpServer> listenSecure({
    required SecurityContext securityContext,
    int port = 3000,
    dynamic bindIp = '0.0.0.0',
    bool shared = true,
    int backlog = 0,
  }) async {
    final server = await HttpServer.bindSecure(
      bindIp,
      port,
      securityContext,
      backlog: backlog,
      shared: shared,
    );

    server.idleTimeout = Duration(seconds: 1);

    server.listen((HttpRequest request) {
      requestQueue.add(() => _incomingRequest(request));
    });

    logWriter(() => 'HTTP Server listening on port ${server.port}',
        ServerUniverseLogType.info);
    return this.server = server;
  }

  /// Handles and routes an incoming request
  ///
  Future<void> _incomingRequest(HttpRequest request) async {
    /// Expose this ServerUniverseNative instance for middleware or other utility functions
    request.store.set('_internal_server_universe', this);

    /// Variable to track the close of the response
    var isDone = false;

    logWriter(() => '${request.method} - ${request.uri.toString()}',
        ServerUniverseLogType.info);

    // We track if the response has been resolved in order to exit out early
    // the list of routes (ie the middleware returned)
    _unawaited(request.response.done.then((dynamic _) {
      isDone = true;
      for (var listener in _onDoneListeners) {
        listener(request, request.response);
      }
      logWriter(() => 'Response sent to client', ServerUniverseLogType.debug);
    }));

    /// Parse request to ServerUniverseMethodType enum value.
    ServerUniverseMethodType _parseMethod(HttpRequest request) {
      try {
        return ServerUniverseMethodType.values
            .byName(request.method.toLowerCase());
      } on ArgumentError {
        return ServerUniverseMethodType.get;
      }
    }

    // Work out all the routes we need to process
    final effectiveMatches = RouteMatcher.match(
        request.uri.toString(), routes, _parseMethod(request));

    try {
      // If there are no effective routes, that means we need to throw a 404
      // or see if there are any static routes to fall back to, otherwise
      // continue and process the routes
      if (effectiveMatches.isEmpty) {
        logWriter(
            () => 'No matching route found.', ServerUniverseLogType.debug);
        await _respondNotFound(request, isDone);
      } else {
        /// Tracks if one route is using a wildcard
        var nonWildcardRouteMatch = false;

        // Loop through the routes in the order they are in the routes list
        for (var match in effectiveMatches) {
          if (isDone) {
            break;
          }
          logWriter(() => 'Match route: ${match.route.route}',
              ServerUniverseLogType.debug);
          request.store.set('_internal_match', match);
          nonWildcardRouteMatch =
              !match.route.usesWildcardMatcher || nonWildcardRouteMatch;

          /// Loop through any middleware
          for (var middleware in match.route.middleware) {
            // If the request has already completed, exit early.
            if (isDone) {
              break;
            }
            logWriter(() => 'Apply middleware associated with route',
                ServerUniverseLogType.debug);
            await _handleResponse(
                await middleware(request, request.response), request);
          }

          /// If the request has already completed, exit early, otherwise process
          /// the primary route callback
          if (isDone) {
            break;
          }
          logWriter(() => 'Execute route callback function',
              ServerUniverseLogType.debug);

          /// Nested try catch because if you set the header twice it wasn't
          /// catching an error. This fixes it and its in tests, so if you can
          /// remove it and all the tests pass, cool beans.
          // try {
          await _handleResponse(
              await match.route.callback(request, request.response), request);
          // } catch (e, s) {
          //   logWriter(() => match.route.toString(), ServerUniverseLogType.error);
          //   logWriter(() => e, ServerUniverseLogType.error);
          //   logWriter(() => s, ServerUniverseLogType.error);
          //
          // }
        }

        /// If you got here and isDone is still false, you forgot to close
        /// the response, or you didn't return anything. Either way its an error,
        /// but instead of letting the whole server hang as most frameworks do,
        /// lets at least close the connection out
        ///
        if (!isDone) {
          if (request.response.contentLength == -1) {
            if (nonWildcardRouteMatch == false) {
              await _respondNotFound(request, isDone);
            }
          }
          await request.response.close();
        }
      }
    } on ServerUniverseException catch (e) {
      // The user threw a handle HTTP Exception
      try {
        request.response.statusCode = e.statusCode;
        await _handleResponse(e.response, request);
      } on StateError catch (e, s) {
        // It can hit this block if you try to write a header when one is already been raised
        logWriter(() => e, ServerUniverseLogType.error);
        logWriter(() => s, ServerUniverseLogType.error);
      } catch (e, s) {
        // Catch all other errors, this block may be able to be removed in the future
        logWriter(() => e, ServerUniverseLogType.error);
        logWriter(() => s, ServerUniverseLogType.error);
      }
    } on NotFoundError catch (_) {
      await _respondNotFound(request, isDone);
    } catch (e, s) {
      // Its all broken, bail (but don't crash)
      logWriter(() => e, ServerUniverseLogType.error);
      logWriter(() => s, ServerUniverseLogType.error);
      if (onError != null) {
        // Handle the error with a custom response
        request.store.set('_internal_exception', e);
        final dynamic result = await onError!(request, request.response, e, s);
        if (result != null && !isDone) {
          await _handleResponse(result, request);
        }
        await request.response.close();
      } else {
        //Otherwise fall back to a generic 500 error
        try {
          request.response.statusCode = 500;
          request.response.write(e);
          await request.response.close();
        } catch (e, s) {
          logWriter(() => e, ServerUniverseLogType.error);
          logWriter(() => s, ServerUniverseLogType.error);
          await request.response.close();
        }
      }
    }
  }

  /// Responds request with a NotFound response
  ///
  Future _respondNotFound(HttpRequest request, bool isDone) async {
    if (onNotFound != null) {
      // Otherwise check if a custom 404 handler has been provided
      final dynamic result = await onNotFound!(request, request.response);
      if (result != null && !isDone) {
        await _handleResponse(result, request);
      }
      await request.response.close();
    } else {
      // request.response;
      // Otherwise throw a generic 404;
      request.response.statusCode = 404;
      request.response.write('404 not found');
      await request.response.close();
    }
  }

  /// Handle a response by response type
  ///
  /// This is the logic that will handle the response based on what you return.
  ///
  Future<void> _handleResponse(dynamic result, HttpRequest request) async {
    if (result != null) {
      var handled = false;
      for (var handler in typeHandlers) {
        if (handler.shouldHandle(result)) {
          logWriter(
              () => 'Apply TypeHandler for result type: ${result.runtimeType}',
              ServerUniverseLogType.debug);
          dynamic handlerResult =
              await handler.handler(request, request.response, result);
          // print(handlerResult == false);
          // set false to old
          if (handlerResult != null) {
            handled = true;
            break;
          }
        }
      }
      if (!handled) {
        throw NoTypeHandlerError(result, request);
      }
    }
  }

  /// Close the server and clean up any resources
  ///
  /// Call this if you are shutting down the server but continuing to run
  /// the app.
  Future<void> close({bool force = true}) async {
    if (server != null) {
      await server!.close(force: force);
    }
  }

  /// Print out the registered routes to the console
  ///
  /// Helpful to see whats available
  void printRoutes() {
    for (var route in routes) {
      late String methodString;
      switch (route.method) {
        case ServerUniverseMethodType.get:
          methodString = '\x1B[33mGET\x1B[0m';
          break;
        case ServerUniverseMethodType.post:
          methodString = '\x1B[31mPOST\x1B[0m';
          break;
        case ServerUniverseMethodType.put:
          methodString = '\x1B[32mPUT\x1B[0m';
          break;
        case ServerUniverseMethodType.delete:
          methodString = '\x1B[34mDELETE\x1B[0m';
          break;
        case ServerUniverseMethodType.patch:
          methodString = '\x1B[35mPATCH\x1B[0m';
          break;
        case ServerUniverseMethodType.options:
          methodString = '\x1B[36mOPTIONS\x1B[0m';
          break;
        case ServerUniverseMethodType.all:
          methodString = '\x1B[37mALL\x1B[0m';
          break;
        case ServerUniverseMethodType.head:
          methodString = '\x1B[38mHEAD\x1B[0m';
          break;
        case ServerUniverseMethodType.copy:
          methodString = '\x1B[39mCOPY\x1B[0m';
          break;
        case ServerUniverseMethodType.link:
          methodString = '\x1B[40mLINK\x1B[0m';
          break;
        case ServerUniverseMethodType.unlink:
          methodString = '\x1B[41mUNLINK\x1B[0m';
          break;
        case ServerUniverseMethodType.purge:
          methodString = '\x1B[42mPURGE\x1B[0m';
          break;
        case ServerUniverseMethodType.lock:
          methodString = '\x1B[43mUNLOCK\x1B[0m';
          break;
        case ServerUniverseMethodType.unlock:
          methodString = '\x1B[44mUNLOCK\x1B[0m';
          break;
        case ServerUniverseMethodType.propfind:
          methodString = '\x1B[45mPROPFIND\x1B[0m';
          break;
        case ServerUniverseMethodType.view:
          methodString = '\x1B[46mVIEW\x1B[0m';
          break;
      }
      print('${route.route} - $methodString');
    }
  }

  /// Create a get route
  ///
  HttpRoute get(
    String path,
    FutureOr Function(HttpRequest req, HttpResponse res) callback, {
    List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware =
        const [],
  }) {
    return createRoute(
        ServerUniverseMethodType.get, path, callback, middleware);
  }

  /// Create a head route
  ///
  HttpRoute head(
    String path,
    FutureOr Function(HttpRequest req, HttpResponse res) callback, {
    List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware =
        const [],
  }) {
    return createRoute(
        ServerUniverseMethodType.head, path, callback, middleware);
  }

  /// Create a post route
  ///
  HttpRoute post(
    String path,
    FutureOr Function(HttpRequest req, HttpResponse res) callback, {
    List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware =
        const [],
  }) {
    return createRoute(
        ServerUniverseMethodType.post, path, callback, middleware);
  }

  /// Create a put route
  HttpRoute put(
    String path,
    FutureOr Function(HttpRequest req, HttpResponse res) callback, {
    List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware =
        const [],
  }) {
    return createRoute(
        ServerUniverseMethodType.put, path, callback, middleware);
  }

  /// Create a delete route
  ///
  HttpRoute delete(
    String path,
    FutureOr Function(HttpRequest req, HttpResponse res) callback, {
    List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware =
        const [],
  }) {
    return createRoute(
        ServerUniverseMethodType.delete, path, callback, middleware);
  }

  /// Create a patch route
  ///
  HttpRoute patch(
    String path,
    FutureOr Function(HttpRequest req, HttpResponse res) callback, {
    List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware =
        const [],
  }) {
    return createRoute(
        ServerUniverseMethodType.patch, path, callback, middleware);
  }

  /// Create an options route
  ///
  HttpRoute options(
    String path,
    FutureOr Function(HttpRequest req, HttpResponse res) callback, {
    List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware =
        const [],
  }) {
    return createRoute(
        ServerUniverseMethodType.options, path, callback, middleware);
  }

  /// Create a route that listens on all methods
  ///
  HttpRoute all(
    String path,
    FutureOr Function(HttpRequest req, HttpResponse res) callback, {
    List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware =
        const [],
  }) {
    return createRoute(
        ServerUniverseMethodType.all, path, callback, middleware);
  }

  /// ServerUniverseUncompleteDocumentation

  HttpRoute createRoute(
    ServerUniverseMethodType method,
    String path,
    FutureOr Function(HttpRequest req, HttpResponse res) callback, [
    List<FutureOr Function(HttpRequest req, HttpResponse res)> middleware =
        const [],
  ]) {
    final route = HttpRoute(
        '${pathPrefix == '' ? '' : '${pathPrefix}/'}$path', callback, method,
        middleware: middleware);
    addRoute(route);
    return route;
  }

  /// ServerUniverseUncompleteDocumentation
  HttpRoute websocket({
    required String path,
    required FutureOr<ServerUniverseWebSocketConnection> Function() onWebSocket,
  }) {
    return get(
      path,
      (HttpRequest req, HttpResponse res) async {
        final ServerUniverseWebSocketConnection
            serverUniverseWebSocketConnection = await onWebSocket();
        return WebSocketSession(
          onOpen: (webSocket) async {
            await serverUniverseWebSocketConnection.onOpen(webSocket, req, res);
          },
          onClose: (webSocket) async {
            await serverUniverseWebSocketConnection.onClose(
                webSocket, req, res);
          },
          onError: (webSocket, error) async {
            await serverUniverseWebSocketConnection.onError(
                error, webSocket, req, res);
          },
          onMessage: (webSocket, data) async {
            await serverUniverseWebSocketConnection.onMessage(
                data, webSocket, req, res);
          },
        );
      },
    );
  }

  /// ServerUniverseUncompleteDocumentation

  void tcpSocket({
    required FutureOr<ServerUniverseTcpSocketConnection> Function() onTcpSocket,
  }) {}

  // RouteGroup createRouteGroup(String path) {
  //   return RouteGroup(app, '${pathPrefix == '' ? '' : '$pathPrefix/'}$path');
  // }
}

/// ServerUniverseUncompleteDocumentation
typedef ServerUniverseWebSocketFunction = FutureOr<dynamic> Function(
  WebSocket webSocket,
  HttpRequest httpRequest,
  HttpResponse httpResponse,
);

/// ServerUniverseUncompleteDocumentation
typedef ServerUniverseWebSocketUpdateFunction = FutureOr<dynamic> Function(
  dynamic update,
  WebSocket webSocket,
  HttpRequest httpRequest,
  HttpResponse httpResponse,
);

/// ServerUniverseUncompleteDocumentation
typedef ServerUniverseWebSocketErrorFunction = FutureOr<dynamic> Function(
  dynamic error,
  WebSocket webSocket,
  HttpRequest httpRequest,
  HttpResponse httpResponse,
);

/// ServerUniverseUncompleteDocumentation
class ServerUniverseWebSocketConnection {
  /// ServerUniverseUncompleteDocumentation
  final ServerUniverseWebSocketFunction onOpen;

  /// ServerUniverseUncompleteDocumentation
  final ServerUniverseWebSocketFunction onClose;

  /// ServerUniverseUncompleteDocumentation
  final ServerUniverseWebSocketUpdateFunction onMessage;

  /// ServerUniverseUncompleteDocumentation
  final ServerUniverseWebSocketErrorFunction onError;

  /// ServerUniverseUncompleteDocumentation
  ServerUniverseWebSocketConnection({
    required this.onClose,
    required this.onError,
    required this.onMessage,
    required this.onOpen,
  });
}

/// ServerUniverseUncompleteDocumentation
class ServerUniverseTcpSocketConnection {
  /// ServerUniverseUncompleteDocumentation
  ServerUniverseTcpSocketConnection();
}

/// Function to prevent linting errors.
///
void _unawaited(Future<void> then) {}

/// Error thrown when a type handler cannot be found for a returned item
///
class NoTypeHandlerError extends Error {
  /// ServerUniverseUncompleteDocumentation
  final dynamic object;

  /// ServerUniverseUncompleteDocumentation
  final HttpRequest request;

  /// ServerUniverseUncompleteDocumentation
  NoTypeHandlerError(this.object, this.request);

  @override
  String toString() =>
      'No type handler found for ${object.runtimeType} / ${object.toString()} \nRoute: ${request.route}\nIf the app is running in production mode, the type name may be minified. Run it in debug mode to resolve';
}

/// Error used by middleware, utils or type handler to elevate
/// a NotFound response.
class NotFoundError extends Error {}

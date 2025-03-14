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

import 'type_handler.dart';

/// ServerUniverseUncompleteDocumentation
TypeHandler<WebSocketSession> get websocketTypeHandler =>
    TypeHandler<WebSocketSession>(
        (HttpRequest req, HttpResponse res, WebSocketSession value) async {
      var ws = await WebSocketTransformer.upgrade(req);
      value._start(ws);
    });

/// Convenience wrapper around Dart IO WebSocket implementation
class WebSocketSession {
  /// ServerUniverseUncompleteDocumentation
  late WebSocket socket;

  /// ServerUniverseUncompleteDocumentation
  FutureOr<void> Function(WebSocket webSocket)? onOpen;

  /// ServerUniverseUncompleteDocumentation
  FutureOr<void> Function(WebSocket webSocket, dynamic data)? onMessage;

  /// ServerUniverseUncompleteDocumentation
  FutureOr<void> Function(WebSocket webSocket)? onClose;

  /// ServerUniverseUncompleteDocumentation
  FutureOr<void> Function(WebSocket webSocket, dynamic error)? onError;

  /// ServerUniverseUncompleteDocumentation
  WebSocketSession({this.onOpen, this.onMessage, this.onClose, this.onError});

  void _start(WebSocket webSocket) {
    socket = webSocket;
    try {
      if (onOpen != null) {
        onOpen!(socket);
      }
      socket.listen((dynamic data) {
        if (onMessage != null) {
          onMessage!(socket, data);
        }
      }, onDone: () {
        if (onClose != null) {
          onClose!(socket);
        }
      }, onError: (dynamic error) {
        if (onError != null) {
          onError!(socket, error);
        }
      });
    } catch (e) {
      print('WebSocket Error: $e');
      try {
        socket.close();
        // ignore: empty_catches
      } catch (e) {}
    }
  }
}

/// ServerUniverseUncompleteDocumentation
extension WebSocketHelper on WebSocket {
  /// Sends data to the client
  void send(dynamic data) => add(data);
}

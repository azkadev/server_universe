import 'package:http/http.dart';

abstract class ServerUniverseHttpClientBaseCore {
  Client client() {
    return Client();
  }
}

abstract class ServerUniverseHttpClientBase implements ServerUniverseHttpClientBaseCore {
  ServerUniverseHttpClientBase();
}

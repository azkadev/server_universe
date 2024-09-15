import 'package:http/http.dart';

import 'base.dart';

class ServerUniverseHttpClient extends ServerUniverseHttpClientBase {
  @override
  Client client() {
    return Client();
  }
}

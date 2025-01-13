import 'package:http/http.dart';

import 'base.dart';

/// ServerUniverseUncompleteDocumentation
class ServerUniverseHttpClient extends ServerUniverseHttpClientBase {
  @override
  Client client() {
    return Client();
  }
}

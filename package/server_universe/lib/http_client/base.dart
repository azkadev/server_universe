import 'package:http/http.dart';

/// ServerUniverseUncompleteDocumentation
abstract class ServerUniverseHttpClientBaseCore {
  /// ServerUniverseUncompleteDocumentation
  Client client() {
    return Client();
  }
}

/// ServerUniverseUncompleteDocumentation
abstract class ServerUniverseHttpClientBase
    implements ServerUniverseHttpClientBaseCore {
  /// ServerUniverseUncompleteDocumentation
  ServerUniverseHttpClientBase();
}

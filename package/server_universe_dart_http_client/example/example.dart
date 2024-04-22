import 'package:server_universe_dart_http_client/server_universe_dart_http_client.dart';

void main(List<String> args) async {
  ServerUniverseHttpClient serverUniverseHttpClient =
      ServerUniverseHttpClient();
  final Uri uri = Uri.parse('http://localhost:3001/200');
  final res = await serverUniverseHttpClient.get(uri);
  print(res.statusCode);
  print(res.body);
}

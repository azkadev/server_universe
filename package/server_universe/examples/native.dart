import 'dart:io';
import 'package:general_lib/extension/dynamic.dart';
import 'package:server_universe/native.dart';

void main() async {
  print("start");
  int port = int.tryParse(Platform.environment["PORT"] ?? "3000") ?? 3000;
  String host = Platform.environment["HOST"] ?? "0.0.0.0";
  ServerUniverseNative app = ServerUniverseNative(
    serverUniverseLogType: ServerUniverseLogType.debug,
    onNotFound: (request, res) async {
      return res.status(400).send(({
            "@type": "error",
            "message": "path_not_found",
            "description": "PATH: Not Found",
          }.toStringifyPretty()));
    },
  );
  app.all("/", (req, res) {
    return res.status(200).send("oke");
  });

  int count = 0;
  app.all("/version", (req, res) async {
    count++;
    return await res.status(200).send("\nCOUNT: ${count}");
  });
  await app.listen(port: port, bindIp: host);
  print("Server on");
}

import 'package:server_universe/edge/edge.dart';

void main() async {
  print("start");
  ServerUniverseEdge app = ServerUniverseEdge(
    onNotFound: (request, res) async {
      return res.status(404).json({
        "@type": "error",
        "message": "path_not_found",
        "description": "PATH: ${request.path} Not Found"
      });
    },
    onError: (req, res, object, stackTrace) {
      return res
          .status(500)
          .json({"@type": "error", "message": "server_crash"});
    },
  );
  app.ensureInitialized();

  app.all("/", (req, res) {
    return res.send("oke");
  });
  app.all("/version", (req, res) {
    return res.json({
      "@type": "version",
      "version": "new update",
    });
  });
}

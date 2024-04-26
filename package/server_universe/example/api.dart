import 'dart:io';
import 'package:server_universe/api/server_universe_api.dart';

void main(List<String> args) async {
  ServerUniverseApi serverUniverseApi = ServerUniverseApi();
  serverUniverseApi.create(newName: "hi", directoryBase: Directory("path_to_dir/slebew")).listen((event) {
    print(event.value);
  });
  serverUniverseApi.build(directoryBase: Directory("path_to_dir/slebew"), directoryOutputBuildServerUniverse: Directory("path_to_dir/slebew/build"), inputFileName: "path_to_dir/slebew/bin/server.dart", server_universeDartBuildType: ServerUniverseBuildType.release, server_universeDartPlatformType: ServerUniversePlatformType.supabase).listen((event) {
    print(event.value);
  });
}

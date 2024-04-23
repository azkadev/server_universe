import 'dart:io';

import 'package:server_universe_dart/api/server_universe_dart_api.dart';

void main(List<String> args) async {
  ServerUniverseDartApi serverUniverseDartApi = ServerUniverseDartApi();
  await serverUniverseDartApi.create(
      newName: "hi", directoryBase: Directory("path_to_dir/slebew"));
  await serverUniverseDartApi.build(
      directoryBase: Directory("path_to_dir/slebew"),
      directoryOutputBuildServerUniverse: Directory("path_to_dir/slebew/build"),
      inputFileName: "path_to_dir/slebew/bin/server.dart",
      server_universeDartBuildType: ServerUniverseDartBuildType.release,
      server_universeDartPlatformType: ServerUniverseDartPlatformType.supabase);
}

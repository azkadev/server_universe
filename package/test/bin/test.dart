import 'dart:io';

import 'package:general_lib/script_generate/extensions.dart';
import 'package:test/test.dart' as test;
import "package:general_lib/general_lib.dart";

void main(List<String> arguments) {
  Directory("/home/galaxeus/Documents/galaxeus/app/server_universe/package/server_universe_dart").listSync().toScriptGenerate().generateToDirectory(directoryBase: Directory("/home/galaxeus/Documents/galaxeus/app/server_universe/package/server_universe")).listen((event) {
    print(event.text);
  });
}

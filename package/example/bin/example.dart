import 'package:example/example.dart' as example;
import 'package:server_universe_dart/native/native.dart';
import 'package:server_universe_dart/server_universe_dart.dart';

void main(List<String> arguments) {
  print('Hello world: ${example.calculate()}!');
  salplspa(ServerUniverse());
}

salplspa(ServerUniverse serverUniverse) {
  if (serverUniverse is ServerUniverseNative) {
    print("ya");
    serverUniverse;
  }
}

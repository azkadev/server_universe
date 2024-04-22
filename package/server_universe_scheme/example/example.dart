// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:server_universe_scheme/scheme/scheme/pubspec_server_universe.dart';

void main() async {
  print("start");
  PubspecServerUniverse pubspecServerUniverse = PubspecServerUniverse.create(
    name: "sever",
  );
  pubspecServerUniverse.special_type = "slebew";
  print(pubspecServerUniverse.toJson());
}

// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

class ServerUniversePubspecNativeConfig extends JsonScheme {
  ServerUniversePubspecNativeConfig(super.rawData);

  static Map get defaultData {
    return {
      "@type": "serverUniversePubspecNativeConfig",
      "input_file": "bin/example_server_universe.dart",
      "output_directory": "supabase/functions/example/"
    };
  }

  String? get special_type {
    try {
      if (rawData["@type"] is String == false) {
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  set special_type(String? value) {
    rawData["@type"] = value;
  }

  String? get input_file {
    try {
      if (rawData["input_file"] is String == false) {
        return null;
      }
      return rawData["input_file"] as String;
    } catch (e) {
      return null;
    }
  }

  set input_file(String? value) {
    rawData["input_file"] = value;
  }

  String? get output_directory {
    try {
      if (rawData["output_directory"] is String == false) {
        return null;
      }
      return rawData["output_directory"] as String;
    } catch (e) {
      return null;
    }
  }

  set output_directory(String? value) {
    rawData["output_directory"] = value;
  }

  static ServerUniversePubspecNativeConfig create({
    String special_type = "serverUniversePubspecNativeConfig",
    String? input_file,
    String? output_directory,
  }) {
    // ServerUniversePubspecNativeConfig serverUniversePubspecNativeConfig = ServerUniversePubspecNativeConfig({
    Map serverUniversePubspecNativeConfig_data_create_json = {
      "@type": special_type,
      "input_file": input_file,
      "output_directory": output_directory,
    };

    serverUniversePubspecNativeConfig_data_create_json
        .removeWhere((key, value) => value == null);
    ServerUniversePubspecNativeConfig
        serverUniversePubspecNativeConfig_data_create =
        ServerUniversePubspecNativeConfig(
            serverUniversePubspecNativeConfig_data_create_json);

    return serverUniversePubspecNativeConfig_data_create;
  }
}

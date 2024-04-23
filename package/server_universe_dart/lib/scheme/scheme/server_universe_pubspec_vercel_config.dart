// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

class ServerUniversePubspecVercelConfig extends JsonScheme {
  ServerUniversePubspecVercelConfig(super.rawData);

  static Map get defaultData {
    return {
      "@type": "serverUniversePubspecVercelConfig",
      "input_file": "bin/example_server_universe_vercel.dart",
      "output_directory": "vercel/functions/example/"
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

  static ServerUniversePubspecVercelConfig create({
    String special_type = "serverUniversePubspecVercelConfig",
    String? input_file,
    String? output_directory,
  }) {
    // ServerUniversePubspecVercelConfig serverUniversePubspecVercelConfig = ServerUniversePubspecVercelConfig({
    Map serverUniversePubspecVercelConfig_data_create_json = {
      "@type": special_type,
      "input_file": input_file,
      "output_directory": output_directory,
    };

    serverUniversePubspecVercelConfig_data_create_json
        .removeWhere((key, value) => value == null);
    ServerUniversePubspecVercelConfig
        serverUniversePubspecVercelConfig_data_create =
        ServerUniversePubspecVercelConfig(
            serverUniversePubspecVercelConfig_data_create_json);

    return serverUniversePubspecVercelConfig_data_create;
  }
}

// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

/// Generated
class PubspecServerUniverseConfigurationSupabase extends JsonScheme {
  /// Generated
  PubspecServerUniverseConfigurationSupabase(super.rawData);

  /// return default data
  ///
  static Map get defaultData {
    return {
      "@type": "PubspecServerUniverseConfigurationSupabase",
      "input_file": "",
      "output_directory": ""
    };
  }

  /// check data
  /// if raw data
  /// - rawData["@type"] == PubspecServerUniverseConfigurationSupabase
  /// if same return true
  bool json_scheme_utils_checkDataIsSameBySpecialType() {
    return rawData["@type"] == defaultData["@type"];
  }

  /// check value data whatever do yout want
  bool json_scheme_utils_checkDataIsSameBuilder({
    required bool Function(Map rawData, Map defaultData) onResult,
  }) {
    return onResult(rawData["@type"], defaultData["@type"]);
  }

  /// create [PubspecServerUniverseConfigurationSupabase]
  /// Empty
  static PubspecServerUniverseConfigurationSupabase empty() {
    return PubspecServerUniverseConfigurationSupabase({});
  }

  /// Generated
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

  /// Generated
  set special_type(String? value) {
    rawData["@type"] = value;
  }

  /// Generated
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

  /// Generated
  set input_file(String? value) {
    rawData["input_file"] = value;
  }

  /// Generated
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

  /// Generated
  set output_directory(String? value) {
    rawData["output_directory"] = value;
  }

  /// Generated
  static PubspecServerUniverseConfigurationSupabase create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "PubspecServerUniverseConfigurationSupabase",
    String? input_file,
    String? output_directory,
  }) {
    // PubspecServerUniverseConfigurationSupabase pubspecServerUniverseConfigurationSupabase = PubspecServerUniverseConfigurationSupabase({
    final Map pubspecServerUniverseConfigurationSupabase_data_create_json = {
      "@type": special_type,
      "input_file": input_file,
      "output_directory": output_directory,
    };

    pubspecServerUniverseConfigurationSupabase_data_create_json
        .removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (pubspecServerUniverseConfigurationSupabase_data_create_json
                .containsKey(key) ==
            false) {
          pubspecServerUniverseConfigurationSupabase_data_create_json[key] =
              value;
        }
      });
    }
    return PubspecServerUniverseConfigurationSupabase(
        pubspecServerUniverseConfigurationSupabase_data_create_json);
  }
}

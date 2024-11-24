// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "pubspec_server_universe_configuration_supabase.dart";

class PubspecServerUniverseConfiguration extends JsonScheme {
  PubspecServerUniverseConfiguration(super.rawData);

  /// return default data
  ///
  static Map get defaultData {
    return {
      "@type": "PubspecServerUniverseConfiguration",
      "supabase": {
        "@type": "PubspecServerUniverseConfigurationSupabase",
        "input_file": "",
        "output_directory": ""
      }
    };
  }

  /// check data
  /// if raw data
  /// - rawData["@type"] == PubspecServerUniverseConfiguration
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

  /// create [PubspecServerUniverseConfiguration]
  /// Empty
  static PubspecServerUniverseConfiguration empty() {
    return PubspecServerUniverseConfiguration({});
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

  PubspecServerUniverseConfigurationSupabase get supabase {
    try {
      if (rawData["supabase"] is Map == false) {
        return PubspecServerUniverseConfigurationSupabase({});
      }
      return PubspecServerUniverseConfigurationSupabase(
          rawData["supabase"] as Map);
    } catch (e) {
      return PubspecServerUniverseConfigurationSupabase({});
    }
  }

  set supabase(PubspecServerUniverseConfigurationSupabase value) {
    rawData["supabase"] = value.toJson();
  }

  static PubspecServerUniverseConfiguration create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "PubspecServerUniverseConfiguration",
    PubspecServerUniverseConfigurationSupabase? supabase,
  }) {
    // PubspecServerUniverseConfiguration pubspecServerUniverseConfiguration = PubspecServerUniverseConfiguration({
    final Map pubspecServerUniverseConfiguration_data_create_json = {
      "@type": special_type,
      "supabase": (supabase != null) ? supabase.toJson() : null,
    };

    pubspecServerUniverseConfiguration_data_create_json
        .removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (pubspecServerUniverseConfiguration_data_create_json
                .containsKey(key) ==
            false) {
          pubspecServerUniverseConfiguration_data_create_json[key] = value;
        }
      });
    }
    return PubspecServerUniverseConfiguration(
        pubspecServerUniverseConfiguration_data_create_json);
  }
}

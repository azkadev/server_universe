// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "pubspec_server_universe_dependencies.dart";
import "pubspec_server_universe_configuration.dart";

/// Generated
class PubspecServerUniverse extends JsonScheme {
  /// Generated
  PubspecServerUniverse(super.rawData);

  /// return default data
  ///
  static Map get defaultData {
    return {
      "@type": "PubspecServerUniverse",
      "name": "",
      "repository": "",
      "homepage": "",
      "issue_tracker": "",
      "documentation": "",
      "funding": [""],
      "dependencies": {"@type": "PubspecServerUniverseDependencies"},
      "server_universe": {
        "@type": "PubspecServerUniverseConfiguration",
        "supabase": {
          "@type": "PubspecServerUniverseConfigurationSupabase",
          "input_file": "",
          "output_directory": ""
        }
      }
    };
  }

  /// check data
  /// if raw data
  /// - rawData["@type"] == PubspecServerUniverse
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

  /// create [PubspecServerUniverse]
  /// Empty
  static PubspecServerUniverse empty() {
    return PubspecServerUniverse({});
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
  String? get name {
    try {
      if (rawData["name"] is String == false) {
        return null;
      }
      return rawData["name"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set name(String? value) {
    rawData["name"] = value;
  }

  /// Generated
  String? get repository {
    try {
      if (rawData["repository"] is String == false) {
        return null;
      }
      return rawData["repository"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set repository(String? value) {
    rawData["repository"] = value;
  }

  /// Generated
  String? get homepage {
    try {
      if (rawData["homepage"] is String == false) {
        return null;
      }
      return rawData["homepage"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set homepage(String? value) {
    rawData["homepage"] = value;
  }

  /// Generated
  String? get issue_tracker {
    try {
      if (rawData["issue_tracker"] is String == false) {
        return null;
      }
      return rawData["issue_tracker"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set issue_tracker(String? value) {
    rawData["issue_tracker"] = value;
  }

  /// Generated
  String? get documentation {
    try {
      if (rawData["documentation"] is String == false) {
        return null;
      }
      return rawData["documentation"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set documentation(String? value) {
    rawData["documentation"] = value;
  }

  /// Generated
  ///
  /// default:
  ///
  ///
  List<String> get funding {
    try {
      if (rawData["funding"] is List == false) {
        return [];
      }
      return (rawData["funding"] as List).cast<String>();
    } catch (e) {
      return [];
    }
  }

  /// Generated
  set funding(List<String> value) {
    rawData["funding"] = value;
  }

  /// Generated
  PubspecServerUniverseDependencies get dependencies {
    try {
      if (rawData["dependencies"] is Map == false) {
        return PubspecServerUniverseDependencies({});
      }
      return PubspecServerUniverseDependencies(rawData["dependencies"] as Map);
    } catch (e) {
      return PubspecServerUniverseDependencies({});
    }
  }

  /// Generated
  set dependencies(PubspecServerUniverseDependencies value) {
    rawData["dependencies"] = value.toJson();
  }

  /// Generated
  PubspecServerUniverseConfiguration get server_universe {
    try {
      if (rawData["server_universe"] is Map == false) {
        return PubspecServerUniverseConfiguration({});
      }
      return PubspecServerUniverseConfiguration(
          rawData["server_universe"] as Map);
    } catch (e) {
      return PubspecServerUniverseConfiguration({});
    }
  }

  /// Generated
  set server_universe(PubspecServerUniverseConfiguration value) {
    rawData["server_universe"] = value.toJson();
  }

  /// Generated
  static PubspecServerUniverse create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "PubspecServerUniverse",
    String? name,
    String? repository,
    String? homepage,
    String? issue_tracker,
    String? documentation,
    List<String>? funding,
    PubspecServerUniverseDependencies? dependencies,
    PubspecServerUniverseConfiguration? server_universe,
  }) {
    // PubspecServerUniverse pubspecServerUniverse = PubspecServerUniverse({
    final Map pubspecServerUniverse_data_create_json = {
      "@type": special_type,
      "name": name,
      "repository": repository,
      "homepage": homepage,
      "issue_tracker": issue_tracker,
      "documentation": documentation,
      "funding": funding,
      "dependencies": (dependencies != null) ? dependencies.toJson() : null,
      "server_universe":
          (server_universe != null) ? server_universe.toJson() : null,
    };

    pubspecServerUniverse_data_create_json
        .removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (pubspecServerUniverse_data_create_json.containsKey(key) == false) {
          pubspecServerUniverse_data_create_json[key] = value;
        }
      });
    }
    return PubspecServerUniverse(pubspecServerUniverse_data_create_json);
  }
}

// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "pubspec_server_universe_dependencies_extra.dart";

class PubspecServerUniverseDependencies extends JsonScheme {
  PubspecServerUniverseDependencies(super.rawData);

  static Map get defaultData {
    return {
      "@type": "pubspecServerUniverseDependencies",
      "flutter": {
        "@type": "pubspecServerUniverseDependenciesExtra",
        "sdk": "flutter"
      },
      "cupertino_icons": "^1.0.2"
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

  PubspecServerUniverseDependenciesExtra get flutter {
    try {
      if (rawData["flutter"] is Map == false) {
        return PubspecServerUniverseDependenciesExtra({});
      }
      return PubspecServerUniverseDependenciesExtra(rawData["flutter"] as Map);
    } catch (e) {
      return PubspecServerUniverseDependenciesExtra({});
    }
  }

  set flutter(PubspecServerUniverseDependenciesExtra value) {
    rawData["flutter"] = value.toJson();
  }

  String? get cupertino_icons {
    try {
      if (rawData["cupertino_icons"] is String == false) {
        return null;
      }
      return rawData["cupertino_icons"] as String;
    } catch (e) {
      return null;
    }
  }

  set cupertino_icons(String? value) {
    rawData["cupertino_icons"] = value;
  }

  static PubspecServerUniverseDependencies create({
    String special_type = "pubspecServerUniverseDependencies",
    PubspecServerUniverseDependenciesExtra? flutter,
    String? cupertino_icons,
  }) {
    // PubspecServerUniverseDependencies pubspecServerUniverseDependencies = PubspecServerUniverseDependencies({
    Map pubspecServerUniverseDependencies_data_create_json = {
      "@type": special_type,
      "flutter": (flutter != null) ? flutter.toJson() : null,
      "cupertino_icons": cupertino_icons,
    };

    pubspecServerUniverseDependencies_data_create_json
        .removeWhere((key, value) => value == null);
    PubspecServerUniverseDependencies
        pubspecServerUniverseDependencies_data_create =
        PubspecServerUniverseDependencies(
            pubspecServerUniverseDependencies_data_create_json);

    return pubspecServerUniverseDependencies_data_create;
  }
}

/* <!-- START LICENSE -->


Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION 
Social Media: 

- Youtube: https://youtube.com/@Global_Corporation 
- Github: https://github.com/globalcorporation
- TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "pubspec_server_universe_platforms.dart";
import "pubspec_server_universe_environment.dart";
import "pubspec_server_universe_dependencies.dart";
import "pubspec_server_universe_dev_dependencies.dart";
import "server_universe_pubspec_config.dart";

class PubspecServerUniverse extends JsonScheme {
  PubspecServerUniverse(super.rawData);

  static Map get defaultData {
    return {
      "@type": "pubspecServerUniverse",
      "name": "example",
      "description": "A sample command-line application.",
      "version": "0.0.0",
      "publish_to": "none",
      "homepage": "https://youtube.com/@azkadev",
      "repository": "https://github.com/azkadev/packagex.git",
      "issue_tracker": "https://github.com/azkadev/server_universe/issues",
      "documentation":
          "https://github.com/azkadev/server_universe/tree/main/docs",
      "funding": ["https://github.com/sponsors/azkadev"],
      "platforms": {
        "@type": "pubspecServerUniversePlatforms",
        "android": null,
        "ios": null,
        "linux": null,
        "macos": null,
        "web": null,
        "windows": null
      },
      "environment": {
        "@type": "pubspecServerUniverseEnvironment",
        "sdk": ">=2.18.5 <3.0.0"
      },
      "dependencies": {
        "@type": "pubspecServerUniverseDependencies",
        "flutter": {
          "@type": "pubspecServerUniverseDependenciesExtra",
          "sdk": "flutter"
        },
        "cupertino_icons": "^1.0.2"
      },
      "dev_dependencies": {
        "@type": "pubspecServerUniverseDevDependencies",
        "lints": "^2.0.0",
        "test": "^1.16.0",
        "packagex": {
          "@type": "pubspecServerUniverseDevDependenciesExtra",
          "path": "../"
        },
        "msix": "^1.0.6"
      },
      "server_universe": {
        "@type": "serverUniversePubspecConfig",
        "native": {
          "@type": "serverUniversePubspecNativeConfig",
          "input_file": "bin/example_server_universe.dart",
          "output_directory": "supabase/functions/example/"
        },
        "supabase": {
          "@type": "serverUniversePubspecSupabaseConfig",
          "input_file": "bin/example_server_universe_supabase.dart",
          "output_directory": "supabase/functions/example/"
        },
        "vercel": {
          "@type": "serverUniversePubspecVercelConfig",
          "input_file": "bin/example_server_universe_vercel.dart",
          "output_directory": "vercel/functions/example/"
        }
      }
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

  set name(String? value) {
    rawData["name"] = value;
  }

  String? get description {
    try {
      if (rawData["description"] is String == false) {
        return null;
      }
      return rawData["description"] as String;
    } catch (e) {
      return null;
    }
  }

  set description(String? value) {
    rawData["description"] = value;
  }

  String? get version {
    try {
      if (rawData["version"] is String == false) {
        return null;
      }
      return rawData["version"] as String;
    } catch (e) {
      return null;
    }
  }

  set version(String? value) {
    rawData["version"] = value;
  }

  String? get publish_to {
    try {
      if (rawData["publish_to"] is String == false) {
        return null;
      }
      return rawData["publish_to"] as String;
    } catch (e) {
      return null;
    }
  }

  set publish_to(String? value) {
    rawData["publish_to"] = value;
  }

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

  set homepage(String? value) {
    rawData["homepage"] = value;
  }

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

  set repository(String? value) {
    rawData["repository"] = value;
  }

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

  set issue_tracker(String? value) {
    rawData["issue_tracker"] = value;
  }

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

  set documentation(String? value) {
    rawData["documentation"] = value;
  }

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

  set funding(List<String> value) {
    rawData["funding"] = value;
  }

  PubspecServerUniversePlatforms get platforms {
    try {
      if (rawData["platforms"] is Map == false) {
        return PubspecServerUniversePlatforms({});
      }
      return PubspecServerUniversePlatforms(rawData["platforms"] as Map);
    } catch (e) {
      return PubspecServerUniversePlatforms({});
    }
  }

  set platforms(PubspecServerUniversePlatforms value) {
    rawData["platforms"] = value.toJson();
  }

  PubspecServerUniverseEnvironment get environment {
    try {
      if (rawData["environment"] is Map == false) {
        return PubspecServerUniverseEnvironment({});
      }
      return PubspecServerUniverseEnvironment(rawData["environment"] as Map);
    } catch (e) {
      return PubspecServerUniverseEnvironment({});
    }
  }

  set environment(PubspecServerUniverseEnvironment value) {
    rawData["environment"] = value.toJson();
  }

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

  set dependencies(PubspecServerUniverseDependencies value) {
    rawData["dependencies"] = value.toJson();
  }

  PubspecServerUniverseDevDependencies get dev_dependencies {
    try {
      if (rawData["dev_dependencies"] is Map == false) {
        return PubspecServerUniverseDevDependencies({});
      }
      return PubspecServerUniverseDevDependencies(
          rawData["dev_dependencies"] as Map);
    } catch (e) {
      return PubspecServerUniverseDevDependencies({});
    }
  }

  set dev_dependencies(PubspecServerUniverseDevDependencies value) {
    rawData["dev_dependencies"] = value.toJson();
  }

  ServerUniversePubspecConfig get server_universe {
    try {
      if (rawData["server_universe"] is Map == false) {
        return ServerUniversePubspecConfig({});
      }
      return ServerUniversePubspecConfig(rawData["server_universe"] as Map);
    } catch (e) {
      return ServerUniversePubspecConfig({});
    }
  }

  set server_universe(ServerUniversePubspecConfig value) {
    rawData["server_universe"] = value.toJson();
  }

  static PubspecServerUniverse create({
    String special_type = "pubspecServerUniverse",
    String? name,
    String? description,
    String? version,
    String? publish_to,
    String? homepage,
    String? repository,
    String? issue_tracker,
    String? documentation,
    List<String>? funding,
    PubspecServerUniversePlatforms? platforms,
    PubspecServerUniverseEnvironment? environment,
    PubspecServerUniverseDependencies? dependencies,
    PubspecServerUniverseDevDependencies? dev_dependencies,
    ServerUniversePubspecConfig? server_universe,
  }) {
    // PubspecServerUniverse pubspecServerUniverse = PubspecServerUniverse({
    Map pubspecServerUniverse_data_create_json = {
      "@type": special_type,
      "name": name,
      "description": description,
      "version": version,
      "publish_to": publish_to,
      "homepage": homepage,
      "repository": repository,
      "issue_tracker": issue_tracker,
      "documentation": documentation,
      "funding": funding,
      "platforms": (platforms != null) ? platforms.toJson() : null,
      "environment": (environment != null) ? environment.toJson() : null,
      "dependencies": (dependencies != null) ? dependencies.toJson() : null,
      "dev_dependencies":
          (dev_dependencies != null) ? dev_dependencies.toJson() : null,
      "server_universe":
          (server_universe != null) ? server_universe.toJson() : null,
    };

    pubspecServerUniverse_data_create_json
        .removeWhere((key, value) => value == null);
    PubspecServerUniverse pubspecServerUniverse_data_create =
        PubspecServerUniverse(pubspecServerUniverse_data_create_json);

    return pubspecServerUniverse_data_create;
  }
}

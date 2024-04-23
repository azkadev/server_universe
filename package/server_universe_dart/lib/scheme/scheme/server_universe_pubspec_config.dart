// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "server_universe_pubspec_native_config.dart";
import "server_universe_pubspec_supabase_config.dart";
import "server_universe_pubspec_vercel_config.dart";

class ServerUniversePubspecConfig extends JsonScheme {
  ServerUniversePubspecConfig(super.rawData);

  static Map get defaultData {
    return {
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

  ServerUniversePubspecNativeConfig get native {
    try {
      if (rawData["native"] is Map == false) {
        return ServerUniversePubspecNativeConfig({});
      }
      return ServerUniversePubspecNativeConfig(rawData["native"] as Map);
    } catch (e) {
      return ServerUniversePubspecNativeConfig({});
    }
  }

  set native(ServerUniversePubspecNativeConfig value) {
    rawData["native"] = value.toJson();
  }

  ServerUniversePubspecSupabaseConfig get supabase {
    try {
      if (rawData["supabase"] is Map == false) {
        return ServerUniversePubspecSupabaseConfig({});
      }
      return ServerUniversePubspecSupabaseConfig(rawData["supabase"] as Map);
    } catch (e) {
      return ServerUniversePubspecSupabaseConfig({});
    }
  }

  set supabase(ServerUniversePubspecSupabaseConfig value) {
    rawData["supabase"] = value.toJson();
  }

  ServerUniversePubspecVercelConfig get vercel {
    try {
      if (rawData["vercel"] is Map == false) {
        return ServerUniversePubspecVercelConfig({});
      }
      return ServerUniversePubspecVercelConfig(rawData["vercel"] as Map);
    } catch (e) {
      return ServerUniversePubspecVercelConfig({});
    }
  }

  set vercel(ServerUniversePubspecVercelConfig value) {
    rawData["vercel"] = value.toJson();
  }

  static ServerUniversePubspecConfig create({
    String special_type = "serverUniversePubspecConfig",
    ServerUniversePubspecNativeConfig? native,
    ServerUniversePubspecSupabaseConfig? supabase,
    ServerUniversePubspecVercelConfig? vercel,
  }) {
    // ServerUniversePubspecConfig serverUniversePubspecConfig = ServerUniversePubspecConfig({
    Map serverUniversePubspecConfig_data_create_json = {
      "@type": special_type,
      "native": (native != null) ? native.toJson() : null,
      "supabase": (supabase != null) ? supabase.toJson() : null,
      "vercel": (vercel != null) ? vercel.toJson() : null,
    };

    serverUniversePubspecConfig_data_create_json
        .removeWhere((key, value) => value == null);
    ServerUniversePubspecConfig serverUniversePubspecConfig_data_create =
        ServerUniversePubspecConfig(
            serverUniversePubspecConfig_data_create_json);

    return serverUniversePubspecConfig_data_create;
  }
}

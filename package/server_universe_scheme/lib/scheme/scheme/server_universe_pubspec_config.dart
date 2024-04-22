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

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

class ServerUniversePubspecSupabaseConfig extends JsonScheme {
  ServerUniversePubspecSupabaseConfig(super.rawData);

  static Map get defaultData {
    return {
      "@type": "serverUniversePubspecSupabaseConfig",
      "input_file": "bin/example_server_universe_supabase.dart",
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

  static ServerUniversePubspecSupabaseConfig create({
    String special_type = "serverUniversePubspecSupabaseConfig",
    String? input_file,
    String? output_directory,
  }) {
    // ServerUniversePubspecSupabaseConfig serverUniversePubspecSupabaseConfig = ServerUniversePubspecSupabaseConfig({
    Map serverUniversePubspecSupabaseConfig_data_create_json = {
      "@type": special_type,
      "input_file": input_file,
      "output_directory": output_directory,
    };

    serverUniversePubspecSupabaseConfig_data_create_json
        .removeWhere((key, value) => value == null);
    ServerUniversePubspecSupabaseConfig
        serverUniversePubspecSupabaseConfig_data_create =
        ServerUniversePubspecSupabaseConfig(
            serverUniversePubspecSupabaseConfig_data_create_json);

    return serverUniversePubspecSupabaseConfig_data_create;
  }
}

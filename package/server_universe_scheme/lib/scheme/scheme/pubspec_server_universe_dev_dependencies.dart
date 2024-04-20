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

import "pubspec_server_universe_dev_dependencies_extra.dart";

 
class PubspecServerUniverseDevDependencies extends JsonScheme {

  
  PubspecServerUniverseDevDependencies(super.rawData);
   
  static Map get defaultData {
    return {"@type":"pubspecServerUniverseDevDependencies","lints":"^2.0.0","test":"^1.16.0","packagex":{"@type":"pubspecServerUniverseDevDependenciesExtra","path":"../"},"msix":"^1.0.6"};
  }

  
  String? get special_type {
    try {
      if (rawData["@type"] is String == false){
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


  
  String? get lints {
    try {
      if (rawData["lints"] is String == false){
        return null;
      }
      return rawData["lints"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set lints(String? value) {
    rawData["lints"] = value;
  }


  
  String? get test {
    try {
      if (rawData["test"] is String == false){
        return null;
      }
      return rawData["test"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set test(String? value) {
    rawData["test"] = value;
  }


  
  PubspecServerUniverseDevDependenciesExtra get packagex {
    try {
      if (rawData["packagex"] is Map == false){
        return PubspecServerUniverseDevDependenciesExtra({}); 
      }
      return PubspecServerUniverseDevDependenciesExtra(rawData["packagex"] as Map);
    } catch (e) {  
      return PubspecServerUniverseDevDependenciesExtra({}); 
    }
  }


  
  set packagex(PubspecServerUniverseDevDependenciesExtra value) {
    rawData["packagex"] = value.toJson();
  }



  
  String? get msix {
    try {
      if (rawData["msix"] is String == false){
        return null;
      }
      return rawData["msix"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set msix(String? value) {
    rawData["msix"] = value;
  }


  
  static PubspecServerUniverseDevDependencies create({

    String special_type = "pubspecServerUniverseDevDependencies",
    String? lints,
    String? test,
      PubspecServerUniverseDevDependenciesExtra? packagex,
    String? msix,
})  {
    // PubspecServerUniverseDevDependencies pubspecServerUniverseDevDependencies = PubspecServerUniverseDevDependencies({
Map pubspecServerUniverseDevDependencies_data_create_json = {
  
      "@type": special_type,
      "lints": lints,
      "test": test,
      "packagex": (packagex != null)?packagex.toJson(): null,
      "msix": msix,


};


          pubspecServerUniverseDevDependencies_data_create_json.removeWhere((key, value) => value == null);
PubspecServerUniverseDevDependencies pubspecServerUniverseDevDependencies_data_create = PubspecServerUniverseDevDependencies(pubspecServerUniverseDevDependencies_data_create_json);

return pubspecServerUniverseDevDependencies_data_create;



      }
}
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
// ignore_for_file: empty_catches, non_constant_identifier_names

extension ServerUniverserDartMapExtension on Map {
  void server_universe_dart_updateMapIfNotSameOrEmptyOrNull({
    required Map data,
    required List<String> ignoreKeys,
  }) {
    data.forEach((key, value) {
      if (ignoreKeys.contains(key)) {
        return;
      }
      try {
        // jika tidak ada key
        if (!containsKey(key)) {
          this[key] = value;
          return;
        }

        // jika ada value
        if (this[key] == null) {
          this[key] = value;
        } else if (value is Map && this[key] is Map) {
          (this[key] as Map)
              .server_universe_dart_updateMapIfNotSameOrEmptyOrNull(
                  data: value, ignoreKeys: ignoreKeys);
        } else if (key is List && this[key] is List) {}
      } catch (e) {}
    });
    server_universe_dart_removeKeyRecursive(ignoreKeys: ignoreKeys);
    return;
  }

  void server_universe_dart_removeKeyRecursive({
    required List<String> ignoreKeys,
  }) {
    removeWhere((key, value) {
      if (ignoreKeys.contains(key)) {
        return true;
      }
      if (value is Map) {
        value.server_universe_dart_removeKeyRecursive(ignoreKeys: ignoreKeys);
      }
      return false;
    });
    return;
  }
}

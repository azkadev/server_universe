/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

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
// ignore: constant_identifier_names
enum DecodeMode { AllButSlash, SlashOnly }

extension PathNormalizer on String {
  /// Trims all slashes at the start and end
  String get normalizePath {
    if (startsWith('/')) {
      return substring('/'.length).normalizePath;
    }
    if (endsWith('/')) {
      return substring(0, length - '/'.length).normalizePath;
    }
    return this;
  }

  static final int _percent = '%'.codeUnitAt(0);
  static final int _slash = '/'.codeUnitAt(0);
  static final int _zero = '0'.codeUnitAt(0);
  static final int _nine = '9'.codeUnitAt(0);
  static final int _upperA = 'A'.codeUnitAt(0);
  static final int _upperF = 'F'.codeUnitAt(0);
  static final int _lowerA = 'a'.codeUnitAt(0);
  static final int _lowerF = 'f'.codeUnitAt(0);

  int _decodeHex(int codeUnit) {
    if (_zero <= codeUnit && codeUnit <= _nine) {
      return codeUnit - _zero;
    }
    if (_lowerA <= codeUnit && codeUnit <= _lowerF) {
      return 10 + codeUnit - _lowerA;
    } else if (_upperA <= codeUnit && codeUnit <= _upperF) {
      return 10 + codeUnit - _upperA;
    } else {
      return -1;
    }
  }

  int? _getCodeUnit(int hex1, int hex2) {
    if (hex1 < 0 || hex1 >= 16) return null;
    if (hex2 < 0 || hex2 >= 16) return null;
    return 16 * hex1 + hex2;
  }

  bool _decode(int? codeUnit, DecodeMode mode) {
    if (codeUnit == null) return false;
    switch (mode) {
      case DecodeMode.AllButSlash:
        return codeUnit != _slash;
      case DecodeMode.SlashOnly:
        return codeUnit == _slash;
    }
  }

  String decodeUri(DecodeMode mode) {
    var codes = codeUnits;
    var changed = false;
    var pos = 0;
    while (pos < codes.length) {
      final char = codes[pos];
      if (char == _percent) {
        if (pos + 2 >= length) break;
        final hex1 = _decodeHex(codes[pos + 1]);
        final hex2 = _decodeHex(codes[pos + 2]);
        final codeUnit = _getCodeUnit(hex1, hex2);
        if (_decode(codeUnit, mode)) {
          if (!changed) {
            // make a copy
            codes = codes.toList();
            changed = true;
          }
          codes[pos] = codeUnit!;
          codes.removeRange(pos + 1, pos + 3);
        }
      }
      pos++;
    }
    return changed ? String.fromCharCodes(codes) : this;
  }
}

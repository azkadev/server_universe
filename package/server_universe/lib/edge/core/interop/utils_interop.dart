// ignore_for_file: type_literal_in_constant_pattern

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
import 'dart:js_util' as js_util;
import 'package:js/js.dart';

import 'package:typings_fork/core.dart' as interop;

import 'package:server_universe/edge/core/request.dart';
import 'package:server_universe/edge/core/resource.dart';

/// ServerUniverseUncompleteDocumentation
interop.Request requestFromResource(Resource resource) {
  switch (resource.runtimeType) {
    case StringValue:
      return interop.Request((resource as StringValue).url);
    case UriValue:
      return interop.Request((resource as UriValue).uri.toString());
    case RequestValue:
      return (resource as RequestValue).request.delegate;
    default:
      throw Exception('Unknown resource type ${resource.runtimeType}');
  }
}

@JS('Object.keys')

/// ServerUniverseUncompleteDocumentation
external List<Object?> objectKeys(Object? object);

@JS('undefined')

/// ServerUniverseUncompleteDocumentation
external Object get jsUndefined;

@anonymous
@JS()

/// ServerUniverseUncompleteDocumentation
class JavaScriptObject {
  /// ServerUniverseUncompleteDocumentation
  external factory JavaScriptObject();
}

/// ServerUniverseUncompleteDocumentation
extension PropsJavaScriptObject on JavaScriptObject {
  /// ServerUniverseUncompleteDocumentation
  T get<T>(String key) => js_util.getProperty(this, key);

  /// ServerUniverseUncompleteDocumentation
  void set(String key, dynamic value) {
    js_util.setProperty(this, key, value);
  }
}

/// ServerUniverseUncompleteDocumentation
bool isBasicType(value) {
  if (value == null || value is num || value is bool || value is String) {
    return true;
  }
  return false;
}

/// ServerUniverseUncompleteDocumentation
T dartify<T>(dynamic jsObject) {
  if (isBasicType(jsObject)) {
    return jsObject as T;
  }

  if (jsObject is List) {
    return jsObject.map(dartify).toList() as T;
  }

  var keys = objectKeys(jsObject);
  var result = <String, dynamic>{};
  for (var key in keys) {
    result[key as String] = dartify(js_util.getProperty(jsObject, key));
  }

  return result as T;
}

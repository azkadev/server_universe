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
import 'dart:io';

/// Data structure to keep all request-related data
final storePluginData = <HttpRequest, RequestStore>{};

/// Integrates [RequestStore] mechanism on [HttpRequest]
extension StorePlugin on HttpRequest {
  /// Returns the [RequestStore] dedicated to this request.
  RequestStore get store {
    storePluginData[this] ??= RequestStore();
    return storePluginData[this]!;
  }
}

/// Key-Value-Store for reading and writing request-related data
class RequestStore {
  final _data = <String, dynamic>{};

  /// Stores a [value] associated with a specified [key].
  ///
  /// Example:
  /// ```dart
  /// req.store.set('foo', Foo());
  /// ```
  void set(String key, dynamic value) => _data[key] = value;

  /// Returns the stored value that has been associated with the specified [key].
  /// Returns `null` if no value has been written.
  ///
  /// Example:
  /// ```dart
  /// var foo = req.store.tryGet<Foo>('foo');
  /// ```
  T? tryGet<T>(String key) {
    dynamic data = _data[key];
    assert(data == null || data is T,
        'Store value for key $key does not match type $T');
    return data as T?;
  }

  /// Returns the stored value that has been associated with the specified [key].
  /// Will throw if null or no value was registered.
  ///
  /// Example:
  /// ```dart
  /// var foo = req.store.get<Foo>('foo');
  /// ```
  T get<T>(String key) {
    return tryGet<T>(key) as T;
  }

  /// Gets the value for the specified [key] or sets it using the [builder].
  ///
  /// Example:
  /// ```dart
  /// var foo = req.store.getOrSet<ExpensiveFoo>('foo', () => ExpensiveFoo());
  /// ```
  T getOrSet<T>(String key, T Function() builder) {
    if (!_data.containsKey(key)) {
      final value = builder();
      set(key, value);
      return value;
    } else {
      return get<T>(key);
    }
  }

  /// Clear any value associated with the specified [key].
  ///
  /// Example:
  /// ```dart
  /// req.store.unset('foo');
  /// ```
  void unset(String key) => _data.remove(key);
}

/// Used within [ServerUniverse] to remove request-related data after
/// the request has been resolved.
void storePluginOnDoneHandler(HttpRequest req, HttpResponse res) {
  storePluginData.remove(req);
}

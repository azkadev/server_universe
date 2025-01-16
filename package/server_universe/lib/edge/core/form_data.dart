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
import 'package:typings_fork/core.dart' as interop;

import 'package:server_universe/edge/core/file.dart';

// part 'form_data.freezed.dart';

/// ServerUniverseUncompleteDocumentation
class FormData {
  final interop.FormData _delegate;
  FormData._(this._delegate);

  /// ServerUniverseUncompleteDocumentation
  FormData() : _delegate = interop.FormData();

  /// ServerUniverseUncompleteDocumentation
  void append(String name, FormDataEntryValue value) {
    value.when(file: (value) {
      throw UnimplementedError();
    }, string: (value) {
      _delegate.append.$3(
        name,
        interop.Blob(
          [value],
          interop.BlobPropertyBag(type: 'text/plain'),
        ),
      );
    });
  }

  /// ServerUniverseUncompleteDocumentation
  void delete(String name) => _delegate.delete(name);

  /// ServerUniverseUncompleteDocumentation
  bool has(String name) => _delegate.has(name);

  /// ServerUniverseUncompleteDocumentation
  FormDataEntryValue? get(String name) {
    final value = _delegate.get(name);

    if (value is String) {
      return FormDataEntryValue.string(value);
    } else if (value is interop.File) {
      return FormDataEntryValue.file(fileFromJsObject(value));
    }

    return null;
  }

  /// ServerUniverseUncompleteDocumentation
  Iterable<FormDataEntryValue> getAll(String name) sync* {
    final values = _delegate.getAll(name);

    for (final value in values) {
      if (value is String) {
        yield FormDataEntryValue.string(value);
      } else if (value is interop.File) {
        yield FormDataEntryValue.file(fileFromJsObject(value));
      } else {
        throw StateError('Unknown FormDataEntryValue type: $value');
      }
    }
  }

  /// ServerUniverseUncompleteDocumentation
  operator []=(String name, FormDataEntryValue value) {
    value.when(file: (value) {
      throw UnimplementedError();
    }, string: (value) {
      _delegate.set.$3(
        name,
        interop.Blob(
          [value],
          interop.BlobPropertyBag(type: 'text/plain'),
        ),
      );
    });
  }

  /// ServerUniverseUncompleteDocumentation

  FormDataEntryValue? operator [](String name) {
    return get(name);
  }
}

/// ServerUniverseUncompleteDocumentation
FormData formDataFromJsObject(interop.FormData delegate) {
  return FormData._(delegate);
}
///
class FormDataEntryValue with _$FormDataEntryValue {
  /// ServerUniverseUncompleteDocumentation
  const factory FormDataEntryValue.file(File file) = FileValue;

  /// Creates a [FormDataEntryValue] instance from a [String].
  const factory FormDataEntryValue.string(String value) = StringValue;
}

///
// // ignore: unused_element
// T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormDataEntryValue {
  TResult when<TResult extends Object?>({
    required TResult Function(File file) file,
    required TResult Function(String value) string,
  }) =>
      throw _privateConstructorUsedError;

  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? file,
    TResult? Function(String value)? string,
  }) =>
      throw _privateConstructorUsedError;

  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? file,
    TResult Function(String value)? string,

    required TResult Function() orElse,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$FileValue implements FileValue {
  const _$FileValue(this.file);

  @override
  final File file;

  @override
  String toString() {
    return 'FormDataEntryValue.file(file: $file)';
  }

  @override
  TResult when<TResult extends Object?>({
    required TResult Function(File file) file,
    required TResult Function(String value) string,
  }) {
    return file(this.file);
  }

  @override
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? file,
    TResult? Function(String value)? string,
  }) {
    return file?.call(this.file);
  }

  @override
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? file,
    TResult Function(String value)? string,
    ///
    required TResult Function() orElse,
  }) {
    if (file != null) {
      return file(this.file);
    }
    return orElse();
  }
}
///
abstract class FileValue implements FormDataEntryValue {
  ///
  const factory FileValue(final File file) = _$FileValue;
///
  File get file;
}

/// @nodoc

class _$StringValue implements StringValue {
  const _$StringValue(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'FormDataEntryValue.string(value: $value)';
  }

  @override
  TResult when<TResult extends Object?>({
    required TResult Function(File file) file,
    required TResult Function(String value) string,
  }) {
    return string(value);
  }

  @override
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? file,
    TResult? Function(String value)? string,
  }) {
    return string?.call(value);
  }

  @override
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? file,
    TResult Function(String value)? string,
    
    required TResult Function() orElse,
  }) {
    if (string != null) {
      return string(value);
    }
    return orElse();
  }
}
///
abstract class StringValue implements FormDataEntryValue {
  ///
  const factory StringValue(final String value) = _$StringValue;
  ///
  String get value;
}

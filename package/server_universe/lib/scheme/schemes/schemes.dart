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
List<Map> schemes = [
  {
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
      "windows": null,
    },
    "environment": {
      "@type": "pubspecServerUniverseEnvironment",
      "sdk": ">=2.18.5 <3.0.0",
    },
    "dependencies": {
      "@type": "pubspecServerUniverseDependencies",
      "flutter": {
        "@type": "pubspecServerUniverseDependenciesExtra",
        "sdk": "flutter",
      },
      "cupertino_icons": "^1.0.2"
    },
    "dev_dependencies": {
      "@type": "pubspecServerUniverseDevDependencies",
      "lints": "^2.0.0",
      "test": "^1.16.0",
      "packagex": {
        "@type": "pubspecServerUniverseDevDependenciesExtra",
        "path": "../",
      },
      "msix": "^1.0.6"
    },
    "server_universe": {
      "@type": "serverUniversePubspecConfig",
      "native": {
        "@type": "serverUniversePubspecNativeConfig",
        "input_file": "bin/example_server_universe.dart",
        "output_directory": "supabase/functions/example/",
      },
      "supabase": {
        "@type": "serverUniversePubspecSupabaseConfig",
        "input_file": "bin/example_server_universe_supabase.dart",
        "output_directory": "supabase/functions/example/",
      },
      "vercel": {
        "@type": "serverUniversePubspecVercelConfig",
        "input_file": "bin/example_server_universe_vercel.dart",
        "output_directory": "vercel/functions/example/",
      },
    },
  },
];

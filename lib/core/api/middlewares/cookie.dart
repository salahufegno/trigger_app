// // ignore_for_file: public_member_api_docs

// import 'package:cookie_jar/cookie_jar.dart';
// import 'package:trigger_app/imports_bindings.dart';

// final _dio = Dio()
//   ..interceptors.add(
//     CookieManager(
//       PersistCookieJar(
//         ignoreExpires: true,
//         deleteHostCookiesWhenLoadFailed: false,
//         storage: FileStorage(
//           '${StorageService().appDocDir.path}/.cookies/',
//         ),
//       ),
//     ),
//   );

// Dio get cookieDio {
//   return _dio;
// }

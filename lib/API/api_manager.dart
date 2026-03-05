// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class ApiManager {
//
//   Future signInWithEmail({
//     required String email,
//     required String password,
//   }) async {
//
//     try {
//
//       var url = Uri.parse('URL');

//       var response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'email': email,
//           'password': password,
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         throw Exception('Login failed with status code: ${response.statusCode}');
//       }
//
//     } catch (e) {
//       throw Exception('Something went wrong: $e');
//     }
//   }
// }
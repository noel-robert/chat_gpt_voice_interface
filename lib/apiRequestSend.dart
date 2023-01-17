import 'package:http/http.dart' as http;
import 'dart:convert';

// Future<String?> query(String question) async {
//   print("object");
//   http.Response response = (await sendQuery(question)) as http.Response;
//
//
//
//   return response.body;
// }

query(String question) async {
  // return http.post(
  //   Uri.parse('https://chatgptapi2.up.railway.app/accounts/ask'),
  //   headers: <String, String>{
  //     'Referer': 'https://chatgptapi2.up.railway.app/',
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   },
  //   body: jsonEncode(<String, String>{
  //     'title': 'dummy',
  //     'question': question,
  //   })
  // );

  var url = 'https://chatgptapi2.up.railway.app/accounts/ask';
  final Uri urlNew = Uri.parse(url);
  var headers = {'Referer': 'https://chatgptapi2.up.railway.app/'};
  var inputString = question;
  var data = {'title': 'dummy', 'question': inputString};
  var response = await http.post(urlNew, headers: headers, body: json.encode(data));
  var result = json.decode(response.body);
  var finalResult = result['output'];
  print(finalResult);
  return finalResult;
}
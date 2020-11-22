import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'service.dart';
void loadData_http_get() async {
  print('------loadData_http_get--------');

  var client = http.Client();

  var uri = Uri.parse(njqbaseUrl + homeNoviceListUrl);

  http.Response response = await client.get(uri);

  if (response.statusCode == HttpStatus.ok) {
    print(response.body);
  } else {
    print('请求失败 code 码为${response.statusCode}');
  }
}


void loadData_http_get_convenience() async {
  print('------简便方法loadData_http_get_convenience--------');

  var uri = Uri.parse(njqbaseUrl + homeNoviceListUrl);

  http.Client().get(uri).then((http.Response response) {
    if (response.statusCode == HttpStatus.ok) {
      print(response.body);
    } else {
      print('请求失败 code 码为${response.statusCode}');
    }
  });
}

void loadData_http_post() async {
  print('------ loadData_http_post --------');

  var headers = Map<String, String>();
  headers["loginSource"] = "IOS";
  headers["useVersion"] = "3.1.0";
  headers["isEncoded"] = "1";
  headers["bundleId"] = "com.nongfadai.iospro";
  headers["loginSource"] = "IOS";
  headers["Content\-Type"] = "application/json";

  Map params = {'currentPage': '1'};
  // 嵌套两层都可以，但是具体哪个好还有待确认？？？？
  var jsonParams = utf8.encode(json.encode(params));
  // var jsonParams = json.encode(params);

  var httpClient = http.Client();

  var uri = Uri.parse(njqbaseUrl + homeNoviceListUrl);

  http.Response response =
  await httpClient.post(uri, body: jsonParams, headers: headers);

  if (response.statusCode == HttpStatus.ok) {
    print(response.body);
  } else {
    print('请求失败 code 码${response.statusCode}');
  }
}

void loadData_http_post_convenience() async {
  print('------ loadData_http_post --------');

  var headers = Map<String, String>();
  headers["loginSource"] = "IOS";
  headers["useVersion"] = "3.1.0";
  headers["isEncoded"] = "1";
  headers["bundleId"] = "com.nongfadai.iospro";
  headers["loginSource"] = "IOS";
  headers["Content\-Type"] = "application/json";

  Map params = {'currentPage': '1'};
  var jsonParams = utf8.encode(json.encode(params));

  var httpClient = http.Client();

  var url = njqbaseUrl + homeRegularListUrl;

  httpClient.post(url, body: jsonParams, headers: headers).then((response) {
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
  }).whenComplete(httpClient.close);
}
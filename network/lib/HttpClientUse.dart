import 'dart:convert';
import 'dart:io';
void loadData_sys_get() async {
  // 1.创建一个HttpClient
  var httpClient = new HttpClient();
  var _content;
  // 设置请求携带参数
  var uri = Uri.parse("https://apis.juhe.cn" + "/mobile/get?phone=13429667914&key=51b72b559e4dbb9f713ddd3e17ffee52");
  // 2. 打开Http连接，设置请求头，在这一步中，可以设置任意的的请求方法，比如 Get 请求、Post 请求、Delete 请求。
  HttpClientRequest request = await httpClient.getUrl(uri);
  print(request.uri);
  // 设置请求的 header
  request.headers.add("Content-Type", "application/json");

  // 3.等待连接服务器
  var response = await request.close();

  // 4.读取响应内容
  if (response.statusCode == HttpStatus.ok) {
    _content = await response.transform(Utf8Decoder()).join();
  }

  print(_content);
  // 5.断开连接
  httpClient.close();
}

void loadData_sys_post() async {
  print('------loadData_sys_post--------');

  HttpClient httpClient = new HttpClient();

  var url = "https://apis.juhe.cn/mobile/get?phone=13429667914&key=51b72b559e4dbb9f713ddd3e17ffee52";
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));


  HttpClientResponse response = await request.close();
  String responseBody = await response.transform(utf8.decoder).join();
  if (response.statusCode == HttpStatus.ok) {
    print('请求成功');
    print(response.headers);
    print(responseBody);
  }
}
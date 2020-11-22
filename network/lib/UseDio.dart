import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'service.dart';
void loadData_dio_get() async {
    var headers = Map<String, String>();
    headers['loginSource'] = 'IOS';
    headers['useVersion'] = '3.1.0';
    headers['isEncoded'] = '1';
    headers['bundleId'] = 'com.nongfadai.iospro';
    headers['Content-Type'] = 'application/json';

    Dio dio = Dio();
    dio.options.headers.addAll(headers);
    dio.options.baseUrl = njqbaseUrl;

    Response response = await dio.get(homeNoviceListUrl);

    if (response.statusCode == HttpStatus.ok) {
      print(response.headers);
      print(response.data);
    }
  }
  void loadData_dio_dioOfOptionsSetting() async {
    print(
        ' \n post请求 ======================= 开始请求 =======================\n');
    var headers = Map<String, String>();
    headers['loginSource'] = 'IOS';
    headers['useVersion'] = '3.1.0';
    headers['isEncoded'] = '1';
    headers['bundleId'] = 'com.nongfadai.iospro';
    headers['Content-Type'] = 'application/json';

    Dio dio = Dio();
    dio.options.baseUrl = njqbaseUrl;
    dio.options.connectTimeout = 60000;
    dio.options.receiveTimeout = 60000;
    dio.options.headers.addAll(headers);
    dio.options.method = 'post';

    Options option = Options(method: 'post');
    // Response response = await dio.request(homeRegularListUrl,
    //     data: {"currentPage": "1"}, options: option);

    Response response = await dio.post(homeRegularListUrl,
        data: {"currentPage": "1"}, options: option);

    if (response.statusCode == HttpStatus.ok) {
      print('请求参数： ${response.request.headers}');
      print(
          '-------------------请求成功,请求结果如下:-----------------\n \n===请求求url: ${response.request.uri.toString()} \n \n===请求 ���:   \n${response.headers} \n \n===请求结果: \n${response.data}\n');
      print('-------------------请求成功,请求结果打印完毕----------------');
    } else {
      print('请求失败');
    }
  }

  // dio - 方式二（baseUrl都是在dio.option.baseUrl设置的）
  // 在新建的option上设置请求头参数
  void loadData_dio_newOptionSetting() async {
    print(' \n======================= 开始请求 =======================\n');
    var headers = Map<String, String>();
    headers['loginSource'] = 'IOS';
    headers['useVersion'] = '3.1.0';
    headers['isEncoded'] = '1';
    headers['bundleId'] = 'com.nongfadai.iospro';
    headers['Content-Type'] = 'application/json';

    Options option = Options(method: 'post');
    option.connectTimeout = 60000;
    option.receiveTimeout = 60000;
    option.headers.addAll(headers);

    Dio dio = Dio();
    dio.options.baseUrl = njqbaseUrl;

    Response response = await dio.post(homeRegularListUrl,
        data: {"currentPage": 1}, options: option);
    // Response response = await dio.request(homeRegularListUrl,
    // data: {"currentPage": 1}, options: option);

    if (response.statusCode == HttpStatus.ok) {
      print('请求参数： ${response.request.headers}');
      print(
          '-------------------请求成功,请求结果如下:-----------------\n \n===请求url: ${response.request.baseUrl.toString()} \n \n===请求 头:   \n${response.headers} \n \n===请求结果: \n${response.data}\n');
      print('-------------------请求成功,请求结果打印完毕----------------');
    } else {
      print('请求失败');
    }
  }
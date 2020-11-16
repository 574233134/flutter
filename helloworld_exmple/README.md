# 使用plugin的方式调用原生内容

## 一、新建plugin

### 命令行
具体参数设置可参考[flutter 文档](https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms)

例：
```
 flutter create --org com.example.nativeapi --template=plugin --platforms=android,ios -i objc native_api
```
该命令会在插件下自动创建好ios 及 android 目录
![截屏2020-10-29 20.16.08.png](https://upload-images.jianshu.io/upload_images/11615710-af0ec78a58da90fd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#  二、增加方法

默认创建的文件如下
```
class Nativeapi {
  static const MethodChannel _channel =
      const MethodChannel('nativeapi');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
```

可以新增一个打招呼的方法

```
class Nativeapi {
  static const MethodChannel _channel =
      const MethodChannel('nativeapi');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
  static Future<String> hello(name) async {
    final String res = await _channel.invokeMethod('hello', name);
    return res;
  }
}
```


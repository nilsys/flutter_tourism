
#### 一、创建独立的plugin
```
flutter create --template=plugin --platforms=android,ios -i swift -a java 插件名

// 参数说明
--template=plugin：创建插件包
--platforms=android,ios：指定平台(不指定平台，不会生成IOS、Android文件夹)
-i objc -a java：指定ios和安卓的语言
```

#### 二、本地引用plugin
- 1、在与images文件夹同级目录，创建一个plugins文件夹
- 2、将创建好的plugin拷贝进plugins文件夹中
- 3、pubspec.yaml导入依赖
```
dependencies:
  flutter:
    sdk: flutter
  plugin_cslog:
    path: plugins/plugin_cslog
```
- 4、引用(头文件引入的方式)
```
import 'package:plugin_cslog/plugin_cslog.dart';
```

#### 三、复杂的可参考
- https://github.com/OpenFlutter/fluwx

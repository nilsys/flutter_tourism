#### 生成模型文件
##### 一、使用json_annotation
- 1、https://github.com/DevYao/JSONConverter
- 2、引用依赖
```
dependencies:
  flutter:
    sdk: flutter
  json_annotation: ^3.0.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  # flutter packages pub run build_runner build
  build_runner: ^1.6.1
  json_serializable: ^3.0.0
```

- 3、执行命令生成xx.g.dart文件
```
// 生成
flutter packages pub run build_runner build

//清除之前生成的文件，如果直接运行下面的不行。可以先尝试运行这个
 flutter packages pub run build_runner clean
//可以直接运行这个
 flutter packages pub run build_runner build --delete-conflicting-outputs
```

##### 二、使用jsontodart
- https://gitee.com/aiwoba/JsonToDart

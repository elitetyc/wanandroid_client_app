# wanandroid_client_app
使用flutter开发玩安卓客户端
#打包步骤
- 创建一个自己的安卓Key
- 修改android/key.properties文件
```properties
storePassword=存储密码
keyPassword=你的key的密码
keyAlias=key别名
storeFile=key在你电脑上的地址
```
- 修改android/app/build.gradle
    - 加载key
    ```groovy
    def keystorePropertiesFile = rootProject.file("key.properties")
    def keystoreProperties = new Properties()
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
    
    ```
    - 设置变量
    ```groovy
    android{
          signingConfigs {
                  release {
                      keyAlias keystoreProperties['keyAlias']
                      keyPassword keystoreProperties['keyPassword']
                      storeFile file(keystoreProperties['storeFile'])
                      storePassword keystoreProperties['storePassword']
                  }
          }
        
          buildTypes {
                  release {
                      signingConfig signingConfigs.release
                  }
          }
    }

    ```
 - 打开当前flutter项目终端，在根目录下运行:flutter build apk
 ```
 ➜  wanandroid_client_app git:(master) ✗ flutter build apk
 You are building a fat APK that includes binaries for android-arm, android-arm64, android-x64.
 If you are deploying the app to the Play Store, it's recommended to use app bundles or split the APK to reduce the APK size.
     To generate an app bundle, run:
         flutter build appbundle --target-platform android-arm,android-arm64,android-x64
         Learn more on: https://developer.android.com/guide/app-bundle
     To split the APKs per ABI, run:
         flutter build apk --target-platform android-arm,android-arm64,android-x64 --split-per-abi
         Learn more on:  https://developer.android.com/studio/build/configure-apk-splits#configure-abi-split
 Initializing gradle...                                              1.4s
 Resolving dependencies...                                           2.8s

 ```
 直到出现
 ```
 Running Gradle task 'assembleRelease'...                                                                           
 Running Gradle task 'assembleRelease'... Done                     205.6s (!)
 Built build/app/outputs/apk/release/app-release.apk (19.2MB).

 ```
 就表示打包成功了，build/app/outputs/apk/release/app-release.apk这个是apk的路径
 

# 示例项目

通过示例项目可以编写基础功能，用于编写和测试模板（base-generator）功能。

最终还会通过示例项目的结构，生成项目原型（archetype），通过原型可以快速创建类似 sample 项目的结构和基础配置。

利用 sample-service 中配置的代码生成器可以快速的生成基础代码，以最快的速度看到一个可以进行符合项目要求的完整的各部分代码。

## 特别说明

这个项目中没有直接提供现成的代码可用。

你可以按照下面的步骤生成代码后配合 [web](https://github.com/guozilanTK/web) 项目查看效果。

### 改配置

修改 service 模块 src/test/resources 下面的 generatorConfig.xml 配置。

主要修改数据库连接和用户密码，然后修改下面 `<table>` ，改为自己需要的表即可。

### 运行

改好代码生成器配置后，在 service 模块中执行命令（`mvn mybatis-generator:generate`），或者 IDEA 点击如下图所示插件：

![generator](https://user-images.githubusercontent.com/1787798/43685026-fdb19dc0-98dd-11e8-9be3-8169643a7500.png)

执行后即可生成针对单表的多个代码文件。

### 执行日志

执行的部分日志如下：

```
[INFO] Introspecting table country
[INFO] Generating Record class for table country
[INFO] Saving file Country.java
[INFO] Saving file CountryService.java
[INFO] Saving file CountryServiceImpl.java
[INFO] Saving file CountryMapper.java
[INFO] Saving file CountryMapper.xml
[INFO] Saving file CountryController.java
[INFO] Saving file country-main.jsp
[WARNING] 没有配置 "templateFormatterClass" 模板处理器，使用默认的处理器!
[WARNING] 没有配置 "templateFormatterClass" 模板处理器，使用默认的处理器!
[WARNING] 没有配置 "templateFormatterClass" 模板处理器，使用默认的处理器!
[WARNING] 没有配置 "templateFormatterClass" 模板处理器，使用默认的处理器!
[WARNING] 没有配置 "templateFormatterClass" 模板处理器，使用默认的处理器!
[WARNING] 没有配置 "templateFormatterClass" 模板处理器，使用默认的处理器!
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 1.326 s
[INFO] Finished at: 2018-08-05T18:35:23+08:00
[INFO] Final Memory: 15M/215M
[INFO] ------------------------------------------------------------------------
```

### 生成的文件

所有文件都会生成到指定的目录中，如下图所示：

![file-generator](https://user-images.githubusercontent.com/1787798/43685055-7cf71f60-98de-11e8-81b3-cc5c91632d38.png)

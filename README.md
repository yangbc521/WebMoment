# WebMoment
模拟微信的公众号
跟之前的WebChat的内容接近，不过UI使用了MDUI，而不是bootstrap
使用Java的JSP以及Servlet实现，持久层使用MyBatis，使用Maven进行项目管理
## 导入数据
- 使用webmoment.sql创建所需要的数据库、表
- 修改`webmoment\src\main\resources`目录下的dbconfig.properties中对应的数据库的信息
## 项目使用
由于没有进行打包处理（目前还不懂），你可以使用target中已经编译好的内容，也可以使用源代码进行编译

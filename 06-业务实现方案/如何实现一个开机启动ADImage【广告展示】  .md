### 如何实现一个开机启动ADImage【广告展示】  

 获取展示图片信息的API设计为`+(NSDictionary)loadADImage` 字典中返回的是关于展示图片的信息  {1：图片缓存的本地地址，2：是否需要打开远程链接，3：远程连接地址...}  
 
`loadADImage`中需要做以下几个步骤：  

+ 根据产品规则从本地数据库表中获取展示广告页的信息，如果没有需要设置默认显示
+ 网络请求最新需要展示的图片组合信息
+ 筛选出需要下载的网络图片资源
+ 图片下载完毕需要更新本地数据库中的存储信息
+ 过期信息的删除操作


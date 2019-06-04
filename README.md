# fos
电影网站web开发小组

## 建议开发环境

>操作系统：**windows 10 64bit** 
_（这个应该都没有问题，Mac的话也可以）_

>开发工具：**IDEA+VSCODE**
_(面的idea太好用了，最好不要用myescplice，两个工程混合时候会出错，VSCODE主要是写静态页面的预览，不过你也可以换成其他的，看个人)_

>数据库：
**Redis**
_（没听过可以去看一下 非关系型数据库 用来做缓存减轻数据库压力）_
**MySql 5.5.53** 
_（因为我是集成环境phpstudy上的，版本稍微老一点，可以比我新）_

>开发框架：

### 前端
layui框架 
jquery 
还有第三方css动画库

### 后端
web工程架构：maven（实现包依赖管理）<br/>
Spring +SpringMvc+Mybatis（版本无需纠结，我在pom文件中已经写好）<br/>
GUNS+Mybatis plus(基于Spring boot 2.0的一个微服务框架，用来做后台管理特别好用)

### 之后的部署
我想在云端部署，也方便我们展示 部署可能会采用docker+NGINX 或者k8s 做分布式部署maybe待定

# 注意事项
**1.任何人在提交代码时候不允许推送到master分支（需要我审核）**<br>
**2.推送前建立自己的分支，如我的名字三个字母简写fjq**<br>
**3.每次commit需要按照以下格式书写： 提交人姓名 提交内容梗概（例如：xxx(你的名字) 主要完成了登录界面)**<br>
**4.请每次查看此文件的更新日志，每个人必须写的模板如下**<br>
## 更新模板
_2019.5.18_(此为日期)
### 更新人：你的名字+分支
### 版本：1.0（大版本修改才增加十分位，否则都是增加百分位）
### 更新模块：
### 更新内容：详情说明更新内容
### 是否有bug和疑问：


# 更新日志
_2019.5.18_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>1.0
### 更新模块：
>注册模块
### 更新内容：
>完成注册模块后台开发，支持完整的所有信息的插入和图片上传，<br>其他开发人员需要注意在测试是需要修改com.util包下的PathUtil类下basePath，此路径为winodow上本地tomcat路径你也可以自行修改到别的路径,<br>完成前端的表单校验和小的样式修改
### 是否有bug和疑问：
>有，存在bug 目前bug属于前端 是存在校验数据不符合后还是继续会提交表单 暂时我没想到好的方法和layui本身有关 需要我再想想

**=======================**
# 更新日志
_2019.5.19_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>1.11
### 更新模块：
>注册模块
### 更新内容：
>对于昨日bug修复，完成注册模块前端完整性校验各种输入项完整性和注册样式
### 是否有bug和疑问：
>有，存在bug 目前bug属于前端 是存在表单二次提交的问题 一次提交会出现两次插入属于ajax回调两次问题 正在想办法解决
**=======================**
# 更新日志
_2019.5.19_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>1.12
### 更新模块：
>注册模块
### 更新内容：
>对于昨日bug修复，完成注册模块前端完整性校验各种输入项完整性和注册样式
### 是否有bug和疑问：
>有，存在bug 目前bug属于后端 是存在创建用户图片目录获取不到用户id 但是sql语句部分确认写法没错 待修复
**=======================**
# 更新日志
_2019.5.19_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>1.121
### 更新模块：
>注册模块
### 更新内容：
>更正了github上类混乱的问题，增加了注册界面输入框提示功能和插入完整路径bug，完成登录的dao层
### 是否有bug和疑问：
>暂无
**=======================**
# 更新日志
_2019.5.22_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>1.2
### 更新模块：
>注册模块，登录模块
### 更新内容：
>更正了注册后台模块逻辑处理，重新封装了json类（之前逻辑有点混乱，现在清晰了），增加了登录模块，支持手机邮箱用户名三种方式登录，前端登录界面反馈交互的实现，解决了图片本地化显示的问题，主页开始规划
### 是否有bug和疑问：
>暂无
**=======================**
# 更新日志
_2019.5.23_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>1.21
### 更新模块：
>注册模块，登录模块，用户中心
### 更新内容：
>更新了前端md5加密，更新了用户中心页面
### 是否有bug和疑问：
>暂无
**=======================**
# 更新日志
_2019.5.23_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>1.22
### 更新模块：
>用户中心，修改资料页面
### 更新内容：
>更新了用户中心页面，更新了修改页面，增加了修改信息controller 和修改头像controller
### 是否有bug和疑问：
>还没有测试
**=======================**
# 更新日志
_2019.5.23_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>1.21
### 更新模块：
>注册模块，登录模块，用户中心
### 更新内容：
>更新了前端md5加密，更新了用户中心页面
### 是否有bug和疑问：
>暂无
**=======================**
# 更新日志
_2019.5.26_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>1.3
### 更新模块：
>修改资料页面
### 更新内容：
>，更新了修改页面，增加了修改信息 和修改头像头像更能，增加注册校验功能，优化了登录注册界面提示框飞速弹出消失问题
### 是否有bug和疑问：
>有 注册校验还是有bug
**=======================**
# 更新日志
_2019.5.26_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>1.4
### 更新模块：
>注册，登录，用户中心，用户密码修改，信息修改界面模块基本已经定型
### 更新内容：
>用户模块已经更新完毕，功能齐全，包括登录注册，用户中心，用户信息修改，用户密码修改，用户头像修改
### 是否有bug和疑问：
>暂无 大家基于1.4开展测试 有问题反馈
**=======================**
# 更新日志
_2019.5.27_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>1.41
### 更新模块：
>404界面
### 更新内容：
>增加了404界面，优化了动画跳转时间
### 是否有bug和疑问：
>暂无
**=======================**
# 更新日志
_2019.5.28_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>1.42
### 更新模块：
>登录模块
### 更新内容：
>增加了token校验，增加了拦截器
### 是否有bug和疑问：
>目前处于后端接口token都没有问题，前端请求还没有写完，所以更新完不建议立刻覆盖
**=======================**
# 更新日志
_2019.5.29_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>1.43
### 更新模块：
>登录模块
### 更新内容：
>优化了controller代码 封装了一些方法
### 是否有bug和疑问：
>目前处于后端接口token都没有问题，前端请求还没有写完，所以更新完不建议立刻覆盖
**=======================**
# 更新日志
_2019.5.30_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>1.44
### 更新模块：
>登录模块
### 更新内容：
>解决了token验证问题 ，版本稳定 增加了电影库页面
### 是否有bug和疑问：
>暂无
**=======================**
# 更新日志
_2019.5.31_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>1.45
### 更新模块：
>增加电影库后端接口
### 更新内容：
>版本稳定 
### 是否有bug和疑问：
>电影库页面的人出来背锅 ，写的合并上去全是乱码
**=======================**
# 更新日志
_2019.5.31_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>1.45
### 更新模块：
>增加电影库后端接口，数据库结构重构
### 更新内容：
>版本稳定，数据库文件 
### 是否有bug和疑问：
>电影库页面的人出来背锅 ，写的合并上去全是乱码
**=======================**
# 更新日志
_2019.6.1_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>1.6
### 更新模块：
>数据库，电影库页面，个人中心，电影详情
### 更新内容：
>数据库文件，电影库页面前后端，个人中心我的影评查询更新前后端，电影详情更新后端 
### 是否有bug和疑问：
>电影详情定位不到，其他功能稳定，有个fos-resource文件夹 放在d盘下即可对接相应资源
**=======================**
# 更新日志
_2019.6.1_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>2.0
### 更新模块：
>数据库，电影库页面前后端，个人中心前后端，电影详情前后端
### 更新内容：
>数据库文件，电影库页面前后端，个人中心前后端，电影详情前后端，解决了电影库定位出错问题，解决了电影详情无法定位问题，优化了查询 
### 是否有bug和疑问：
>暂无
**=======================**
# 更新日志
_2019.6.3_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>2.1
### 更新模块：
>数据库，新闻列表前后端，新闻详情前后端，电影详情前端
### 更新内容：
>数据库文件，新闻列表前后端，新闻详情前后端，电影详情前端样式变化， 
### 是否有bug和疑问：
>业务逻辑问题 明天解决
**=======================**
# 更新日志
_2019.6.4_(此为日期)
### 更新人：
>付佳琦+master
### 版本：
>2.2
### 更新模块：
>数据库，他人中心，各界面样式修改
### 更新内容：
>数据库文件，他人中心前后端，增加其他界面的动画和位置样式修改 
### 是否有bug和疑问：
>暂无

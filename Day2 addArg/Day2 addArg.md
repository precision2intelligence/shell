# Day2-Add arguments to shell
## 1 题目描述
> 假设存在一个shell脚本provider.sh
然后让你写一个shell支持这么几个参数
1、provider.sh  -h/help 提示provider的使用方法
2、provider.sh --entrypoint/-e xxx.xxx.xx.xx  server start
3、provider.sh server stop

## 2 设计思路
### 2.1 位置参数的判断
位置参数存在以下几种情况：

- 无位置参数
执行`server stop`操作
- 位置参数错误
提示查看帮助文档
- 位置参数包含于`--help/-h/--entrypoint/-e`
跳转到对应操作

### 2.2 IP地址校验
IP地址输入存在以下几种情况：

- 输入`--entrypoint/-e`但是没有输入IP地址
提示输入后校验
- 输入的IP地址正确
启动服务（脚本中以`echo`命令代替启动）
- 输入的IP地址错误
判断错误类型（字节数超过255或其它错误）——>提示重新输入——>再次校验直至成功——>启动服务

## 3 解答
完整代码见同级目录下的`provider.sh`

## 4 关键知识点
1. shell中无`do……while`用法，要自行转化
2. if条件语句的使用
3. 赋值操作等号两边不能有空格
4. shell中函数的定义及调用

## 5 参考
1. [if用法总结](https://www.cnblogs.com/qianjinyan/p/9013810.html)
2. [IP校验1](http://itwhat.cn/?id=25)，[IP校验2](http://www.voidcn.com/article/p-wmavktdz-hr.html)
3. [do……while转化](https://stackoverflow.com/questions/16489809/emulating-a-do-while-loop-in-bash)

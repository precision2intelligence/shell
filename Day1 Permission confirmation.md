# Day1-Permission confirmation
## 题目描述
> 在一个非root用户下，判断/var/lib/rancher/k3s/agent/images/这个目录该用户有拷贝的权限.
如果没有权限，输出一个提示，/var/lib/rancher/k3s/agent/images/该用户没有权限写入;如果有写入权限，则创建一个hello文件，里面有world这5个字母，然后输出用户xx对/var/lib/rancher/k3s/agent/images/有写入权限。

## 解答
```bash
#!/bin/bash

# 前面不要cd，因为可能某一级目录没有，都需要返回没有权限的提示
if test -w /var/lib/rancher/k3s/agent/images

then
        touch hello
        echo "world" > hello
        echo "${USER}, Congratulations!"
else
        echo "Sorry, ${USER} permission denied!"
fi
```

## 关键知识点
- Shell test 命令用法，`-w`参数表示如果文件存在且可写则为真。
- `$USER`获取当前用户名。

## 易错点
题目的意思应该是对`/var/lib/rancher/k3s/agent/images/`目录有写入权限然后写入**该目录**，故在开始要`cd`进入该目录。

## 参考
[Shell test 命令用法](https://www.runoob.com/linux/linux-shell-test.html)
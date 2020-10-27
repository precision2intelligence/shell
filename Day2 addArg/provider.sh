#! /bin/bash
checkip() {
        if echo $1 |egrep -q '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$' ; then
                a=`echo $1 | awk -F. '{print $1}'`
                b=`echo $1 | awk -F. '{print $2}'`
                c=`echo $1 | awk -F. '{print $3}'`
                d=`echo $1 | awk -F. '{print $4}'`
                for n in $a $b $c $d; do
                        if [ $n -ge 255 ] || [ $n -le 0 ]; then
                                echo "the number of the IP should less than 255 and greate than 0"

                                return 2
                        fi
                done
        else
                echo "The IP you input is something wrong, the format is like 192.168.100.1"
                return 1
        fi
}

if [[ $1 = "--help" ]] || [[ $1 = "-h" ]]
then
    echo "*******这里是一个帮助说明*******"
    echo "帮助说明介绍provider的用途和使用方法"
    echo " --help/-h   获取帮助"
    echo " --entrypoint/-e   启动服务"
    echo " with no args    停止服务"
    echo " Have fun! "
    # exit 0
fi


if [[ $1 = "--entrypoint" ]] || [[ $1 = "-e" ]]
then
    if  [ ! -n "$2" ] ;then
        read -p  "Please input the ip:" ip
    else 
        ip=$2 #赋值不能有空格
    fi

    rs=1
    checkip $ip
    rs=`echo $?`
    
    while [ $rs -gt 0 ]; do
        read -p  "Please input the ip:" ip
        rs=1
        checkip $ip
        rs=`echo $?`
    done

    echo "The IP is right!"
    echo "Server start"
    exit

fi

if  [ ! -n "$1" ] ;then
    echo "Server stop"
fi

if [[ $1 != "--entrypoint" ]] && [[ $1 != "-e" ]] &&
   [[ $1 != "--help" ]] && [[ $1 != "-h" ]] && [ -n "$1" ];
then
    echo "Arguments Error!!!"
    echo "Please use --help or -h to get help information!"
fi
#!/bin/bash

if [ x$1 != x ]; then

    if [ `echo $1 |grep /` ]; then
        name=${1%?}
    else
        name=$1
    fi
    echo $name
    path=`pwd`
    date=`date +%Y-%m-%dT%H:%M:%S`
    trashpath=/home/liupy525/.Trash
    
    name_new=$name
    if [ -f $trashpath/files/$name ]; then
        name_new=$name.`date +%Y-%m-%dT%H-%M-%S`
    fi
    
    if [ -d $trashpath/files/$name ]; then
        name_new=$name.`date +%Y-%m-%dT%H-%M-%S`
        echo $name_new
    fi
    
    mv $1 $trashpath/files/$name_new
    echo "[Trash Info]" > $trashpath/info/$name_new.trashinfo
    echo "Path=$path/$name" >> $trashpath/info/$name_new.trashinfo
    echo "DeletionDate=$date" >> $trashpath/info/$name_new.trashinfo
else
    echo "缺少参数！"
fi

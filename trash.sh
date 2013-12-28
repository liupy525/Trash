#!/bin/bash

if [ x$1 != x ]; then
    name=$1
    path=`pwd`
    date=`date +%Y-%m-%dT%H:%M:%S`
    trashpath=/home/liupy525/.Trash
    
    if [ -f $trashpath/files/$1 ]; then
        name=$1.`date +%Y-%m-%dT%H-%M-%S`
    fi
    
    if [ -d $trashpath/files/$1 ]; then
        name=$1.`date +%Y-%m-%dT%H-%M-%S`
    fi
    
    mv $1 $trashpath/files/$name
    echo "[Trash Info]" > $trashpath/info/$name.trashinfo
    echo "Path=$path/$1" >> $trashpath/info/$name.trashinfo
    echo "DeletionDate=$date" >> $trashpath/info/$name.trashinfo
else
    echo "缺少参数！"
fi

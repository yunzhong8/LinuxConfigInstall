#! /bin/bash
#
# remove_c_lib.sh
# Copyright (C) 2024 zzq <zzq@zzq-HP-Pavilion-Gaming-Laptop-15-cx0xxx>
#
# Distributed under terms of the MIT license.
#
echo "
*************************************************************************
脚本基本功能：                                                          *
脚本使用：                                                              *\n
eg：                                                                    *
    1.                                                                  *
    解释：                                                              *
    2.                                                                  *\n
其他信息：                                                              *
*************************************************************************\n"
parameter_names=(1 2 3 4 5 6) #输入参数的名称列表
parameter_num=6
#检测参数是否正确传入
for i in $(seq 1 $parameter_num)
do
    if [ -z ${!i}  ];then # $i是空则输出
        echo "${parameter_names[$i]}:未输入，终止脚本执行"
        exit 1
    else
        echo "${parameter_names[$i]}:${!i}"
    fi
done

# 删除libelf-dev的C语言库函数
sudo apt remove libelf-dev


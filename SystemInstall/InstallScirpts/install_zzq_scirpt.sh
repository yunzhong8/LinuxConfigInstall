#! /bin/bash
#
# install_c_lib.sh
# Copyright (C) 2024 zzq <zzq@zzq-HP-Pavilion-Gaming-Laptop-15-cx0xxx>
#
# Distributed under terms of the MIT license.
#
echo "
*************************************************************************
脚本基本功能：   ysyx的配置文件                                          *
脚本使用：                                                              *\n
eg：                                                                    *
    1.                                                                  *
    解释：                                                              *
    2.                                                                  *\n
其他信息：                                                              *
*************************************************************************\n"
parameter_names=(1 2 3 4 5 6)
parameter_num=0
 #输入参数的名称列表

#检测参数是否正确传入
for i in  $(seq 1 $parameter_names)
do
    if [ -z ${!i}  ];then # $i是空则输出
        echo "${parameter_names[$i]}:未输入，终止脚本执行"
        exit 1
    else
        echo "${parameter_names[$i]}:${!i}"
    fi
done

# 遍历脚本目录下的全部文件，设置文件的权限是可执行

#  EXE_STARDICT_PATH 这个环境变量设置在配置文件中的.mybashrc中
# 将脚本目录下的全部脚本赋予执行全
chmod -R +x $EXE_STARDICT_PATH

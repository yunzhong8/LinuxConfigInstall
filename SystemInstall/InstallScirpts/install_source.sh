#! /bin/bash
#
# general_install.sh
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
set -x
parameter_names=(ubuntu/wsl 2 3 4 5 6) #输入参数的名称列表
parameter_num=1  # 脚本一定需要传入的参数个数
shell_script_path=/home/zzq/Code/Sheel/   # 脚本待调用的脚本的父目录
son_script_path=makefiles  # 待调用的脚本的子目录
call_script_path="$shell_script_path""$son_script_path"


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

#***************配置bushrc***************************
zzq_config_name=.zzq_config
zzq_config_path="\${HOME}/.zzq_config"
zzq_basic_source_config_path="$zzq_config_path""/my_source.list"

linux_source_path=/etc/apt/sources.list


# 设置/etc/apt/source.list中引用我的代码
source_add_code="# 配置文件目录
include $zzq_basic__config_path
"

# # 检查内容是否已经存在于 ~/.bashrc
# if ! grep -qF "$bashrc_add_code" ~/.bashrc; then
#   # 如果不存在，则将内容追加到 ~/.bashrc
#   echo "$bashrc_add_code" >> ~/.bashrc
#   echo "Content added to ~/.bashrc"
# else
#   echo "Content already exists in ~/.bashrc"
# fi

echo "$bashrc_add_code" >> $linux_source_path

sudo apt-get update

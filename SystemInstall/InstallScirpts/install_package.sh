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
parameter_names=(1 2 3 4 5 6) #输入参数的名称列表
parameter_num=0  # 脚本一定需要传入的参数个数
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

# 安装c语言库函数
/bin/bash "$call_script_path/install_c_lib.sh"

# 按照zip解压工具
sudo apt-get install unzip

# 按照网络工具
sudo apt-get install net-tools

# 检查网络速度的工具
sudo apt-get  install nload 

# 安装垃圾站命令
sudo apt-get install trash-cli

# 安装tree命令
sudo apt-get install tree 

# 安装vim命令
sudo apt-get install vim

# 安装curl命令
sudo apt-get install curl

# 安装pdf处理命令
sudo apt-get install poppler-utils 

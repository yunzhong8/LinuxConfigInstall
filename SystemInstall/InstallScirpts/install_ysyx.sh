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
for i in  $(seq 1 $parameter_num)
do
    if [ -z ${!i}  ];then # $i是空则输出
        echo "${parameter_names[$i]}:未输入，终止脚本执行"
        exit 1
    else
        echo "${parameter_names[$i]}:${!i}"
    fi
done

# 安装读取elf文件的库的命令

# PA0 install package
sudo apt-get install build-essential    # build-essential packages, include binary utilities, gcc, make, and so on
sudo apt-get install man                # on-line reference manual
sudo apt-get install gcc-doc            # on-line reference manual for gcc
sudo apt-get install gdb                # GNU debugger
sudo apt-get install git                # revision control system
sudo apt-get install libreadline-dev    # a library used later
sudo apt-get install libsdl2-dev        # a library used later
sudo apt-get install llvm llvm-dev      # llvm project, which contains libraries used later

# 这两个的版本必须大于等于11
#sudo apt-get install llvm-11 llvm-11-dev # only for ubuntu20.04
#sudo apt-get install clang-11 # 只有低于ubuntun20.04需要
sudo apt-get install tmux 

# PA1 
sudo apt-get install ccache

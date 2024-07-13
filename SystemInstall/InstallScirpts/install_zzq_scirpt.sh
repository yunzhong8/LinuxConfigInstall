#! /bin/bash
###
 # @Author: ysyx_22050928-zheng zhong qiang 3486829357@qq.com
 # @Date: 2024-07-13 13:21:19
 # @LastEditors: ysyx_22050928-zheng zhong qiang 3486829357@qq.com
 # @LastEditTime: 2024-07-13 20:09:52
 # @FilePath: /LinuxConfigInstall/SystemInstall/InstallScirpts/install_zzq_scirpt.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
###
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
set -x
parameter_names=(ubuntu/wsl 2 3 4 5 6)
parameter_num=1
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

# 加载用户的环境变量配置文件
source ~/.bashrc  # 或者 source ~/.profile


#  EXE_STARDICT_PATH 这个环境变量设置在配置文件中的.mybashrc中
# 将脚本目录下的全部脚本赋予执行全

chmod -R +x $OVERALL_EXE_BASIC_SCRIPT_PATH

platform=$1


if [ "$platform" = "ubuntu" ]; then
    echo "目前平台是："$platform
    echo $OVERALL_EXE_UBUNTU_SCRIPT_PATH
#    chmod -R +x $OVERALL_EXE_UBUNTU_SCRIPT_PATH
else
    echo "目前平台是："$platform
#    chmod -R +x $OVERALL_EXE_WSL_SCRIPT_PATH
fi

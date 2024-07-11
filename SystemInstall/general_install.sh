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
parameter_num=0 # 脚本一定需要传入的参数个数
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

#************************脚本路径***********************
bashrc_install_script_path=./InstallScirpts/bashrc_install.sh
c_lib_install_srcipt_path=./InstallScirpts/install_c_lib.sh
package_install_script_path=./InstallScirpts/install_package.sh
zzq_shell_script_install_path=./InstallScirpts/install_zzq_scirpt.sh

#***************进行系统配置***************************
# 配置bashrc
/bin/bash $bashrc_install_script_path

# 安装软件包
/bin/bash $c_lib_install_srcipt_path

# 安装c语言库函数
/bin/bash $package_install_script_path


# 配置我自己编写的脚本（只启用通用性强的脚本）
/bin/bash $zzq_shell_script_install_path


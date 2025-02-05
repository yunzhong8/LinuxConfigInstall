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
zzq_basic_bashrc_config_path="$zzq_config_path""/bashrc"
zzq_ubuntu_bashrc_config_path="$zzq_config_path""/bashrc/special_bashrc/ubuntu"
zzq_wsl_bashrc_config_path="$zzq_config_path""/bashrc/special_bashrc/wsl"
zzq_config_repo_path="git@github.com:yunzhong8/ZzqLinuxConfig.git"

if [ -d "$zzq_config_path" ] ;then
	echo "$zzq_config_path"" exit"
	chmod -R 755 "$zzq_config_path"  # 设置文件夹及其内容为普通用户可读写执行
	rm -rf "$zzq_config_path"
fi
#mkdir -p  $zzq_config_path

pushd $HOME #进入用户目录

# 检查pushd命令是否成功
if [ $? -ne 0 ]; then
  echo "Failed to change directory!"
  exit 1
fi

# 从远程仓库中克隆下我的配置仓库，这个配置仓库存放了我的脚本和bashrc配置
git clone $zzq_config_repo_path $zzq_config_name

# 回退到原来的目录
popd

# 设置文件权限为普通用户不能删除
sudo chmod 755 $zzq_config_path

platform=$1

if [ "$platform" = "ubuntu" ]; then
	bashrc_config_code="#这是一个配置bashrc的代码
UBUNTU_SPECIAL_CONFIG=\"true\"
WSL_SPECIAL_CONFIG=\"false\"
"
else
	bashrc_config_code="#这是一个配置bashrc的代码
UBUNTU_SPECIAL_CONFIG=\"false\"
WSL_SPECIAL_CONFIG=\"true\"
"
fi

echo "$bashrc_config_code" >> ~/.bashrc

# 设置bashrc中引用我的代码
bashrc_add_code="# 配置文件目录
CONFIG_DIR=\"$zzq_basic_bashrc_config_path\"

# 导入基本bashrc配置（所有平台通用）
if [ -d \"\$CONFIG_DIR\" ]; then
    for file in "\$CONFIG_DIR"/*.sh; do
        # 检查文件是否存在，避免目录为空时的错误
        if [ -f \"\$file\" ]; then
            source \"\$file\"
        fi
    done
fi


#导入Ubuntu平台的bashrc配置
if [ \"\$UBUNTU_SPECIAL_CONFIG\" = \"true\" ]; then
	UBUNTU_CONFIG_DIR=\"$zzq_ubuntu_bashrc_config_path\"
	# 导入基本bashrc配置（所有平台通用）
	if [ -d \"\$UBUNTU_CONFIG_DIR\" ]; then
	    for file in "\$UBUNTU_CONFIG_DIR"/*.sh; do
	        # 检查文件是否存在，避免目录为空时的错误
	        if [ -f \"\$file\" ]; then
	            source \"\$file\"
	        fi
	    done
	fi
fi


#导入WSL平台的bashrc配置
if [ \"\$WSL_SPECIAL_CONFIG\" = \"true\" ]; then
	WSL_CONFIG_DIR=\"$zzq_wsl_bashrc_config_path\"
	# 导入基本bashrc配置（所有平台通用）
	if [ -d \"\$WSL_CONFIG_DIR\" ]; then
	    for file in "\$UBUNTU_CONFIG_DIR"/*.sh; do
	        # 检查文件是否存在，避免目录为空时的错误
	        if [ -f \"\$file\" ]; then
	            source \"\$file\"
	        fi
	    done
	fi
fi
"

# # 检查内容是否已经存在于 ~/.bashrc
# if ! grep -qF "$bashrc_add_code" ~/.bashrc; then
#   # 如果不存在，则将内容追加到 ~/.bashrc
#   echo "$bashrc_add_code" >> ~/.bashrc
#   echo "Content added to ~/.bashrc"
# else
#   echo "Content already exists in ~/.bashrc"
# fi
echo "$bashrc_add_code" >> ~/.bashrc
source ${HOME}/.bashrc

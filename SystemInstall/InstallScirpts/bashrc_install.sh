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
for i in $(seq 1 $parameter_names)
do
    if [ -z ${!i}  ];then # $i是空则输出
        echo "${parameter_names[$i]}:未输入，终止脚本执行"
        exit 1
    else
        echo "${parameter_names[$i]}:${!i}"
    fi
done

#***************配置bushrc***************************
zzq_config_name=zzq_config
zzq_config_path="~/"+$zzq_config
zzq_config_repo_path=""

sudo mkdir -p  $zzq_config_path

pushd ~ #进入用户目录

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
sudo chmod 755 ~/zzq_config


# 设置bashrc中引用我的代码

bashrc_add_code="# 配置文件目录
CONFIG_DIR="$zzq_config_path"

# 检查目录是否存在
if [ -d "\$CONFIG_DIR" ]; then
    for file in "\$CONFIG_DIR"/*.sh; do
        # 检查文件是否存在，避免目录为空时的错误
        if [ -f "\$file" ]; then
            source "\$file"
        fi
    done
fi
fi"

# 检查内容是否已经存在于 ~/.bashrc
if ! grep -qF "$bashrc_add_code" ~/.bashrc; then
  # 如果不存在，则将内容追加到 ~/.bashrc
  echo "$bashrc_add_code" >> ~/.bashrc
  echo "Content added to ~/.bashrc"
else
  echo "Content already exists in ~/.bashrc"
fi


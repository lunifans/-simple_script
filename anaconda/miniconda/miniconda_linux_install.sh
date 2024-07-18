echo -e "\033[36m安装 Miniconda3_linux 脚本，作者：Lunifans\033[0m"
echo "请输入miniconda 的安装路径，默认路径为~"
read path
if [ "$path" = "" ]
then
   path="~"
fi

while [ true ]
do
if [ -d "$path" ]||[ "$path" = "~" ]
then
        echo "路径存在"
        break
else
        echo "路径不存在,请更改"
        echo "请输入miniconda 的安装路径，默认路径为~"
        read path
fi
done

path="$path/miniconda3"
path=$(echo "$path" | sed 's#//*#/#g')
echo "miniconda3将会被安装在如下路径:"$path

echo "是否安装，[y/n],默认为不安装"
read flag_install

if [ "$flag_install" = "y" ]
then
        mkdir -p $path
        #官方地址
        #wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $path/miniconda.sh

        #清华镜像
        wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh  -O $path/miniconda.sh
        bash $path/miniconda.sh -b -u -p $path
        $path/bin/conda init bash
        $path/bin/conda init zsh
else
        exit 0
fi

echo -e "\033[36m安装完成!\033[0m"

:<<EOF
这是注释。使用完本脚本后，需要重启终端才能看到(base)。
EOF
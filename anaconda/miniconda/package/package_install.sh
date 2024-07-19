echo -e "\033[36m生物统计的一些 R 包安装脚本，作者：Lunifans\033[0m"
cat << EOF
目前支持 SAIGE 和 GATE
1. SAIGE
2. GATE
使用前请确保已经正确安装了 conda.
EOF
echo "请为你的环境命名，例如 RSAIGE、RSAIGE_v0"
read envName
while true
do
echo "请输入要安装的包(数字或者英文名)"
read packageName
case $packageName in
        1|"SAIGE")
                conda create -n $envName
                path=$(conda info -e |grep $envName)
                arr=(${path/ /})
                path=${arr[${#arr[@]}-1]}
                nohup ./SAIGE_install.sh $path&
                break
                ;;
        2|"GATE")
                conda create -n $envName
                path=$(conda info -e |grep $envName)
                arr=(${path/ /})
                path=${arr[${#arr[@]}-1]}
                nohup ./GATE_install.sh $path&
                break
                ;;
        *)
               echo "暂时不支持安装此包，请重新选择!"
               ;;
esac
done
echo -e "\033[36m请耐心等待安装完成，因为传输速度限制，可能需要一两个小时。\033[0m"
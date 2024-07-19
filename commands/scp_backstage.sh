echo -e "\033[36m将 scp 放到后台的脚本，作者：Lunifans\033[0m"
echo "请输入源文件夹路径"
read sourcePath
echo "请输入用户名@主机名,例如 root@ip地址"
read userAtHost
echo "请输入目标文件夹路径"
read targetPath
ssh-keygen -t rsa
ssh-copy-id $userAtHost
nohup scp -r $sourcePath $userAtHost:$targetPath&
echo -e "\033[36m耐心等待文件传输完毕！\033[0m"
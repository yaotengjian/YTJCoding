#!/bin/bash
#########################################
#Usage:       bash auto_fdisk_lvm.sh
#########################################
# 1. 将硬盘加入LVM，才能创建LVM分区
# 2. 输入相关信息,开始执行分区
# 3. 基于lvm分区结束，格式化，挂载磁盘
#########################################

#默认新申请的机器里面已经安装了lvm，无需进行安装操作。
check_lvm() {
azlvm=$(yum list installed | grep lvm2) # 定义一个名称为azlvm的变量
cdazlvm=$(echo ${#azlvm})    # 定义一个变量为：打印字符串长度
if [ $cdazlvm -lt 1 ]
then
        yum install -y lvm2
        echo "您还没有安装lvm，正在为您安装，请稍后："
else
        echo "lvm 已经安装，无需操作,已经安装的信息为：
    $azlvm"
fi
}
check_lvm

#输入信息查看当前硬盘，分区等情况。
input() {
echo "lv 分区，vg 卷，pv 硬盘"
lsdisk=$(fdisk -l |  awk -F " " '$1=="Disk" {print i++ " | "  $1 " | "  $2 " | " $3 $4}'  | sed s/\://g ) # sed s/\://g  修改冒号为空格
lvs=$(lvs |grep "-" | awk -F " " '{print i++ "  |分区：  " $1 "  |卷： " $2 "  |  "  $4 } ')
echo "
查看硬盘：
$lsdisk
查看所有历史分区：
$lsDiskCatalog
查看当前存在的VG卷,和LV分区如下：
$lvs
"
}
input
#分区操作
start_partition(){
echo "当前是新建LVM卷和挂载新分区"
partition=/app                    # 定义最终挂载的名称
vgname=volume_group               # 定义逻辑卷组的名称
lvname=lvdata                     # 定义逻辑卷的名称
#code='b c d e f g h i j k l m'   # 根据分区的实际情况修改
code='2 3 '
disk=
for i in {2..3}
do
#if [ -z "vda$i" ];then
    echo "start..."
fdisk /dev/vda$i << EOF       # 这里自动化完成了所有分区fdisk的交互步骤
n
p
1


t
8e
w
EOF
#disk="$disk /dev/vd${i}1" # 将所有分区拼起来
disk="$disk /dev/vda${i}"
#fi
done
pvcreate $disk         #创建PV组
vgcreate $vgname $disk #创建VG卷组
lvcreate --name $lvname -l 100%FREE $vgname #创建逻辑卷
#初始化
mkfs.ext4 /dev/$vgname/$lvname
mkdir -p $partition
echo "/dev/$vgname/$lvname  $partition  ext4 noatime,acl,user_xattr  1 2" >> /etc/fstab
#挂载磁盘
mount /dev/$vgname/$lvname $partition
df -h
}
start_partition


#!/bin/bash
# ******************************************************
# Author       : aゞ姚腾建
# Last modified: 2021-09-24 11:25
# Email        : 13992524930@163.com
# blog         : https://github.com/yaotengjian
# Filename     : cat_memory.sh
# Description  :
# ******************************************************


 #proc/meminfo
 #内存申请顺序：free-cache-buffer-swap
memory_use() {
#mem_used='head -2 /proc/meminfo |awk 'NR==1{t=$2}NR==2{f=$2;print(t-f)*100/t "%"}''
#cache_used='head -5 /proc/meminfo |awk 'NR==1{t=$2}NR==5{c=$2;print c*100/t "%"}''
#buffer_used='head -4 /proc/meminfo |awk 'NR==1{t=$2}NR==4{b=$2;print b*100/t "%"}''

head -2 /proc/meminfo |awk 'NR==1{t=$2}NR==2{f=$2;print "memory内存使用率：" (t-f)*100/t "%"}'
head -5 /proc/meminfo |awk 'NR==1{t=$2}NR==5{c=$2;print "cache内存使用率：" c*100/t "%"}'
head -4 /proc/meminfo |awk 'NR==1{t=$2}NR==4{b=$2;print "buffer内存使用率：" b*100/t "%"}'



#echo "mem_used: $mem_used"
#echo "chche_used :$cache_used"
#echo "buffer_used :$buffer_used"
}
memory_use

swapoff -a
swapon 

# hwclock --hctosys        hwclock --show
# hwclock --systohc  
cat /etc/sysconfig/clock
date -s 20110303 修改日期
date -s 15:39:11 修改时间

/etc/profile   　注：修改文件后要想马上生效还要运行# source /etc/profile不然只能在下次重进此用户时生效。
在用户目录下的.bash_profile文件中增加变量【对单一用户生效(永久的)】
cat /etc/resolv.conf
en_US.UTF-8：你说英语，你在美国，字符集是utf-8
zh_CN.UTF-8：你说中文，你在中国，字符集是utf-8 
如果你的LANG环境变量是zh_CN.UTF-8，那么系统的菜单、程序的工具栏语言、输入法默认语言就都是中文的。
 
ln -s a b 中的 a 就是源文件，b是链接文件名,其作用是当进入b目录，实际上是链接进入了a目录
删除软链接：   rm -rf  b  注意不是rm -rf  b/
ln  a b 是建立硬链接 
du -sh

netstat -nlpt
 
scp hbase.tar.gz imsrvtest1:/data/
ssh imsrvtest1 "cd /data;tar -zxf /data/hbase.tar.gz"

scp /data/nutch_new/hbasetest.jar imsrvtest1:/data/hbase-0.98.3-hadoop1/lib/;scp /data/nutch_new/hbasetest.jar imsrvtest2:/data/hbase-0.98.3-hadoop1/lib/;scp /data/nutch_new/hbasetest.jar skytest2:/data/hbase-0.98.3-hadoop1/lib/;scp /data/nutch_new/hbasetest.jar skytest1:/data/hbase-0.98.3-hadoop1/lib/;
/data/hbase-0.98.3-hadoop1/bin/stop-hbase.sh
/data/hbase-0.98.3-hadoop1/bin/start-hbase.sh 

./hbase-daemon.sh start regionserver
-Xmx1536m -XX:MaxPermSize=128M

hadoop fs -rm -r -skipTrash /data
hadoop fs -ls -R /hbase






cm:
select dt0(bytes_receive_network_interface_sum)-(dt0(bytes_transmit_network_interface_sum)) where category = CLUSTER and clusterId = $CLUSTERID
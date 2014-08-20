#当程序在你所指定的时间执行后，系统会寄一封信给你，显示该程序执行的内容，若是你不希望收到这样的信，请在每一行空一格之后加上 > /dev/null 2>&1 即可 
# 默认情况下,crontab中执行的日志写在/var/log下,
0 1 11 * * /data/nutch_new/job/localhbase.sh >>/data/nutch_new/job/cron.log 2>&1

export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8" 
mv nohup.out baknohup.out;mv nutchhbase.log baknutchhbase.log;
hadoop fs -rm -r -skipTrash /data;
java -Xmx1024m -jar /data/nutch_new/job/test.urlinsert-1.0.0-jar-with-dependencies.jar --tableInit;
nohup java -jar /data/nutch_new/job/urlidsrv-1.0.0-jar-with-dependencies.jar &
nohup hadoop jar /data/nutch_new/job/apache-nutch-1.7.job org.apache.nutch.wind.WindCrawlHbase /localurl -dir /data -threads 150 -topN 80000 &


export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8" 
mv nohup.out baknohup.out;mv nutchhbase.log baknutchhbase.log;
hadoop fs -rm -r -skipTrash /data;
java -Xmx1024m -jar test.urlinsert-1.0.0-jar-with-dependencies.jar --tableInit;
nohup java -jar urlidsrv-1.0.0-jar-with-dependencies.jar &
nohup hadoop jar apache-nutch-1.7.job org.apache.nutch.wind.WindCrawlHbase /url -dir /data -threads 160 -topN 40000 >nutchhbase.log &




export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8" 
mv nohup.out baknohup.out;mv nutchhbase.log baknutchhbase.log;
#hadoop fs -rm -r -skipTrash /data;
#java -Xmx1024m -jar test.urlinsert-1.0.0-jar-with-dependencies.jar --tableInit;
#nohup java -jar urlidsrv-1.0.0-jar-with-dependencies.jar &
nohup hadoop jar apache-nutch-1.7.job org.apache.nutch.wind.GeneratorHbase -topN 40000 >nutchhbase.log &


export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8" 
mv nohup.out baknohup.out;mv nutchhbase.log baknutchhbase.log;
#hadoop fs -rm -r -skipTrash /data;
#java -Xmx1024m -jar test.urlinsert-1.0.0-jar-with-dependencies.jar --tableInit;
nohup java -jar urlidsrv-1.0.0-jar-with-dependencies.jar &
nohup hadoop jar apache-nutch-1.7.job org.apache.nutch.wind.WindCrawlHbase /topicurl  -dir /datanet -threads 150 -topN 30000  >nutchhbase.log &



# 确认parse，是一个map一个进程，单条记录依次处理，30超时，集群的cpu百分比和parse的map数有关系，4台机器若都有parsemap，则利用率很高。 
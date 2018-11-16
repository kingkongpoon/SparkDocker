FROM centos
MAINTAINER KINGKONG

ENV BUILD_ON 2018-11-11

COPY config /tmp
RUN yum install -y net-tools
RUN yum install -y openssh-server
RUN yum install -y openssh-clients
RUN yum install -y which

RUN mkdir /var/run/sshd

RUN ssh-keygen -A

ADD ./jdk-8u181-linux-x64.tar.gz /usr/local

#ADD ./hadoop-2.8.5.tar.gz /usr/local

ADD ./spark-2.3.0-bin-hadoop2.7.tgz /usr/local

ENV JAVA_HOME /usr/local/jdk1.8.0_181
#ENV HADOOP_HOME /usr/local/hadoop-2.8.5
ENV SPARK_HOME /usr/local/spark-2.3.0-bin-hadoop2.7



ENV PATH $JAVA_HOME/bin:$SPARK_HOME/bin:$PATH


RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa &&\
	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
	chmod 600 ~/.ssh/authorized_keys	
	

	
RUN cp /tmp/ssh_config ~/.ssh/config && \
	cp /tmp/profile /etc/profile && \
	cp /tmp/spark-env.sh $SPARK_HOME/conf/spark-env.sh && \
	cp /tmp/core-site.xml $SPARK_HOME/conf/core-site.xml && \
	cp /tmp/hdfs-site.xml $SPARK_HOME/conf/hdfs-site.xml
	#cp /tmp/slaves $SPARK_HOME/conf/slaves

	
RUN echo $JAVA_HOME
WORKDIR /root



RUN echo "root:123456" | chpasswd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

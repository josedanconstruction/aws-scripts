sudo service sendmail stop
cat << EOF > mongodb-org-3.0.repo
[mongodb-org-3.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2013.03/mongodb-org/3.0/x86_64/
gpgcheck=0
enabled=1
EOF
sudo mv ./mongodb-org-3.0.repo /etc/yum.repos.d/mongodb-org-3.0.repo
sudo yum update
# sudo iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
#sudo iptables -A INPUT -i eth0 -p tcp --dport 8080 -j ACCEPT
sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
#sudo iptables -A INPUT -p tcp -s 127.0.0.1 --dport 8081 -j ACCEPT
#sudo iptables -A INPUT -p tcp --dport 8081 -j DROP
#sudo service iptables save
#sudo service iptables start
#sudo service iptables status
sudo yum install git
sudo wget --no-cookies --header "Cookie: gpw_e24=xxx; oraclelicense=accept-securebackup-cookie;" "http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/jdk-8u152-linux-x64.rpm"
sudo rpm -i jdk-8u152-linux-x64.rpm
export JAVA_HOME=/usr/java/default
sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
sudo yum install -y mongodb-org
mkdir source
cd source
git clone https://github.com/josedanconstruction/spring-backend.git
git clone https://github.com/josedanconstruction/vaadin-frontend.git

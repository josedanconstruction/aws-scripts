export JAVA_HOME=/usr/java/default
sudo service mongod start
cd source
cd vaadin-frontend
git pull
mvn clean install
#avoid taxing memory
mvn spring-boot:run&
cd ../spring-backend
git pull
mvn clean install
mvn spring-boot:run&
#mvn spring-boot:run -Drun.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005"
#jdb -attach 5005
cd ..

#!/bin/sh
echo "[INFO] ʹ��maven������Ŀ������Ŀ¼��ʽ����tomcat��."
echo "[INFO] ��ȷ��Tomcat 6������������conf/tomcat-users.xml������admin�û�."

cd ..
mvn war:exploded tomcat:exploded
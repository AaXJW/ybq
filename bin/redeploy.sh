#!/bin/sh
echo "[INFO] ʹ��maven������Ŀ����Tomcat��ж����Ŀ��Ȼ����Ŀ¼��ʽ���²���Tomcat��."
echo "[INFO] ��ȷ��Tomcat 6������."

cd ..
mvn tomcat:undeploy war:exploded tomcat:exploded

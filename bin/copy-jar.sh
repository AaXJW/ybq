#!/bin/sh
echo "[INFO] ʹ��maven����pom.xml ��������jar��src/main/webapp/WEB-INF/lib"

cd ..
mvn dependency:copy-dependencies
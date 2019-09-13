#!/bin/bash
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
time java -jar framework/ant/ant-launcher.jar -buildfile framework/build.xml -DupdatePublisher=N

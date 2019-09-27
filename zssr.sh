#!/usr/bin/bash

yum -y install expect
wget -N --no-check-certificate https://github.com/ZhuzhuNo3/VPS/raw/master/ssr.sh ; chmod -x ssr.sh
wget -N --no-check-certificate https://github.com/ZhuzhuNo3/VPS/raw/master/ServerSpeederCentOS6.sh ; chmod -x ServerSpeederCentOS6.sh
wget -N --no-check-certificate https://github.com/ZhuzhuNo3/VPS/raw/master/foolssr.sh ; chmod -x foolssr.sh
expect foolssr.sh

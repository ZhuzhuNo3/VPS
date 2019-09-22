
echo -n "Do you wanna install python-3.7.3?y/n:"
read tag
if [ "$tag"x != "y"x ]; then exit
fi
apt-get install build-essential
apt-get install python3-distutils
yum groupinstall "Development Tools"
apt-get install libffi-dev
yum install libffi-devel
wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz
tar -zxvf Python-3.7.3.tgz
yum -y install gcc
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel
yum -y install libffi-devel
cd Python-3.7.3
./configure
make&&make install
ln -s /usr/local/bin/pip3 /usr/bin/pip3
echo "Now you can open python-3.7.3 by commend python3."
echo -n "Do you wanna rename python3 to py?y/n/(or input a name):"
read tag
command -v zsh
Shell="bash"
if [ "$?" = "0" ]; then Shell="zsh"
fi
if [ "$tag"x = "y"x ]; then echo "alias py=python3">>~/."$Shell"rc && source ~/."Shell"rc
elif [ "$tag"x = "n"x || "$tag"x = "x" ]; then exit
else echo "alias py=$tag">>~/."Shell"rc && source ~/."Shell"rc
fi

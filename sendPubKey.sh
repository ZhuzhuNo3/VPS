'''
Pkey = yourPubKey
ssh root@xxx "bash sendPubKey.sh $Pkey"
'''
if test ! -e .ssh;
then mkdir .ssh;
chmod 700 .ssh;
fi;
if test ! -e ".ssh/authorized_keys";
then touch ".ssh/authorized_keys";
chmod 600 ".ssh/authorized_keys";
fi;
echo $1 >> ".ssh/authorized_keys";

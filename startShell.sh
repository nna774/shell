cd /opt;
while true;
 do  TMP=`ps x`;
 echo $TMP | grep "ruby shell.rb" > /dev/null;
 if [ $? -ne 0 ];
   then ruby shell.rb;
 fi;
 sleep 3;
done


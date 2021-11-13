#!/bin/bash
test1(){
        while read line; do
csf -d "$line"
done < ipadd1
}

testi(){
        read -p "Are you sure to blocke these IPs? " -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
then
    test1
else
        exit
fi
                }
echo
PS3="Enter a number":
select brand in wordpressattack xmlrpcattack index.phpattack
do
        case $brand in
        wordpressattack)
grep -s $(date +"%d/%b/%Y:")  /usr/local/apache/domlogs/* | grep wp-login.php |  awk {'print $1,$6,$7'} | sort | uniq -c | sort -n | tail -n 6 > ipadd
cat ipadd
echo
echo
sed 's/,\{0,1\}[^,]*://g' ipadd | exec awk '{print $1}'> ipadd1
echo
echo "###########################################################################################################################################################"
echo
     testi
     ;;

        xmlrpcattack)
grep -s $(date +"%d/%b/%Y:")  /usr/local/apache/domlogs/* | grep xmlrpc |  awk {'print $1,$6,$7'} | sort | uniq -c | sort -n | tail -n 6 > ipadd
cat ipadd
echo
sed 's/,\{0,1\}[^,]*://g' ipadd | exec awk '{print $1}'> ipadd1
echo "###########################################################################################################################################################"
echo
        testi
   ;;
index.phpattack)
                grep -s $(date +"%d/%b/%Y:")  /usr/local/apache/domlogs/* | grep index.php |  awk {'print $1,$6,$7'} | sort | uniq -c | sort -n | tail -n 6 > ipadd
cat ipadd
echo
sed 's/,\{0,1\}[^,]*://g' ipadd | exec awk '{print $1}'> ipadd1
echo
echo "###########################################################################################################################################################"
echo
testi

esac
done

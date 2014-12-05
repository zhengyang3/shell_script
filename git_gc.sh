#!/bin/bash
path_all=$(locate .git/HEAD |grep -v 'repo'|xargs -i dirname {}|xargs -i dirname {}|grep -v '/\.')
max=$(echo $path_all|awk 'END{print NF}') 
i=1
while((${i}<=${max}))
    do
        path_single=$(echo $path_all|awk '{print $'$i'}')
        cd $path_single
        if [ -d dalvik ]&&[ -d frameworks ]&&[ -d libcore ]&&[ -d device ]&&[ -d ndk ];then
            $(echo "==================$i:$path_single" >> ~/logs;date >> ~/logs)
            git gc
        fi
        let "i ++"
    done


#!/bin/bash
cd ~/work/project/i9s_intel/i9s/ww30-4.4.4-release/
patch_whole_all=$(git status -s |grep '.patch$'| awk '{print $2}'| xargs -i dirname {}|sort -u|awk '{print $0}')
max=$(echo $patch_whole_all|awk 'END{print NF}') 
echo $max
i=1
while((${i}<=${max}))
    do
        path_single=$(echo $patch_whole_all|awk '{print $'$i'}')
        echo "======================================================================$i:$path_single"
        cd $path_single
	        for x in *.patch
	          do
                 echo "---------------------------------------------------$x"
	             patch -p1 < $x
	          done
        rm *.patch 
        cd ~/work/project/i9s_intel/i9s/ww30-4.4.4-release/
        let "i ++"
    done

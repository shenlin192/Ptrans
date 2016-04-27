#!/bin/bash
#在运行 .sh 文件时要先cd到其所在目录，然后输入“./文件名.sh”
 for show in ./Test1/5HOMME_21.wav
{	
	echo $show
	dir=`dirname $show`
	base=`basename $show .wav`
	s=$dir/$base

	/usr/bin/java -Xmx2024m -jar ./LIUM_SpkDiarization-8.4.1.jar  --fInputMask=$show --sOutputMask=./segFiles/Test/$base.seg --doCEClustering  ./segFiles/Test/$base
}




#/usr/bin/java -Xmx2024m -jar ./LIUM_SpkDiarization-8.4.1.jar 这一段是不变的
#--fInputMask 后面跟的是输入file的路径
#--sOutputMask 后面跟的是输出file的路径
#/usr/bin/java -Xmx2024m -jar ./LIUM_SpkDiarization-8.4.1.jar  --help 此命令可用于寻找帮助

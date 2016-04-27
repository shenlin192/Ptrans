#!/bin/bash
#calculate MFCC for each files
for show in Train/All/* 
{
	echo $show
	dir=`dirname $show`
	base=`basename $show .wav`

java -Xmx2048m -classpath ./LIUM_SpkDiarization-8.4.1.jar fr.lium.spkDiarization.tools.Wave2FeatureSet  --fInputMask=$show --sInputMask="" --fInputDesc="audio16kHz2sphinx,1:1:0:0:0:0,13,0:0:0" --fOutputMask=./mfcc/$base.mfcc --fOutputDesc="sphinx,1:1:0:0:0:0,13,0:0:0" $base --
}
#--fInputMask 输入文件路径
#--fOutputMask=$dir/$base.mfcc 输出文件的

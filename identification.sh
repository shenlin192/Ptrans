#!/bin/bash

for gmm in ./speakers.gmm/*
{
for show in ./Test1/*
{
dir=`dirname $show`
base=`basename $show .wav`
s=$dir/$base

baseGmm=`basename $gmm .gmm`


	java -Xmx2G -Xms2G -cp ./LIUM_SpkDiarization-8.4.1.jar  fr.lium.spkDiarization.programs.Identification  --sInputMask=./segFiles/Test/$base.seg --fInputMask=$s.wav  --sOutputMask=./identification/$baseGmm.ident$base.seg --fInputDesc="audio16kHz2sphinx,1:3:2:0:0:0,13,1:1:300:4" --tInputMask=$gmm  --sSetLabel=add $gmm
}
}

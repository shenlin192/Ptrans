#!/bin/bash 
for show in ./Train/All/*
{

dir=`dirname $show`
base=`basename $show .wav`
s=$dir/$base
fDesc="audio16kHz2sphinx,1:1:0:0:0:0,13,0:0:0"
echo $base
#copy the ubm for each speaker
java -Xmx2024m -cp LIUM_SpkDiarization-8.4.1.jar fr.lium.spkDiarization.programs.MTrainInit --sInputMask=./segFiles/Train/$base.seg --fInputMask=$s.wav --fInputDesc="audio16kHz2sphinx,1:3:2:0:0:0,13,1:1:300:4"  --emInitMethod=copy --tInputMask=./ubm.gmm/All.gmm --tOutputMask=./speakers.gmm/$base.init.gmm speakers

#train (MAP adaptation, mean only) of each speaker, the diarization file describes the training data of each speaker.
java -Xmx2024m -cp LIUM_SpkDiarization-8.4.1.jar fr.lium.spkDiarization.programs.MTrainMAP --help --sInputMask=./segFiles/Train/$base.seg --fInputMask=$s.wav --fInputDesc="audio16kHz2sphinx,1:3:2:0:0:0,13,1:1:300:4"  --tInputMask=./ubm.gmm/$base.init.gmm --emCtrl=1,5,0.01 --varCtrl=0.01,10.0 --tOutputMask=speakers.gmm/$base.gmm speakers
rai

}

#!/bin/bash

sph= ./TestData/SURUGUE_GRAVE_MATURE_DIALOGUE_4.wav                                                                                                                    
mfcc=./TestData
uem=./TestData

show=`basename $sph .wav`

echo "sphinx: $sph --> ($mfcc, $uem)"

# sphinxBase
sphinx_fe -nist yes -i $sph -o $mfcc 2> /dev/null

#or with the old version
#wave2feat -nist -i $sph -o $mfcc 2> /dev/null

#get the header in a temporary file
sphinx_cepview -d 0 -e 1 -header 1 -f $mfcc 2> tmp_$$.txt

#get the number of computed MFCC vectors
nbf=`cat tmp_$$.txt | grep frames | awk '{print $4;}'`

#make a uem composed of one segment starting at feature 0 with $nbf features                                      
echo "$show 1 0 $nbf U U U 1" > $uem

#remove the temporary file
rm -f tmp_$$.txt

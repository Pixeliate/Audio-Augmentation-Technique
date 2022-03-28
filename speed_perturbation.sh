#!/usr/bin/bash

#Execute this command where you wish directory to be created of synthesized audio

#Add path of file which containg all audio filed
path="/media/speechlab/A2/Shreya/TLT_2021/ETLT2021_CAMBRIDGE_EN_baseline/ETLT2021_ETS_EN/audio/train(GAN)"
#Mention format of your wave file wav,flac ...
format="wav"
#target will be the folder in which audio will be prefix of directory created. Mention which audio it is in either of case[corpus , train . test , dev ] 
target="train_GAN_"
#Add what factor of speed you need to provide. Keeping 1 as original audio 
factor="1.2"
#speed based suffix for folde and Prefix for regenerated audio. 
speed="speed_1_2"

mkdir $target$speed

x=$(find $path -name "*.$format")
#echo "After Replacement:" ${filename//not/aa}
for i in $x; do # Not recommended, will break on whitespace
    #echo $i
    IFS='/'
    read -a o1 <<<"$i" #reading str as an array as tokens separated by IFS
    #echo ${o1[-1]}
    out="$target$speed/$speed$o1"
    sox $i $out speed $factor
    #echo $out
    #break
done

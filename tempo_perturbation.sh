#!/usr/bin/bash

#Execute this command where you wish directory to be created of synthesized audio

#Add path of file which containg all audio filed
path="/media/speechlab/A2/Shreya/TLT_2021/ETLT2021_CAMBRIDGE_EN_baseline/ETLT2021_ETS_EN/audio/train(GAN)"
#Mention format of your wave file wav,flac ...
format="wav"
#target will be the folder in which audio will be prefix of directory created. Mention which audio it is in either of case[corpus , train . test , dev ] 
target="train_GAN_"
#Add what factor of tempo you need to provide. Keeping 1 as original audio 
factor="1.1"
#Tempo based suffix for folde and Prefix for regenerated audio. 
tempo="tempo_1_1"

mkdir $target$tempo

x=$(find $path -name "*.$format")
#echo "After Replacement:" ${filename//not/aa}
for i in $x; do # Not recommended, will break on whitespace
    #echo $i
    IFS='/' 
    read -a o1 <<<"$i" #reading str as an array as tokens separated by IFS
    #echo ${o1[-1]}
    IFS=''
    out="$target$tempo/$tempo${o1[-1]}"
    ffmpeg -i $i -filter:a "atempo=$factor" $out
    echo $out
    break
done

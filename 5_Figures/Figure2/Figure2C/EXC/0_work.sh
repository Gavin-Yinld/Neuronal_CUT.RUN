#!/bin/sh
cd /Figure2/Figure2C/EXC
jar=ChromHMM.jar
segmentfile=EXC_8_segments.bed
inputcoorddir=/Figure2/Figure2C/EXC/mm10.feature/
outputfileprefix=EXC_8
java -jar $jar OverlapEnrichment -f coordlistfile $segmentfile  $inputcoorddir $outputfileprefix




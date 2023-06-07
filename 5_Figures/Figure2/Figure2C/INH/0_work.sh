#!/bin/sh
cd /Figure2/Figure2C/INH
jar=ChromHMM.jar
segmentfile=INH_8_segments.bed
inputcoorddir=/Figure2/Figure2C/INH/mm10.feature/
outputfileprefix=INH_8
java -jar $jar OverlapEnrichment -f coordlistfile $segmentfile  $inputcoorddir $outputfileprefix




cd Figure2/Figure2B
################################################################################################
input=model_8.txt
output=./
jar=ChromHMM.jar  ##  software need to be downloaded
java -jar $jar Reorder -f columnorderingfile -o INH_stateorderingfile $input $output


files="./testData/*.c"
runDir="./testRunData"
codeDir="./testCodeData"

for fp in $files; do
	echo $fp
	file=${fp##*/}
	# take filename.* #echo $file

	filename=${file%.*}
	# take filename #echo $filename

	#param=${filename##*.}# take extension
	#echo $param
	if [ ! -e $runDir ]; then
		mkrunDir $runDir
	fi

	gcc $fp -o ${runDir}/${filename}

	inputData="${codeDir}/${filename}.txt"
	echo $inputData 
	echo $fp >> result.txt
	${runDir}/${filename} < $inputData >> result.txt

done
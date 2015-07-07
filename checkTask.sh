num='t'

while [ ! -e $num ];
do
	echo "Student Number:"
	read num
done

files="./${num}/*.c"
runDir="./${num}RunData"
codeDir="./testCodeData"

result="${num}_result.txt"
if [ -e $result ]; then
	mv $result $result.bak
fi

for fp in $files; do
	echo $fp
	file=${fp##*/}

	filename=${file%.*}
	if [ ! -e $runDir ]; then
		mkrunDir $runDir
	fi

	gcc $fp -o ${runDir}/${filename}

	inputData="${codeDir}/${filename}.txt"
	echo $inputData 
	echo $fp >> $result
	if [ -e ${runDir}/${filename} ]; then
		${runDir}/${filename} < $inputData >> $result
	else
		echo 'File Missing' >> $result
	fi
done
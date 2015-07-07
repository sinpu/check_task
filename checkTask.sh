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
	echo $fp >> ${num}_result.txt
	${runDir}/${filename} < $inputData >> ${num}_result.txt

done
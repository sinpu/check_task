
files="./testData/*.c"
dir="./testRunData"
filename=

for fp in $files; do
	echo $fp
	file=${fp##*/}
	# take filename.*
	#echo $file

	filename=${file%.*}
	# take filename
	#echo $filename

	#param=${filename##*.}
	# take extension
	#echo $param
	if [ ! -e $dir ]; then
		mkdir $dir
	fi

	gcc $fp -o ${dir}/${filename}

	inputData="./testData/${filename}.txt"
	echo $inputData 
	echo $fp >> result.txt
	${dir}/${filename} < $inputData >> result.txt

done

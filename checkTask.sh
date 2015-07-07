
files="./testData/*.c"
for fp in $files; do
	echo $fp
	file=${fp##*/}
	# take filename.*
	echo $file

	filename=${file%.*}
	# take filename
	echo $filename

	#param=${filename##*.}
	# take extension
	#echo $param

	#gcc 
done



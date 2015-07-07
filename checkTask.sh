
files="./testData/*.c"
dir="testRunData"

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
	if [ ! -e $dir ]; then
		mkdir $dir
	fi

	gcc $fp -o ./testRunData/$filename
done





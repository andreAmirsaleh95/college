#!/bin/bash

# Call this script via the following command:
# ./multiCall.sh ./myCmd.sh qwe txt output

numCmdLineArgs=${#}
if ((numCmdLineArgs != 4)); then
	echo "ERROR: Please enter exactly four command line arguments"
	echo "Try entering the following command:"
	echo "./multiCall.sh ./myCmd.sh qwe txt output"

else
	commandArg=${1}
	argSet=${2}
	fileExtension=${3}
	outputFolder=${4}

	# If the output directory doesn't already exist, create it
	if [[ ! -d $outputFolder ]]; then
		mkdir $outputFolder
	fi

	for file in *.$fileExtension; do
		# If the output file has not already been created, then create it
		outfile=$outputFolder/$file.txt
		if [[ ! -f $outfile ]]; then
			touch $outfile
		fi

		for comboLength in $(seq 1 ${#argSet}); do
			# echo "comboLength = $comboLength"
			combos=$(python findAllCombos.py $argSet $comboLength)
			# echo "combos = [$combos]"
			for combo in $combos; do
				$commandArg $combo $file >> $outfile
			done
		done
	done
fi

exit
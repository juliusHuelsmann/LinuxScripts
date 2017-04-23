# This file contains utility scripts for copying around the 
# configuration files of various different tools from one 
# machine to the other

xcp () {
	if [[ $1 -nt $2 ]]
		then 
			cp $1 $2
			echo "Copied successfully $1 to $2."
		else
			echo "Not copied: The file that is to be overwritten is newer than the configuration file inside the repository."
	fi
	
}


cp2conf() {
	mkdir $2
	xcp $1 $2
}

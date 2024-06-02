#! /bin/bash

# This script is to automate file compression with the 'compress' algorithm

echo "Please enter the path to the file/folder : "
read path
echo " "
echo "Please enter the file name : "
read filename
cd $path

# Compressing with tar.
echo "Now compressing file(s) with tar:"
tar -cvf $filename.tar $filename

# Compressing with 'compress'.
echo " "
echo "Now compressing with 'compress'..."
compress $filename.tar
echo "With 'compress' compressed file is located in $path/$filename.tar.Z."

# Displaying the path to the with 'compress' compressed file.
echo $path$zippedfile | > /dev/null | cat > link


# Deleting the files that are not important to save space.
rm link

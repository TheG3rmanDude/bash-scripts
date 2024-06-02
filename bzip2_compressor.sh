#! /bin/bash

# This script is to automate file compression with the bzip2 algorithm

echo "Please enter the path to the file/folder : "
read path
echo " "
echo "Please enter the file name : "
read filename
cd $path

# Compressing with tar.
echo "Now compressing file(s) with tar:"
tar -cvf $filename.tar $filename

# Compressing with gzip
echo " "
echo "Now compressing with bzip2..."
bzip2 $filename.tar
echo "The bzip2 file is located in $path/$filename.tar.bz2."

# Displaying the path to the bzip2 file.
echo $path$zippedfile | > /dev/null | cat > link


# Deleting the files that are not important to save space.
rm link

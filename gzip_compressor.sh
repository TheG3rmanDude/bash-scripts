#! /bin/bash

# This script is to automate file compression with the gzip (GNU zip) algorithm

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
echo "Now compressing with gzip..."
gzip $filename.tar
echo "Gzipped file is located in $path/$filename.tar.gz."

# Displaying the path to the gzipped file.
echo $path$zippedfile | > /dev/null | cat > link


# Deleting the files that are not important to save space.
rm link

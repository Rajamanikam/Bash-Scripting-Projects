#!/bin/bash

<<objective

Build a Build Script
One common use of bash scripts is for releasing a “build” of your source code. 
Sometimes your private source code may contain developer resources or private information that you don’t want to release in the published version.
So here i had create a release script to copy certain files from a source directory into a build directory.

objective


echo "Welcome, User! 😊🖐"

firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "📦 Your current verion is" $version

#hash=${splitfirstline[0]}
#echo $hash

echo "📢 Enter '1' (for yes) to continue and '0' (for no) to exit"
read versioncontinue
#echo $versioncontinue

if [ $versioncontinue -eq 1 ]
then 
  echo "OK, let's proceed 😉"
  for filename in source/*
  do
    if [ "$filename" == "source/secretinfo.md" ]
    then
    #echo $filename "------------->>> Not Copied"
    echo "📰 Copying $filename ------------->>> 🔐 Secret Code is Masked and Copied"
    sed 's/42/XX/g' $filename > build/secretinfo.md


    else
    cp $filename build/. 
    echo "📰 Copying $filename ------------->>> Completed"
    fi
  done

cd build/
echo "🎉 Build version $version contains:"
ls
cd ..

else
echo "⏳ Please come back when you are ready"
fi

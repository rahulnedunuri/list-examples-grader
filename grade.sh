#set -e

rm -rf student-submission
rm ListExamples.java
rm ListExamples.class
git clone $1 student-submission

if [ -e "student-submission/ListExamples.java" ]
then
	echo "ListExamples file found"
	cp student-submission/ListExamples.java ./
	javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java 2> error.txt
	if [ -s error.txt ]
	then
		echo "Compilation failure"
		echo "$(cat error.txt)"
		echo "Exited with error code $?"
		exit
	else
		echo "Compilation success"
		java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > output.txt
		if [ "$(grep -o E output.txt | wc -l)" != 0 ]
		then
		  echo "Errors!"
		  echo "$(cat output.txt | tail -n2)"
		else
		  echo "No errors!"
		fi
	fi
else
	echo "ListExamples file not found"
fi

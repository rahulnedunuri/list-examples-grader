rm -rf student-submission > output.txt
if [ -e "student-submission/ListExamples.java" ]
then
	rm ListExamples.java
	rm ListExamples.class
fi
git clone $1 student-submission

if [ -e "student-submission/ListExamples.java" 2> errors.txt ]
then
	echo "ListExamples file found: +20 points"
	cp student-submission/ListExamples.java ./
	javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java 2> error.txt
	if [ -s error.txt ]
	then
		echo "Compiler error"
		echo "$(cat error.txt)"
		echo "Exited with error code $?"
		echo "Score: 20/100 for proper file submission but compile error"
		exit 1
	else
		echo "Comile success: +30"
		java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > output.txt
		if grep "OK (2 tests)" $"output.txt"
		then
		  echo "No JUnit test errors: +25 points per passed test"
		  echo "Score: 100/100"
		  exit 0
		else
		  echo "JUnit test errors"
		  echo "$(cat output.txt | tail -n2)"
		  exit 1
		fi
	fi
else
	echo "ListExamples file not found" > output.txt 2> std.err
	echo "Score: 0/100"
	exit 1
fi
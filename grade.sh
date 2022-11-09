# Create your grading script here

set -e
CP=.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar

rm -rf student-submission
git clone $1 student-submission


if [ -e "student-submission/ListExamples.java" ]
then
    echo "ListExamples.java exists on your filesystem."
    cp ListExamples.java /Documents/Github/list-examples-grader

    javac -cp $CP *.java
    java -cp $CP org.junit.runner.JUnitCore TestListExamples > error.txt

fi
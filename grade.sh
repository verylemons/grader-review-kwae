CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


if test -f "student-submission/ListExamples.java"; then
echo ""
echo "Correct File Submitted"
echo ""
else
echo "Incorrect File Submitted"
exit
fi

cp student-submission/ListExamples.java grading-area
cp TestListExamples.java grading-area

cd grading-area/
javac -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar *.java

if test $? -eq 0; then
echo "Successful Compile"
echo ""
else
echo "Unsuccessful Compile"
exit
fi

java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > results.txt

#This part needs fixing (not completed)
if echo "OK (1 test)" | grep "OK (1 test)" results.txt; then
echo "You passed!"
else
echo "You Failed!"
fi

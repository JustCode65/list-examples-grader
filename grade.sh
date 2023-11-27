CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'
CPATH2='.;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


if [[ -f "student-submission/ListExamples.java" ]]
then
    cp student-submission/ListExamples.java ./
else
    echo "wrong file or file dne"
    echo "fail"
fi

javac -cp $CPATH *.java

java -cp $CPATH2 org.junit.runner.JUnitCore TestListExamples > junit-output.txt

FAILURES=`grep -c FAILURES!!! junit-output.txt`
ERROR=`grep -c error junit-output.txt`


if [ $FAILURES -eq 0 ] && [ $ERROR -eq 0 ] 
then
  echo 'you passed'
else
  cat junit-output.txt
  echo "fix stuff please"
fi

exit

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

# Doing this to start from scratch
# Removing because there is a chance there might be files already
# Inside both these directories 
rm -rf student-submission
rm -rf grading-area

#Making a new grading area
mkdir grading-area

#Making a new student submission
git clone $1 student-submission
echo 'Finished cloning'

#Step 2
if [[ -e student-submission/ListExamples.java ]]
then
    echo 'File Found!'
else
    echo 'File NOT found!'
    echo 'Score 0/4'
    exit 1
    
fi

#Step 3
cp -r lib grading-area
cp TestListExamples.java grading-area
cp student-submission/ListExamples.java grading-area

cd grading-area
javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java 2> error.txt
if [[ $? -ne 0 ]]
then   
    echo 'Not compiled'
    echo 'Score 0/4'
    exit 1
fi
java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples >TestOutput.txt 2>&1

if [[ $(grep "OK" TestOutput.txt) ]]
then
    echo 'Passed'
else
    echo 'Failed'
fi


#Step 4




# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

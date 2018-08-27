#!/bin/sh
INIT=0
FAIL=1
PASS=2
VINAX_TEST_RESULT_0=$INIT
VINAX_TEST_RESULT_1=$INIT
VINAX_TEST_RESULT_2=$INIT
VINAX_TEST_RESULT_3=$INIT
init_vinax_test_results()
{
    echo $VINAX_TEST_RESULT_0 $VINAX_TEST_RESULT_1 $VINAX_TEST_RESULT_2 $VINAX_TEST_RESULT_3
    for line in 0 1 2 3; do
        #eval "VINAX_TEST_RESULT_$i=$INIT"
        eval "v=VINAX_TEST_RESULT_$line"; echo $v; eval p=\$$v;
        echo "init_vinax_test_results: $p "
    done
}

# If test failed, then retry running the test
#$1 - 1 = Indicates end of one iteration (1 hour).
#   - 0 = Test called within the 1 hour iteration
check_vinax_test_results()
{
    for line in 0 1 2 3; do
        #eval "VINAX_TEST_RESULT_$i=$INIT"
        eval "v=VINAX_TEST_RESULT_$line"; echo $v; eval p=\$$v;
        echo "check_vinax_test_results: $p "
        if [ $p -ne $PASS ]; then
            echo "+++++++++++++++[`date`] Line $line Retest Vinax Self Test +++++++++++++++"
        else
            echo "+++++++++++++++[`date`] Line $line Vinax Self Test Passed +++++++++++++++"
        fi
    done
}

init_vinax_test_results

check_vinax_test_results

VINAX_TEST_RESULT_0=$PASS
VINAX_TEST_RESULT_1=$PASS
VINAX_TEST_RESULT_2=$PASS
VINAX_TEST_RESULT_3=$PASS

echo $VINAX_TEST_RESULT_0 $VINAX_TEST_RESULT_1 $VINAX_TEST_RESULT_2 $VINAX_TEST_RESULT_3
check_vinax_test_results


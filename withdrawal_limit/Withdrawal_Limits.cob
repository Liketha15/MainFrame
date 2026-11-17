
identification division.
program-id. QUESTION1.

data division.
working-storage section.

01 WS-INPUT       pic X(30).
01 WS-NUMBER      pic S9(18)V9(9) COMP-3.

procedure division.

    accept WS-INPUT

    if function test-numval(function trim(WS-INPUT)) not = 0
        display "INVALID INPUT"
    else
        compute WS-NUMBER =
            function numval(function trim(WS-INPUT))

        if WS-NUMBER not = function integer(WS-NUMBER)
            display "INVALID INPUT"
        else
            if WS-NUMBER >= 100 and WS-NUMBER <= 50000
                display "ACCEPTED"
            else
                display "REJECTED"
            end-if
        end-if
    end-if

    stop run.

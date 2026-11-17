
identification division.
program-id. VSAM-PRIMARY-KEY-REWRITE.

environment division.
input-output section.
file-control.
    select CUST-FILE
        assign to "customer.dat"
        organization is indexed
        access mode is dynamic
        record key is CUST-ID
        file status is WS-STATUS.

data division.
file section.

fd CUST-FILE.
01 CUST-REC.
   05 CUST-ID       pic X(6).
   05 CUST-NAME     pic X(20).

working-storage section.

01 WS-STATUS        pic XX.
01 WS-CUST-WORK.
   05 WS-CUST-ID    pic X(6).
   05 WS-CUST-NAME  pic X(20).

procedure division.

    open output CUST-FILE

    move "C00100" to CUST-ID
    move "KUMAR" to CUST-NAME
    write CUST-REC

    close CUST-FILE

    open i-o CUST-FILE

    move "C00100" to CUST-ID
    read CUST-FILE

    if WS-STATUS = "00"

        move CUST-REC to WS-CUST-WORK

        display "ORIGINAL KEY: " CUST-ID

        move "C00999" to CUST-ID

        rewrite CUST-REC

        display "REWRITE STATUS: " WS-STATUS

        if WS-STATUS not = "00"
            display "PRIMARY KEY MODIFICATION FAILED"

            move "C00100" to CUST-ID
            delete CUST-FILE record

            display "DELETE STATUS: " WS-STATUS

            move "C00999" to WS-CUST-ID
            move "KUMAR" to WS-CUST-NAME

            move WS-CUST-WORK to CUST-REC
            move WS-CUST-ID to CUST-ID

            write CUST-REC

            display "WRITE STATUS: " WS-STATUS

            if WS-STATUS = "00"
                display "CUSTOMER KEY UPDATED SUCCESSFULLY"
            end-if
        end-if

    else
        display "READ FAILED: " WS-STATUS
    end-if

    close CUST-FILE

    stop run.

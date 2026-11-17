
       IDENTIFICATION DIVISION.
       PROGRAM-ID. QUESTION15.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-AMOUNT PIC 9(7)V99.
       01 WS-DAYS PIC 999.
       01 WS-PENALTY PIC 9(7)V99.
       01 WS-TOTAL PIC 9(7)V99.
       01 WS-PENALTY-OUT PIC Z(6)9.99.
       01 WS-TOTAL-OUT PIC Z(6)9.99.

       PROCEDURE DIVISION.

           ACCEPT WS-AMOUNT.
           ACCEPT WS-DAYS.

           COMPUTE WS-PENALTY ROUNDED =
               WS-AMOUNT * WS-DAYS * 0.01.

           IF WS-PENALTY > WS-AMOUNT * 0.10
               COMPUTE WS-PENALTY ROUNDED =
                   WS-AMOUNT * 0.10
           END-IF.

           COMPUTE WS-TOTAL ROUNDED =
               WS-AMOUNT + WS-PENALTY.

           MOVE WS-PENALTY TO WS-PENALTY-OUT.
           MOVE WS-TOTAL TO WS-TOTAL-OUT.

           DISPLAY "Penalty: "
               FUNCTION TRIM(WS-PENALTY-OUT).
           DISPLAY "Total payable: "
               FUNCTION TRIM(WS-TOTAL-OUT).

           STOP RUN.

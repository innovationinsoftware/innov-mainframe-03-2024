//MATEVAS  JOB (123),'SORT EXAMPLE 5',
//             CLASS=A,MSGCLASS=A,MSGLEVEL=(1,1),
//             NOTIFY=&SYSUID
//**********************************************************************
//* USE SYMBOLS WITH DFSORT
//**********************************************************************
//SORT     EXEC PGM=SORT
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SORTIN   DD &SYSUID..DATA.FILE02,DISP=SHR
//SORTOUT  DD DSN=&SYSUID..DATA.FILE02S,
//            DISP=(NEW,CATLG,DELETE),
//            DCB=&SYSUID..INNOV.MODEL80,
//            SPACE=(TRK,(1,1),RLSE),UNIT=SYSDA
//SYMNAMES DD *
Dept,38,4            Dept number 
Dept_t,38,4,ZD       Dept number with data type
Role,42,12           Role
Role_t,42,12,CH      Role with data type
Sort_Name,2,21,CH    Concatenated name fields to sort on
Surname,2,20         Surname 
First_Initial,22,1   First initial of the first name
Period_Space,C'. '   Period and space to follow initial
Active_Flag,1,1,CH   Active employee flag in input record
Active_Status,C'A'   Value for active employee
//SYSIN    DD *
 SORT FIELDS=(Dept_t,A,Role_t,D,Sort_Name,A)
 INCLUDE COND=(Active_Flag,EQ,Active_Status)
 OUTREC FIELDS=(Dept,First_Initial,Period_Space,Surname,Rule,80:X) 
/* 
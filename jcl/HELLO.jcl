//MATEVAH JOB MSGLEVEL=(1,1),NOTIFY=&SYSUID 
//STEP01  EXEC PGM=HELLO
//STEPLIB  DD  DSN=&SYSUID..LOADLIB,DISP=SHR
//SYSOUT   DD  SYSOUT=*
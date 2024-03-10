[README](../README.md) 

# z/OS COBOL Labs 

### COBOL Lab 1 - Compile and run a COBOL program 

Upload sample program ```cobol/HELLO.cbl``` from this repository to your source library, ```<userid>.COBOL.SOURCE(HELLO)```.

In your JCL library, ```<userid>.INNOV.JCL```, create a new member to contain JCL to compile and bind a COBOL program. You can use the sample job in ```jcl/CBLBATCH.jcl``` as a model for this JCL. Also refer to _COBOL Module 2 - Compile_ for more information.

Run your batch compile job to compile and bind the HELLO program. 

Now create a new JCL member to execute the HELLO program. You will need one step, with PGM=HELLO on the EXEC statement. You will need a SYSOUT DD for the program output. 

Run the HELLO job and review the output using SDSF. 



### COBOL Lab 2 - Modify, compile, and run a COBOL program

Modify the HELLO program so that the output reads, 

```Hello, World!``` 

```My name is <your name here>. Look on my works, ye mighty, and despair!"```

Use your compile and bind job to prepare the program for execution, then run your HELLO job. 

Use SDSF to review the output.	



### COBOL Lab 3 - Working with strings and text, part 1

Refer to material in _COBOL Module 4 - Strings and Text, Part 1_ for guidance.

Upload program ```labs/STR1.cbl``` as ```<userid>.COBOL.SOURCE(STR1)```. 

Follow the instructions in the source comments of STR1 to complete the missing code. 

Compile, bind, and run the program.

Use SDSF to review the output. 



### COBOL Lab 4 - Working with strings and text, part 2

Refer to material in _COBOL Module 5 - Strings and Text, Part 2_ for guidance.

Upload program ```labs/STR2.cbl``` as ```<userid>.COBOL.SOURCE(STR2)```. 

Follow the instructions in the source comments of STR2 to complete the missing code. 

Compile, bind, and run the program.

Use SDSF to review the output. 



### COBOL Lab 5 - Working with strings and text, part 3

Refer to material in _COBOL Module 6 - Strings and Text, Part 3_ for guidance.

Upload program ```labs/STR3.cbl``` as ```<userid>.COBOL.SOURCE(STR3)```. 

Follow the instructions in the source comments of STR3 to complete the missing code. 

Compile, bind, and run the program.

Use SDSF to review the output.



### COBOL Lab 6 - Arithmetic

Refer to material in _COBOL Module 7 - Arithmetic_ for guidance.

Upload program ```labs/ARITH.cbl``` as ```<userid>.COBOL.SOURCE(ARITH)```.

Follow the instructions in the source comments of ARITH to complete the missing code. 

Compile, bind, and run the program.

Use SDSF to review the output.



### COBOL Lab 7 - Date and Time, Tables

Refer to material in _COBOL Module 8 - Working with Dates and Times_ for guidance.

Upload program ```labs/DTIME.cbl``` as ```<userid>.COBOL.SOURCE(DTIME)```.

Follow the instructions in the source comments of DTIME to complete the missing code. 

Compile, bind, and run the program.

Use SDSF to review the output.


### COBOL Lab 8 - Searching Tables, Processing Sequential Data Sets 

Refer to material in _COBOL Module 9 - Tables_ and _COBOL Module 10 - Sequential Data Sets_ for guidance. 

Upload program ```labs/TABSRCH.cbl``` as ```<userid>.COBOL.SOURCE(TABSRCH)```. 

Upload copybook ```labs/TABREC.cbl``` as ```<userid>.COBOL.COPY(TABREC)```.

Upload data file ```labs/mountains.txt``` as ```<userid>.INNOV.TABDATA``` with record format fixed-blocked, logical record length 80, block size 32000. Allocate one track primary, one track secondary. 	

Follow the instructions in the source comments of TABSRCH to complete the missing code. 

Compile, bind, and run the program.

Use SDSF to review the output.


### COBOL Lab 9 - Sorting Tables 

We did not cover this topic in class, but you can find information about it at https://www.ibm.com/docs/en/cobol-zos/6.4?topic=tables-sorting-table. 

This is not a mandatory lab exercise because the system we are using does not support a suitable version of the COBOL compiler. If you have access to IBM Enterprise COBOL 6.x at your place of work, then you can try this exercise. 

Upload program ```labs/TABPLAY.cbl``` as ```<userid>.COBOL.SOURCE(TABPLAY)```. 

Follow the instructions in the source comments of TABPLAY to complete the missing code. 

Compile, bind, and run the program.

Use SDSF to review the output.


### COBOL Lab 10 - VSAM KSDS batch update

You'll write a batch application to keep track of free throw statistics for an amateur basketball league.

There are several steps to complete in this lab: 
1. Upload some data files
1. Define and catalog a VSAM KSDS
1. Load the KSDS from a sequential data set 
1. Write a COBOL program to apply updates to the KSDS from a sequential input data set
1. Write JCL to execute the COBOL program

Details: 

(1) Upload the following files:

- Copybook for the Free Throw KSDS record layout: ```labs/FRTHROW.cpy``` ==> ```<userid>.COBOL.COPY(FRTHROW)``` 
- Copybook for the Free Throw QSAM update record layout: ```labs/FRUPDATE.cpy``` ==> ```<userid>.COBOL.COPY(FRUPDATE)``` 
- Seed data to load the KSDS: ```labs/FRSEED.data``` ==> ```<userid>.INNOV.FRSEED```, RECFM FB, LRECL 77, BLKSIZE 7700
- Input updates for the batch job: ```labs/FRUPDATE.data``` ==> ```<userid>.INNOV.FRUPDATE```, RECFM FB, LRECL 80, BLKSIZE 16000

(2) Use your mad IDCAMS skills to write a job that executes IDCAMS to:

1. DELETE cluster ```<userid>.INNOV.FRTHROW``` 
1. DEFINE cluster ```<userid>.INNOV.FRTHROW``` with record size 77 77, key 40 0.
1. REPRO ```<userid>.INNOV.FRSEED``` into ```<userid>.INNOV.FRTHROW```.

(3) Write a COBOL program to apply updates from ```<userid>.INNOV.FRUPDATE``` to ```<userid>.INNOV.FRTHROW```.

Read the input file sequentially and apply the update specified in each record to the KSDS. Note that for a Delete operation, there are no data fields in the update record; only key fields.

The record key comprises two logical fields (adjacent) - Team and Player.

Check File Status values relevant to the I/O operations your program performs. 

The input data may or may not be clean. Write defensive code to avoid S0C7 abends.

(4) Write JCL to execute the COBOL program and apply the updates to the KSDS.

Use the tools you have learned to check the results. For example, you can view batch job output with SDSF; you can run an IDCAMS PRINT job to see the contents of the KSDS, or use ISPF Option 3.4 to do so. 

Based on the input values available in the update file, you can calculate the number of points scored by counting two (2) points for each completed free throw, minus the number of three-pointers, and then add the number of three-pointers times three (3). 

(5) Have fun!

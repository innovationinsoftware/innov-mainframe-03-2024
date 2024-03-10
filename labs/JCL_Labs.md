[README](../README.md) 

# z/OS JCL Labs 

### JCL Lab 1 - Create sequential data set with IEFBR14 

In the JCL library provided in the lab environment, create a job containing one step that executes utility IEFBR14. Code a DD statement for that step to allocate and catalog a sequential data set with the name ```shell <userid>.TEST.QSAM1```. 

Allocate space in tracks with 1 track primary and 1 track secondary. 

Specify the volume you are required to use per the setup email. If you did not receive a setup email, ask your instructor for guidance on this. Always use this volume in the subsequent labs.

For the DISP parameter on the DD statement: The status of the data set is NEW. If the step is successful, catalog the data set; otherwise, delete it. 

Use SDSF to review the job output. 

Use ISPF Option 3.4 to check the attributes of the new data set to be sure they are what you expected based on your DD parameters.



### JCL Lab 2 - Create and load a sequential data set 

Create a job containing one step that executes utility IEBGENER. 

For SYSUT1, code an in-line data set containing a few records with whatever text you wish. 

For SYSUT2, code a DD statement to create a sequential data set similar to your ```<userid>.TEST.QSAM1``` and name it ```<userid>.TEST.QSAM2```. Make it a fixed-blocked data set with 80-byte records and 16000-byte blocks.

Use SDSF to review the results of the run and see that the records you coded under SYSUT1 were loaded into the new QSAM2 data set.

Use ISPF Option 3.4 to check the attributes of the new data set to be sure they are what you expected based on your DD parameters.



### JCL Lab 3 - Create a source library with IEFBR14

In the JCL library provided in the lab environment, create a job containing one step that executes utility IEFBR14. Code a DD statement for that step to allocate and catalog a library (that is, a PDSE) suitable for storing program source. Remember all program source in traditional mainframe languages consists of 80-character records, so you will want the library to house 80-byte records. Make the blocksize an even multiple of 80. Name the new library ```<userid>.COBOL.SOURCE```.

Allocate space in tracks with 2 tracks primary and 8 tracks secondary. Specify 10 directory blocks. 

If the step is successful, catalog the data set; otherwise, delete it.

Use SDSF to review the job output. 

Use ISPF Option 3.4 to check the attributes of the new data set to be sure they are what you expected based on your DD parameters.



### JCL Lab 4 - Create a model DSCB

In the JCL library provided in the lab environment, create a job to run IEFBR14. 

Using the material for _JCL Module 6 - IEBGENER_ and _JCL Module 10 - PDS_ as a guide, code a DD statement to catalog a model DSCB for a PDSE (Library) suitable for JCL and program source. It will have record format fixed-blocked, logical record length 80, and block size a multiple of 80. 

Use SDSF to review the job output. 

Use ISPF Option 3.4 to check the attributes of the new data set to be sure they are what you expected based on your DD parameters.

From now on, use your JCL library instead of the default one provided in the lab environment.



### JCL Lab 5 - Use the model DSCB to create a JCL library

The task is to write a job stream that creates a JCL library and copies the members of the default JCL library to the new one in a single step.

Create a job to run IEBCOPY. See _JCL Module 10 - PDS_ for information about IEBCOPY. 

Code the SYSUT1 DD statement to refer to the default JCL library provided in the lab environment. It will be the source of the copy operation. 

Refer to the model DSCB you created in Lab 4 in the DCB parameter of the SYSUT2 DD statement to create another PDSE. Name this PDSE ```<userid>.INNOV.JCL```. Allocate space in tracks with 2 primary, 8 secondary, and 10 directory blocks. 

Use SDSF to review the job output. 

Use ISPF Option 3.4 to check the attributes of the new data set to be sure they are what you expected based on your DD parameters.

Use ISPF Option 1 to see the members in ```<userid>.INNOV.JCL``` and make sure all the members were copied from the default JCL library to the new one.

From now on, use your JCL library instead of the default one that was provided.



### JCL Lab 6 - Use the model DSCB to create a COBOL source library

The task is to write a job stream that creates a source library for COBOL code.

Refer to the model DSCB you created in Lab 4 in the DCB parameter of the SYSUT2 DD statement to create another PDSE. Name this PDSE ```<userid>.INNOV.JCL```. Allocate space in tracks with 2 primary, 8 secondary, and 10 directory blocks. 

Use SDSF to review the job output. 

Use ISPF Option 3.4 to check the attributes of the new data set to be sure they are what you expected based on your DD parameters.

From now on, use your COBOL source library for COBOL source code.



### JCL Lab 7 - Create a program object library

The task is to write a job stream that creates a program object library - that is, a PDSE as opposed to a PDS load library. Name it ```<userid>.INNOV.PGMLIB```.

Use SDSF to review the job output. 

Use ISPF Option 3.4 to check the attributes of the new data set to be sure they are what you expected based on your DD parameters.

From now on, use your COBOL source library for COBOL source code.



### JCL Lab 8 - Sort on two fields 

Refer to material in _JCL Module 7 - Sort_ for information about DFSORT.

Upload file ```labs/sort_input_1.txt``` from this repository to z/OS data set ```<userid>.DATA.SRTIN1```. Format is fixed-blocked, logical record length is 46, block size is 460. Allocate 1 track primary, 1 track secondary.

The SRTIN1 data set will be the input to a SORT (the SORTIN DD).

The record layout is:

Pos 1-6  Salesperson Id          1- 6
Pos 7-36 Name                    7-36 
Pos 37-38 Month                  37-38
Pos 39-46 Value of Closed Sales  39-46

Code a job stream to execute SORT to sort the SRTIN1 data set on:
    
- Month ascending 
- Value of Closed Sales descending 
- Name ascending 

Format the output records as follows:

Pos 1-2 Month
Pos 3-10 Value of Closed Sales
Pos 11-16 Salesperson Id
Pos 17-46 Name

Catalog the output data set as ```<userid>.DATA.SRTOUT1```. Remember to pad the output records with spaces. 



### JCL Lab 9 - Multi-step sort, catalogued procedures, and conditional execution  

Refer to material in _JCL Module 8 - PROC_ for information on temporary data sets and stored procedures and _JCL Module 9 - COMD_ for information on conditional step execution.

Upload file ```labs/sort_input_2.txt``` from this repository. Name the z/OS data set ```<userid>.DATA.SRTIN2```. It has the same attributes as ```<userid>.DATA.SRTIN2```. 

The SORT specifications are the same as in Lab 6. This time, write a job stream that sorts each of the two input data sets in separate steps. The SORTOUT datasets are to be temporary data sets.

The two steps will be identical except for the names of the data sets. Extract that JCL into a procedure and catalog the procedure. The final job stream will invoke the procedure twice instead of duplicating the SORT JCL in both steps. If the first SORT fails, don't execute the second SORT. 

After running the two sorts, execute SORT again to merge the sorted data sets (the temporary data sets). If any previous step fails, don't execute the merge step.

Catalog the output data set as ```<userid>.DATA.SRTOUT2```.  



### JCL Lab 10 - Create and load a GDG

Refer to material in _JCL Module 11 - GDG_ for information on Generation Data Groups (GDGs) and Generation Data Sets (GDSs). 

Upload files ```labs/gds_input_1.txt```, ```labs/gds_input_2.txt```, and ```labs/gds_input_3.txt``` as ```<userid>.DATA.GDSIN1```, ```GDSIN2```, and ```GDSIN3``` respectively. 

Create a job that defines a model DSCB specifying fixed-blocked format, logical record length 80, and block size 16000. 

Create a job that runs the IDCAMS utility to delete/define a Generation Data Group named ```<userid>.INNOV.GDG1```. 

Create a job that copies a QSAM data set to the next GDS (that is, the +1 generation) of the new GDG. 

Either (1) run the copy job three times or (2) duplicate the copy step three times in the same job or (3) define a JCL procedure for the copy step and invoke it three times in the copy job to copy ```<userid>.DATA.GDSIN1```, ```GDSIN2```, and ```GDSIN3``` to the GDG you created. 

Use ISPF Option 3.4 to verify the results of the various steps in the lab exercise. 

Create a job that copies the current generation of the GDG to SYSOUT. 

Use SDSF to see that the correct version was copied to SYSOUT. 



### JCL Lab 11 - Create and load a VSAM KSDS 

Refer to material in _JCL Module 12 - VSAM_ for information on using IDCAMS to manage VSAM data sets. 

Upload file ```labs/ksds_data_1.txt``` as ```<userid>.INNOV.DATA1```. Specify format fixed-blocked, logical record length 40, block size 16000.

Upload file ```labs/catalog_ksds.jcl``` as ```<userid>.INNOV.JCL(CATKSDS)```.

Run the CATKSDS job to delete, define, listcat, load, and print a Key Sequenced Data Set (KSDS) named ```<userid>.INNOV.KSDS1```. There are intentional errors in the JCL and the IDCAMS commands that you will have to diagnose and correct before the job will run successfully. 

Use SDSF and ISPF Option 3.2 to check the results. 

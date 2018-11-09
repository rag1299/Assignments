To Run the project 
> cd /path/to/folder/
> make run

To Change the test case 
Open WMultiplierTb.bsv and change x, y values in the registers.

To Parameterise the code (default it is 8bit multiplier)
Open WMultiplier.bsv and uncomment the below(for 4bit multiplier)
// Un-comment this for 4-bit multiplier
// typedef 4 InBusSize;
// typedef 8 OutBusSize;
// typedef 3 Stages;
// typedef 9 ReqReg;

and you should also change CLAdder parameters as well.
Open CLAdder.bsv and uncomment the below (8bit adder , i.e 4bit multiplier)
// typedef 8 InBusSize;  // For input of size 16 bit , keep 16
// typedef 9 OutBusSize; // Output width will be +1
// typedef 3 Stages; // Define the number of stages before hand

Wait for 2 mins(max) to get output
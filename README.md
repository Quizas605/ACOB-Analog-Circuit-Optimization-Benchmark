# ACOB:Analog-Circuit-Sizing-Optimization-Benchmarks
All circuits come from [ITC 2017 AMS Benchmark Circuits V2.2](https://sagroups.ieee.org/2427/analogue-benchmark-circuits/), IEEE Standards Association.
There are three circuits so far, including an OP-AMP circuit, a PLL circuit, and an OSC circuit. Their schematics are listed in 'schematics.pdf'. There are 14, 36, and 77 independent variables corresponding to the OSC, OPA-MP, and PLL circuits. Most of them are the width and length of the MOSFET. The return of the evaluation function is the FOM value defined in the netlists, which is also called the Objective Function in optimization problems. 
## 1. Directory Structure：  
**OPAMP1/**                           
     &emsp; **process_model/** &emsp; &emsp; &emsp; &emsp;%different design corners  
     &emsp; **subcircuit_files/** &emsp; &emsp; &emsp; &emsp;%subcircuits of OPA-MP circuit   
     &emsp; **OPAMP1.circuit** &emsp; &emsp; &emsp; &emsp;%main circuit   
     &emsp; **OPAMP1.ic0**  
     &emsp; **OPAMP1.mt0**  
     &emsp; **OPAMP1.potential_defect_list** 
     &emsp; **OPAMP1.py** &emsp; &emsp; &emsp; &emsp;%evaluation Python script  
     &emsp; **param** &emsp; &emsp; &emsp; &emsp;%parameters defined in the circuit  
      &emsp;**simlog(OPAMP.lis)** &emsp; &emsp; &emsp; &emsp;%output of the simulation  
**OSC1/**  
**PLL/**

OSC1/ and PLL/ directory have the same structure as OPAMP1/  
## 2. Installation and Run  
Download and unzip all directories to your main project directory, before importing in your code, please set the variables below correctly:  
  ****
  **path_param** = 'PATH/TO/param'    
  **path_simlog** = 'PATH/TO/simlog'# or 'PATH/TO/xxx.lis'  
  **sim_command** = 'system simulation command '  
  ****  
The variables above are defined in Python scripts. _path_param_ is the path to the _param_ file, _path_simlog_ is the path to the simulation output file, and _sim_command_ is the system command used to simulate the netlist with simulators.  

To import in your algorithm code, add "_from circuit/circuit.py import circuitXX_" ahead of your main function code. 
       

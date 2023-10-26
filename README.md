# Analog-Circuit-Sizing-Optimization-Benchmarks
All circuits come from [ITC 2017 AMS Benchmark Circuits V2.2]([url](https://sagroups.ieee.org/2427/analogue-benchmark-circuits/)), IEEE Standards Association.
There are three circuits so far, including an OPA-MP circuit, a PLL circuit, and an OSC circuit. Their schematics are listed in 'schematics.pdf'. There are 14, 36, and 77 independent variables corresponding to the OSC, OPA-MP, and PLL circuits. Most of them are the width and length of the MOSFET. The return of the evaluation function is the FOM value defined in the netlists, which is also called the Objective Function in optimization problems. 
1. Directory Structure：
 **  **OPAMP1/                           
     process_model/                    different design corners
   
     subcircuit_files/                 subcircuits of OPA-MP circuit 
     OPAMP1.circuit                    main circuit 
     OPAMP1.ic0
     OPAMP1.mt0
     OPAMP1.potential_defect_list
     OPAMP1.py                        evaluation Python script
     param                            parameters defined in the circuit
     simlog(OPAMP.lis)                output of the simulation
   OSC1/
   PLL/****

OSC1/ and PLL/ directory have the same structure as OPAMP1/
2. Installation and Run
Download and unzip all directories to your main project directory, before importing in your code, please set the variables below correctly:
  ****
  path_param = 'PATH/TO/param'  
  path_simlog = 'PATH/TO/simlog'# or 'PATH/TO/xxx.lis'
  sim_command = 'system simulation command '
  ****
The variables above are defined in Python scripts. path_param is the path to param file, path_simlog is the path to the simulation output file, and sim_command is the system command used to simulate the netlist with simulators.

To import in your algorithm code, add "from circuit/circuit.py import circuitXX" ahead of your main function code. 
       

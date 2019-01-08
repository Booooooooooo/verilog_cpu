@echo off
set xv_path=F:\\Vivado\\2015.4\\bin
call %xv_path%/xsim test_for_Imem_behav -key {Behavioral:sim_1:Functional:test_for_Imem} -tclbatch test_for_Imem.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

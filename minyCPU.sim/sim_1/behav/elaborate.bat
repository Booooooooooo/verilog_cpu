@echo off
set xv_path=F:\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto f92001af310a4649ab13ba7c36d1424d -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot test_for_Decoder_behav xil_defaultlib.test_for_Decoder xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

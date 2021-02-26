@echo off
REM Go to folder Oceana_Trial_Project\Oceana_DVIT_Auto\source_code\oceana_trail_project 
cd ..

Set var_path= %cd%

REM Set python path: Oceana_Trial_Project\Oceana_DVIT_Auto\source_code\oceana_trail_project\venv\Scripts\python.exe
Set python_path= %var_path%/venv/Scripts/python.exe

REM Set test plan path: Oceana_Trial_Project\Oceana_DVIT_Auto\source_code\oceana_trail_project\oceana\test_plan\test_plan.txt
Set test_plan_path= %var_path%/oceana/test_plan/test_plan.txt

REM Set report folder : Oceana_Trial_Project\Oceana_DVIT_Auto\source_code\oceana_trail_project\oceana\report\102839_01222019
set foldername=%time:~0,2%%time:~3,2%%time:~6,2%_%date:~-10,2%%date:~-7,2%%date:~-4,4%
set report_path= %var_path%/oceana/reports/%foldername%

REM Set test suite folder Oceana_Trial_Project\Oceana_DVIT_Auto\source_code\oceana_trail_project\oceana\test_suites\integration_FINAL
set test_suite_path= %var_path%/oceana/test_suites/integration_FINAL

call %python_path% -m robot --outputdir %report_path% --loglevel DEBUG:INFO --argumentfile %test_plan_path% %test_suite_path%
pause
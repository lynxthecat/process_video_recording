(for %%i in (*.MOV) do @echo file '%%i') > mylist.txt
C:\ffmpeg\bin\ffmpeg -f concat -safe 0 -i mylist.txt -c copy intermediate.MOV
set recording_date=""
:enter_recording_details
set /p start_time="Enter start time of video segment for extraction in format (hh:mm:ss): "
set /p end_time="Enter end time of video segment for extraction in format (hh:mm:ss): "
set /p recording_date="Enter recording date in format YYYY-MM-DD-[AM/PM]: "
if /i %recording_date%=="" goto enter_recording_details
set "filename=%recording_date%.MOV"
set /a "ss=(((1%end_time::=-100)*60+1%-100)-(((1%start_time::=-100)*60+1%-100)"
set /a "hh=ss/3600+100,ss%%=3600,mm=ss/60+100,ss=ss%%60+100"
set duration=%hh:~1%:%mm:~1%:%ss:~1%
C:\ffmpeg\bin\ffmpeg -ss %start_time% -i intermediate.MOV -t %duration% -af "volume=20dB" -crf 32 -vf eq=brightness=0.1 %filename%
del mylist.txt
del intermediate.MOV
move %filename% ..
mkdir %recording_date%
move *.MOV %recording_date%
move %recording_date% ..

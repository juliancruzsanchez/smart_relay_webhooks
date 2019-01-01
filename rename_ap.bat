echo “HN_SMART_LAMP” |  \Strawberry\perl\bin\perl.exe -ne ‘zzchop; printf("%c%s", length, $_)’ > ssid_prefix
REM dfu-util -d 1d50:607f -a 1 -s 1826 -D ssid_prefix
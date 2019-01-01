@echo off
cls
echo [ ================================= ]
echo [ Easy Compile and Flash for Photon ]
echo [ ================================= ]
ping localhost -c 8 > nul

if NOT exist logs (
  mkdir logs
)
if NOT exist dist (
  mkdir dist
)

cd dist

if exist firmware.bin (
  del firmware.bin
)
cd ..
SET device_id=430044001051353338363333

particle compile photon > logs/compile.log

cls
echo [ ================================= ]
echo [ Easy Compile and Flash for Photon ]
echo [ ================================= ]
echo .
echo .
echo [ ========= FLASHING FILE ==========]
move photon_firmware_*.bin dist\firmware.bin
particle flash %device_id% dist/firmware.bin > logs/flash.log || exit
cls
echo [ ================================= ]
echo [ Easy Compile and Flash for Photon ]
echo [ ================================= ]
echo .
echo .
echo [ ========= CLEANING DIR ========== ]
del *.bin
cls
echo [ ================================= ]
echo [ Easy Compile and Flash for Photon ]
echo [ ================================= ]

echo [ ============ FINISH ============= ]
pause
cls
call "%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Community\Common7\Tools\vsdevcmd" -arch=x64
cd c:\users\loki\Documents\klogg
md build
cd build
cmake -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DBUILD_VERSION=X.X.X ../
cmake --build . --config Release -j 8

del klogg.exe
move klogg_portable.exe klogg.exe
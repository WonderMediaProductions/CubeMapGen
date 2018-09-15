@echo off

set DDS_SOURCE_FOLDER=d:\AnimNow.Library\Environment\Substance
set DDS_TARGET_FOLDER=d:\AnimNow.Library\Environment\AnimNow
set CUBEMAPGEN_PATH=bin\nt-x64\CubeGen_ra.exe

mkdir %DDS_TARGET_FOLDER%

for %%f in (%DDS_SOURCE_FOLDER%\*.dds) do (
    echo Filtering %%~Nf...
    %CUBEMAPGEN_PATH% @glTF_PBR_args.txt -importCubeDDS:"%%f" -exportFilename:"%DDS_TARGET_FOLDER%\%%~Nf_diffuse_env.dds" -exportSize:128 -IrradianceCubemap -NumMipmap:8 
)


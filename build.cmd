REM Set this variable to the absolute or relative path to your SDK's bin directory. The SDK has to support at least Flash 10.1
SET MXMLC_PATH="c:/Programs/Air SDK/flex_sdk_4.6.0_a_3.6/bin/"

REM In order to build only a single version of the game copy the MXML_PATH variable declaration and the whole call of the version
REM you want to build into a separate *.cmd file and run it

REM First are all the release versions then the debug versions

REM Release
%MXMLC_PATH%\mxmlc ^
	-default-size=500,550 ^
	-optimize ^
	-default-background-color=0xFFFFFF ^
	-frame=ContentFrame,core.Galagian ^
	-source-path=".\src" ^
	-source-path+=".\src.framework" ^
	-output=bin/Galagian.swf ^
	-static-link-runtime-shared-libraries=true ^
	src\core\preloader\Preloader.as
	
	
REM Debug
%MXMLC_PATH%\mxmlc ^
	-default-size=500,550 ^
	-optimize ^
	-default-background-color=0xFFFFFF ^
	-frame=ContentFrame,core.Galagian ^
	-source-path=".\src" ^
	-source-path+=".\src.framework" ^
	-output=bin/Galagian_DEBUG.swf ^
	-debug=true ^
	-static-link-runtime-shared-libraries=true ^
	src\core\preloader\Preloader.as
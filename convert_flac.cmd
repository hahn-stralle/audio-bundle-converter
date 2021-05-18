@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

rem 出力音声ファイル拡張子。
set export_file_extension=.flac

rem 出力ディレクトリパス追記。
set export_directory_path=%3%export_file_extension%\

if not %1==return (
	call %~dp0bundle_audio.cmd %~nx0 %*
) else (
	rem 入力音声ファイルをflacに変換して出力します。
	mkdir %export_directory_path% 2>nul
	ffmpeg -i %2 -ar 48000 -sample_fmt s32 -compression_level 12 -c:a flac %export_directory_path%%~n2%export_file_extension%
)
endlocal
exit /b
@echo off
set "ERL_LIBS=C:\PROGRA~1\ERLANG~1\lib"
set "ELIXIR_ERL_OPTIONS=-pa C:\PROGRA~1\ERLANG~1\lib\compiler-8.2.5\ebin -pa C:\PROGRA~1\ERLANG~1\lib\crypto-5.1.4\ebin -pa C:\PROGRA~1\ERLANG~1\lib\stdlib-4.3.1\ebin -pa C:\PROGRA~1\ERLANG~1\lib\kernel-8.5.4\ebin"
set "PATH=C:\PROGRA~1\ERLANG~1\erts-13.2.1\bin;%PATH%"

echo Installing Hex...
echo Y | call "C:\Program Files (x86)\Elixir\bin\mix.bat" local.hex --force

echo Installing Phoenix...
echo Y | call "C:\Program Files (x86)\Elixir\bin\mix.bat" archive.install hex phx_new --force

echo Creating Project...
call "C:\Program Files (x86)\Elixir\bin\mix.bat" phx.new backend --no-live --database postgres --no-install

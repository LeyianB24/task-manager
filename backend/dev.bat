@echo off
set "PATH=C:\Users\USER\elixir_env\elixir\bin;C:\Users\USER\elixir_env\otp\bin;%PATH%"
set "ERL_HOME=C:\Users\USER\elixir_env\otp"
set "MIX_HOME=C:\Users\USER\elixir_env\.mix"
set "ERL_LIBS="
mix %*

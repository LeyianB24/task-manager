
# Manually load the correct OTP 25 compiler
Code.append_path("C:/Program Files/Erlang OTP/lib/compiler-8.2.5/ebin")
Code.append_path("C:/Program Files/Erlang OTP/lib/stdlib-4.3.1/ebin")
Code.append_path("C:/Program Files/Erlang OTP/lib/kernel-8.5.4/ebin")

# Try to load the compiler app
case Application.ensure_all_started(:compiler) do
  {:ok, _} -> IO.puts("Compiler loaded successfully")
  {:error, reason} -> 
    IO.puts("Failed to load compiler: #{inspect(reason)}")
    System.halt(1)
end

# Now try to install hex and phx_new
try do
  Mix.install([{:hex, ">= 0.0.0"}, {:phx_new, "~> 1.7.0"}])
  IO.puts("Hex and Phoenix installed via Mix.install")
  
  # Note: Mix.install handles the archive-like behavior for the script session.
  # But the user wants a separate project folder.
  # We still need to run the generator.
  
  # If we got here, we might be able to run the task
  Mix.Task.run("phx.new", ["backend", "--no-live", "--database", "postgres", "--no-install"])
  IO.puts("Project created successfully")
catch
  kind, error ->
    IO.puts("An error occurred during installation: #{inspect(error)}")
    IO.puts(Exception.format(kind, error, __STACKTRACE__))
end

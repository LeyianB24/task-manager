
# Manually load isolated compiler
Code.append_path("C:/Users/USER/elixir_env/otp/lib/compiler-8.2.6.4/ebin")
Code.append_path("C:/Users/USER/elixir_env/otp/lib/stdlib-4.3.1.3/ebin")
Code.append_path("C:/Users/USER/elixir_env/otp/lib/kernel-8.5.4.3/ebin")

# Find phx_new archive ebin
# We'll use the one we just installed in MIX_HOME
archives_path = "C:/Users/USER/elixir_env/.mix/archives"
case File.ls(archives_path) do
  {:ok, files} ->
    phx_dir = Enum.find(files, &String.starts_with?(&1, "phx_new"))
    if phx_dir do
      Code.append_path(Path.join([archives_path, phx_dir, "ebin"]))
    else
      IO.puts("Archive not found in #{archives_path}")
      System.halt(1)
    end
  {:error, reason} ->
    IO.puts("Failed to list archives: #{inspect(reason)}")
    System.halt(1)
end

# Start Mix and run the task
Mix.start()
Mix.shell(Mix.Shell.Process) # Non-interactive shell
Mix.Task.run("phx.new", ["backend", "--no-live", "--database", "postgres", "--no-install"])

# The shell will send messages like {:mix_shell, :info, [msg]}
# We could wait for them, but phx.new should just run.
IO.puts("Generation complete attempt finished.")

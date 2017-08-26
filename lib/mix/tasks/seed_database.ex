defmodule Mix.Tasks.Relister.Seed do
    use Mix.Task
    @shortdoc "Simply runs the Hello.say/0 command."
    def run(_) do
        Relister.Seed.seed
    end
  end
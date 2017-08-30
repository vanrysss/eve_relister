use Mix.Config

config :eve_relister, ecto_repos: [Relister.Repo]

config: :eve_relister, Relister.Repo,
    adapter: Ecto.Adapters.Postgres,
    database: "",
    username: "",
    password: "",
    hostname: "",
    port: ""
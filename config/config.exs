# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :quizzer_one,
  ecto_repos: [QuizzerOne.Repo]

# Configures the endpoint
config :quizzer_one, QuizzerOne.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EUe8Pd0eWJogzzQVquAl2rqIC5l4ubO3DlHbm4sgR4V4khGkRAO2d3PZva3fJMs0",
  render_errors: [view: QuizzerOne.ErrorView, accepts: ~w(html json)],
  pubsub: [name: QuizzerOne.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

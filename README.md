# Tempestas

Tempestas is an API library for the Apple WeatherKit API. 

You're able to view more details on the [docs](http://hexdocs.pm/tempestas).

## Getting started
First things first, add Tempestas as a dependancy to your project

```elixir
def deps do
  [
    {:tempestas, "~> 0.1"}
  ]
end
``` 
Next, add your Riot API key to your elixir applications config file,
```
config :tempestas,
    :key_id, "ABC123DEFG"
    :service_id, "com.example.weatherkit-client"
    :team_id, "DEF123GHIJ"
    :private_key, """-----BEGIN PRIVATE KEY-----..........-----END PRIVATE KEY-----"""
```
From there, you can use the API's in the API reference.


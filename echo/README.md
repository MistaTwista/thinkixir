# Echo

## Как запустить
```elixir
# запускаем супервизора
Echo.Supervisor.start_link([])

# он стартует 3 процесса
# Echoer - задание, синхронно отвечает на запрос ping
Echo.Echo.ping(Process.whereis(Echoer))
# Pingo - пингует Pongo раз в 5 секунд и уведомляет об этом консоль
# Pongo - отвечает на ping, уведомляя консоль
Echo.Pingo.run(Process.whereis(Pingo))
```

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `echo` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:echo, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/echo>.


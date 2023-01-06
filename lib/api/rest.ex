defmodule Tempestas.API.Rest do
  @moduledoc false

  def wrapped_get(url, headers \\ []) do
    {status_code, data, _} = get(url, headers)

    if status_code != 200 do
      {:error, data, status_code}
    else
      {:ok, data, status_code}
    end
  end

  defp get(url, headers) do
    url
    |> Tempestas.API.AppleWeatherKitAPIBase.get(headers)
    |> case do
      {:ok, %{body: raw, status_code: code, headers: response_headers}} ->
        {code, raw, response_headers}

      {:error, %{reason: reason}} ->
        {:error, reason, nil}
    end
    |> (fn {ok, body, headers} ->
          try do
            body
            |> Poison.decode(keys: :atoms)
            |> case do
              {:ok, parsed} -> {ok, parsed, headers}
              _ -> {ok, body, headers}
            end
          rescue
            ArgumentError -> {:error, body, headers}
          end
        end).()
  end
end

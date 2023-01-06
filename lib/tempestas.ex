defmodule Tempestas do
  @moduledoc """
  Documentation for `Tempestas`.
  """

  @doc """
  Get the current weather for a current latitude and longitude.
  `lat`: The latitude of the location to check the weather.
  `long`: The longitude of the location to check the weather.
  `language`: The language to get a localized response in. Default: English
  `timezone`: The timezone the server should reply with for times. Default: UTC Timezone
  `data_sets`: A enumerable of the data you're requesting, supported values are: currentWeather, forecastDaily, forecastHourly, forecastNextHour, weatherAlerts. Default: currentWeather only
  `country_code`: ISO Alpha-2 country code of the requested location. Only required if you wish to get weather alerts. 

  ## Example:

      iex> Tempestas.get_weather(55.42966, 13.82041)

  """
  def get_weather(
        lat,
        long,
        language \\ "en",
        timezone \\ "GMT/UTC",
        data_sets \\ ["currentWeather"],
        country_code \\ nil
      ) do
    Tempestas.API.Rest.wrapped_get(
      "https://weatherkit.apple.com/api/v1/weather/#{language}/#{lat}/#{long}?timezone=#{timezone}&dataSets=#{Enum.join(data_sets, ",")}&countryCode=#{country_code}"
    )
  end
end

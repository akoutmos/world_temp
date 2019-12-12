defmodule WorldTemp.TempFetcher do
  require Logger

  @api_key "YOUR_API_KEY_GOES_HERE"

  def fetch_data(city, country) do
    city
    |> generate_url(country)
    |> HTTPoison.get()
    |> handle_response()
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    body
    |> Jason.decode!()
    |> get_in(["main", "temp"])
  end

  defp handle_response(resp) do
    Logger.warn("Failed to fetch temperature data: #{inspect(resp)}")

    :error
  end

  defp generate_url(city, country) do
    "http://api.openweathermap.org/data/2.5/weather?q=#{city},#{country}&appid=#{@api_key}"
  end
end

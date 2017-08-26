defmodule Relister.Seed do
    def seed do
        HTTPoison.start
        HTTPoison.get("https://esi.tech.ccp.is/latest/universe/regions/?datasource=tranquility")
        |> handle_response
        |> elem(1)
        |> Logger.info                
        |> Enum.map(&Task.async(fn -> fetch_region(&1)end))
        |> Enum.map(&Task.await(&1, 30000))
        
    end

    def find_region_url(id) do
        "https://esi.tech.ccp.is/latest/universe/regions/#{id}/?datasource=tranquility&language=en-us"
    end

    def fetch_region(region) do
        find_region_url(region)
        |> HTTPoison.get
        |> handle_response 
        |> elem(1)                
        |> get_constellations
        |> IO.inspect
    end

    defp handle_response({:ok, %HTTPoison.Response{body: body}}) do
        Poison.decode body
    end

    defp get_constellations(response) do
        response["constellations"]
    end

end
class SearchFacade

  def initialize(query)
    @query = query
  end

  def stations
    json_data
  end

  def json_data
    JSON.parse(conn.body, symbolize_names: true)
  end

  def conn
    Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['API_KEY']}&location=#{@query}&radius=6&fuel_type=ELEC,LPG&limit=10")
  end

end

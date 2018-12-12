class SearchFacade

  def stations

  end

  def conn
    Faraday.get('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=5N20sQn0jkCpVhdOEsoF3P43gvUKL5kx5F5Htuba&location=80203&radius=6&fuel_type=ELEC,LPG&limit=10')
  end

end

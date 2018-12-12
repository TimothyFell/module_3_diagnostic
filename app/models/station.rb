class Station

  attr_reader :name,
              :street_address,
              :city,
              :state,
              :country,
              :zip,
              :fuel_type,
              :distance,
              :access_times

  def initialize(json_data)
    @name = json_data[:station_name]
    @street_address = json_data[:street_address]
    @city = json_data[:city]
    @state = json_data[:state]
    @country = json_data[:country]
    @zip = json_data[:zip]
    @fuel_type = json_data[:fuel_type_code]
    @distance = json_data[:distance]
    @access_times = json_data[:access_days_time]
  end

end

require_relative 'services/neo_service.rb'

class Nasa

  def neo_service start_date, end_date
    NeoService.new start_date, end_date
  end

end

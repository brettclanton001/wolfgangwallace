class ShowService

  def initialize(data)
    @data = data
  end

  def future?
    @data['date'] >= Time.now.to_date
  end
end

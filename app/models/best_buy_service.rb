class BestBuyService

  attr_reader :api_key, :connection

  def initialize
    @connection = Faraday.new("http://api.bestbuy.com/v1")
    @api_key = ENV["API_KEY"]
  end

  def products(name)
    parse(connection.get("products?format=json&apiKey=#{api_key}"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end

class BestBuyService

  attr_reader :api_key, :connection

  def initialize
    @connection = Faraday.new("http://api.bestbuy.com/v1")
    # @connection.headers = {"apiKey" => ENV["API_KEY"]}
    @api_key = ENV['API_KEY']
  end

  def products(name)
    data = parse(connection.get("products?format=json&show=sku,name,salePrice&apiKey=#{api_key}"))
  end

  def single_product_data(name)
    data = products(name)[:products].map do |product|
      sku = product[:sku]
      parse(connection.get"products/#{sku}.json?apiKey=#{api_key}")
    end
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end

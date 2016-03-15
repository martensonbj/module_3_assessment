class BestBuyService

  attr_reader :api_key, :connection

  def initialize
    @connection = Faraday.new("http://api.bestbuy.com/v1")
    @api_key = ENV['API_KEY']
  end

  def get_search_input(input)
    if input.split.count > 1
      input.split.map {|word| "search=" + word + "&"}.join[0..-2]
    else
      "search=#{input}"
    end
  end

  def products(name)
    search_criteria = get_search_input(name)
    data = parse(connection.get("products(#{search_criteria})?format=json&pageSize=15&apiKey=#{api_key}"))
    data[:products]
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end

module Riot

  # TODO: set key as environment variable
  API_KEY = Rails.application.secrets.riot_api

  def self.get_from_api(path)
    full_path = "https://global.api.pvp.net" + path + "&api_key=#{API_KEY}"
    uri = URI(full_path)
    http = Net::HTTP.new(uri.hostname, uri.port)
    http.use_ssl = true
    response = http.request(Net::HTTP::Get.new(uri, _header = {'Content-Type' =>'application/json'}))

    case response
    when Net::HTTPSuccess
      return JSON.parse(response.body)
    when Net::HTTPNotFound
      raise "Couldn't find it"
    else
      raise "Error when trying to access #{path}
           Response #{response.code} #{response.message}:
          #{response.body}"
    end
  end

  def self.get_items(*data)
    items_path = "/api/lol/static-data/br/v1.2/item?"
    items_path.concat("itemListData=#{set_data(data)}") if data.any?
    get_from_api(items_path)
  end

  def self.get_champions(*data)
    champions_path = "/api/lol/static-data/br/v1.2/champion?"
    champions_path.concat("champData=#{set_data(data)}") if data.any?
    get_from_api(champions_path)
  end

  private
  def self.set_data(data)
    data.map { |d| d.to_s }.join(',')
  end

end
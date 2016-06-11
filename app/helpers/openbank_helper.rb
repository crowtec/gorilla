module OpenbankHelper

  def auth
    base_url = 'https://apisandbox.openbankproject.com'
    uri = URI.parse(base_url + "/my/logins/direct")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
    request["Authorization"] = "DirectLogin username=#{ENV['OPENBANK_USER']}, password=#{ENV['OPENBANK_PASSWORD']}, consumer_key=#{ENV['OPENBANK_CONSUMER_KEY']}"

    request.body = ""

    p request.to_json
    response = http.request(request)
    p response.body
  end
end
module OpenbankHelper

  def auth
    @base_url = 'https://apisandbox.openbankproject.com'

    uri = URI.parse(@base_url + "/my/logins/direct")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
    request["Authorization"] = "DirectLogin username=#{ENV['OPENBANK_USER']}, password=#{ENV['OPENBANK_PASSWORD']}, consumer_key=#{ENV['OPENBANK_CONSUMER_KEY']}"

    request.body = ""
    response = http.request(request)

    response.body
  end

  def pay article, amount
    @base_url = 'https://apisandbox.openbankproject.com'
    token = JSON.parse(auth)['token']
    p token
    uri = URI.parse(@base_url + "/obp/v2.0.0/banks/at03-bank-x/accounts/ee908b8c-e163-4005-8bf7-9a66f066a0d7/owner/transaction-request-types/SANDBOX_TAN/transaction-requests")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    params = {
        to:
          {    bank_id: "at03-bank-x",
              account_id: "ee908b8c-e163-4005-8bf7-9a66f066a0d7"
          },
        value:
              {
                  currency:"GBP",
                  amount: amount
              },
        description: "Article #{article} paid succesfully. Total amount: #{amount}"
    }
    request = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
    request["Authorization"] = "DirectLogin token=#{token}"

    request.body = params.to_json
    response = http.request(request)
    response.body
  end
end
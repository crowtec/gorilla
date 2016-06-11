class Transaction
  include Mongoid::Document
  include Mongoid::Timestamp

  field :transaction_id, type: String
  field :from_account_id, type: String
  field :from_bank_id, type: String
  field :to_account_id, type: String
  field :to_bank_id, type: String
  field :amount, type: String
  field :currency, type: String
  field :description, type: String
  field :user_status, type: String
  field :voice_test, type: String
end

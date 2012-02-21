module Zuora
  class SubscribeRequest < ZObject
    def self.create(args={})
      self.client.subscribe([self.new(args).to_zobject])
    end

    def save
      result = self.class.client.subscribe([self.to_zobject])
      self.account.id = result.accountId
      result.success
    end
  end
end

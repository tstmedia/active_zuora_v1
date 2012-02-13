module Zuora
  class PaymentMethod < ZObject
    def self.excluded_attributes(attributes=[])
      super([:achAccountNumber, :creditCardNumber, :creditCardSecurityCode])
    end

    def account
      @account ||= Account.find(self.accountId)
    end
  end
end

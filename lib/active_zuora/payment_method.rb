module Zuora
  class PaymentMethod < ZObject

    exclude_query_attributes :achAccountNumber, :creditCardNumber, :creditCardSecurityCode

    def account
      @account ||= Account.find(self.accountId)
    end
  end
end

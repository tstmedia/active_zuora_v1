module Zuora
  class PaymentMethod < ZObject
    def self.excluded_attributes(attributes=[])
      super([:achAccountNumber, :creditCardNumber, :creditCardSecurityCode])
    end
  end
end

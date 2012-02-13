module Zuora
  class RatePlanCharge < ZObject
    def self.excluded_query_attributes(attributes=[])
      super([:overagePrice, :includedUnits, :discountAmount, :discountPercentage])
    end
  end
end

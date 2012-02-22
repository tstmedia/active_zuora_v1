module Zuora
  class RatePlanCharge < ZObject
    def self.excluded_query_attributes(attributes=[])
      super([:overagePrice, :includedUnits, :discountAmount, :discountPercentage])
    end

    def rate_plan
      @rate_plan ||= RatePlan.find(self.ratePlanId)
    end
  end
end

module Zuora
  class RatePlanCharge < ZObject
    def self.excluded_query_attributes(attributes=[])
      super([:overagePrice, :includedUnits, :discountAmount, :discountPercentage])
    end

    def rate_plan
      @rate_plan ||= RatePlan.find(self.ratePlanId)
    end

    def product_rate_plan_charge
      @product_rate_plan_charge ||= ProductRatePlanCharge.find(self.productRatePlanChargeId)
    end
  end
end

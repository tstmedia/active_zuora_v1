module Zuora
  class RatePlanCharge < ZObject
    
    exclude_query_attributes :overagePrice, :includedUnits, :discountAmount, :discountPercentage

    def rate_plan
      @rate_plan ||= RatePlan.find(self.ratePlanId)
    end

    def product_rate_plan_charge
      @product_rate_plan_charge ||= ProductRatePlanCharge.find(self.productRatePlanChargeId)
    end

    def total_price
      (quantity || 1) * price
    end

  end
end

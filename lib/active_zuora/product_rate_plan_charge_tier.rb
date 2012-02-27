module Zuora
  class ProductRatePlanChargeTier < ZObject
    def product_rate_plan_charge
      @product_rate_plan_charge ||= ProductRatePlanCharge.find(self.productRatePlanChargeId)
    end
  end
end

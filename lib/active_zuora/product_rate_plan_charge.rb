module Zuora
  class ProductRatePlanCharge < ZObject
    def product_rate_plan
      @product_rate_plan ||= ProductRatePlan.find(self.ProductRatePlanId)
    end

    def product_rate_plan_charge_tiers
      @product_rate_plan_charge_tiers ||= ProductRatePlanChargeTier.where(:productRatePlanChargeId => self.id)
    end
  end
end

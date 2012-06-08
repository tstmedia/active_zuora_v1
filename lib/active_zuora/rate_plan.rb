module Zuora
  class RatePlan < ZObject
    def rate_plan_charges
      @rate_plan_charges ||= RatePlanCharge.where(:ratePlanId => self.id)
    end

    def subscription
      @subscription ||= Subscription.find(self.subscriptionId)
    end

    def product_rate_plan
      @product_rate_plan ||= ProductRatePlan.find(self.productRatePlanId)
    end

  end
end

module Zuora
  class RatePlan < ZObject
    def rate_plan_charges
      @rate_plan_charges ||= RatePlanCharge.where(:ratePlanId => self.id)
    end

    def subscription
      @subscription ||= Subscription.find(self.subscriptionId)
    end
  end
end

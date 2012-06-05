module Zuora
  class Subscription < ZObject

    def account
      @account ||= Account.find(self.accountId)
    end

    def rate_plans
      @rate_plans ||= RatePlan.where(:subscriptionId => self.id)
    end

    def unload_rate_plans
      @rate_plans = nil
    end

  end
end

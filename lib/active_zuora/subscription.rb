module Zuora
  class Subscription < ZObject

    def account
      @account ||= Account.find(self.accountId)
    end

    def rate_plans
      @rate_plans ||= RatePlan.where(:subscriptionId => self.id)
    end
  end
end

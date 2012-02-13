module Zuora
  class Subscription < ZObject

    def account
      @account ||= Account.find(self.accountId)
    end
  end
end

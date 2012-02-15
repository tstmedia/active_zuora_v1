module Zuora
  class Contact < ZObject
    def account
      @account ||= Account.find(self.accountId)
    end
  end
end

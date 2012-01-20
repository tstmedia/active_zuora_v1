module Zuora
  class Account < ZObject
    def billTo
      @billTo ||= Contact.find(self.billToId)
    end

    def soldTo
      @soldTo ||= Contact.find(self.soldToId)
    end
  end
end

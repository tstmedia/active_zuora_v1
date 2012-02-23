module Zuora
  class Invoice < ZObject
    def self.extra_attributes(attributes=[])
      super([:body])
    end

    def self.create(attributes={})
      self.generate([self.new(args).to_zobject])
    end

    def save
      result = self.generate([self.to_zobject])
      self.id = result.id
      result.success
    end

    def invoice_items
      @invoice_items ||= InvoiceItem.where(:invoiceid => self.id)
    end

    def account
      @account ||= Account.find(self.accountId)
    end

    def payments
      @invoice_payments ||= InvoicePayment.where(:invoiceid => self.id)
    end
  end
end

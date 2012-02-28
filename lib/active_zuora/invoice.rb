module Zuora
  class Invoice < ZObject
    def self.extra_attributes(attributes=[])
      super([:body])
    end

    def self.create(attributes={})
      self.client.generate([self.new(attributes).to_zobject]).first
    end

    def save
      result = self.class.create(self.attributes)
      if result[:success]
        @errors = []
        __setobj__(self.class.find(result[:id]).to_zobject)
      else
        @errors = result[:errors]
      end
      result[:success]
    end

    def errors
      @errors || []
    end

    def post
      return false unless self.id
      result = self.class.update_attributes(:id => self.id, :status => "Posted").first
      @errors = result[:errors]
      result[:success]
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

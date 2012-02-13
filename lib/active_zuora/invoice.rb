module Zuora
  class Invoice < ZObject
    def self.excluded_query_attributes(attributes=[])
      super([:body])
    end

    def invoice_items
      @invoice_items ||= InvoiceItem.where(:invoiceid => self.id)
    end

    def account
      @account ||= Account.find(self.accountId)
    end
  end
end

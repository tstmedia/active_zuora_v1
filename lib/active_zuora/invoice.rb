module Zuora
  class Invoice < ZObject
    def self.excluded_attributes(attributes=[])
      super([:body])
    end

    def invoice_items
      @invoice_items ||= InvoiceItem.where(:invoiceid => self.id)
    end
  end
end

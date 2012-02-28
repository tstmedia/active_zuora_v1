module Zuora
  class Payment < ZObject
    def self.excluded_query_attributes(attributes=[])
      super([:appliedInvoiceAmount, :invoiceId])
    end
  end
end

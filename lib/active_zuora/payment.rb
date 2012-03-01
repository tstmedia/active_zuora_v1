module Zuora
  class Payment < ZObject
    def self.excluded_query_attributes(attributes=[])
      super([:appliedInvoiceAmount, :invoiceId])
    end

    def account
      @account ||= Account.find(self.accountId)
    end

    def payment_method
      @payment_method ||= PaymentMethod.find(self.paymentMethodId)
    end

    def invoices
      @invoices ||= InvoicePayment.where(:paymentId => self.id).map(&:invoice)
    end
  end
end

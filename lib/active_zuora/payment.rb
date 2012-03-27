module Zuora
  class Payment < ZObject
    
    exclude_query_attributes :appliedInvoiceAmount, :invoiceId

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

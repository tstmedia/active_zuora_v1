module Zuora
  class InvoicePayment < ZObject
    def invoice
      @invoice ||= Invoice.find(self.invoiceId)
    end

    def payment
      @payment ||= Payment.find(self.paymentId)
    end
  end
end

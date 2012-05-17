module Zuora
  class InvoiceItem < ZObject

    def invoice
      @invoice ||= Invoice.find(invoiceId)
    end

    def adjustments
      @adjustments ||= InvoiceItemAdjustment.where(:sourceType => 'InvoiceDetail', :sourceId => id)
    end

    def adjusted_charge_amount
      @adjusted_charge_amount ||=
        adjustments.inject(chargeAmount) do |amount, adjustment|
          # Adjustment types are either Credit or Charge
          # Credits will have a reducing (subtracting) effect on the invoice item charge.
          adjustment.type == "Credit" ? amount - adjustment.amount : amount + adjustment.amount
        end
    end

  end
end

module Zuora
  class ProductRatePlan < ZObject

    def charges
      @charges ||= ProductRatePlanCharge.where(:productRatePlanId => id)
    end

  end
end

module Zuora
  class Invoice < ZObject
    def self.excluded_attributes(attributes=[])
      super([:body])
    end
  end
end

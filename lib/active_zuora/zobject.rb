module Zuora
  class ZObject < SimpleDelegator
    def initialize(attributes={})
      super(self.class.zobject_class.new).tap do |zobject|
        attributes.each do |attr, value|
          zobject.send("#{attr}=", value)
        end
      end
    end

    def to_zobject
      __getobj__
    end

    def id
      __getobj__.id
    end

    def self.zobject_class
      return @zobject_class if @zobject_class
      klass_name = name.split("::").last
      if ZUORA.const_defined?(klass_name)
        @zobject_class = ZUORA.const_get(klass_name)
      else
        @zobject_class = self.superclass.respond_to?(:zobject_class) ? self.superclass.zobject_class : ZUORA.const_missing(klass_name)
      end
    end

    #TODO: This sucks attributes need to be clearly defined
    def self.attribute_names
      @attribute_names ||= zobject_class.instance_variable_get("@attributes").reject{|name| self.excluded_attributes.include? name  }
    end

    def self.excluded_attributes(attributes=[])
      [:fieldsToNull] + attributes
    end

    def self.where(conditions={})
      query = "select #{self.attribute_names.join(", ")} from #{self.name.gsub(/Zuora::/,"")} where #{build_filter_statments(conditions)}"
      puts query if $DEBUG
      zobjects = self.client.query(query)
      zobjects.map{|zobject| self.new zobject }
    end

    def self.build_filter_statments(filter_statments)
      filter_statments.map{|key, value|
        value = "'#{value}'" if value.kind_of?(String)
        "#{key} = #{value}"
      }.join(" and ")
    end

    def self.find(id)
      query = "select #{attribute_names.join(", ")} from #{self.name.gsub(/Zuora::/,"")} where Id = '#{id}'"
      puts query if $DEBUG
      zobject = client.query(query).first
      self.new zobject if zobject
    end

    def self.all
      zobjects = client.query("select #{attribute_names.join(", ")} from #{self.name.gsub(/Zuora::/,"")}")
      zobjects.map{|zobject| self.new zobject }
    end

    def self.client
      @client ||= Zuora::Client.new
    end
  end
end

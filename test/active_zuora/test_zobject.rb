require 'helper'
require 'delegate'

require 'active_zuora/zobject'
module ZUORA
  class ZObject
    @attributes = [:herp, :derp, :fieldsToNull]
  end
end
describe Zuora::ZObject do
  it "delegates to the ZUORA zobject" do
    Zuora::ZObject.new.must_be_instance_of ZUORA::ZObject
  end

  describe ".attribute_names" do
    it "grabs all of the ZUORA Zobject attributes minus the excluded attributes" do
      Zuora::ZObject.attribute_names.must_equal [:herp, :derp]
    end
  end

  describe ".excluded_attributes" do
    it "includes :fieldsToNull plus any other attributes that are passed in" do
      Zuora::ZObject.excluded_attributes([:herp]).must_equal [:fieldsToNull, :herp]
    end
  end

  describe ".where" do
    it "should call query on its client with the correct ZOQL syntax" do
      @client = MiniTest::Mock.new.expect(:query, [], "select herp, derp from ZObject where id = 'blarg'")
      Zuora::ZObject.instance_eval do
        self.send(:define_method, :client) do
          @client
        end
      end
      Zuora::ZObject.where(:id => "blarg")
      @client.verify
    end
  end
end

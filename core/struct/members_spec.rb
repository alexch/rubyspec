require File.dirname(__FILE__) + '/../../spec_helper'
require File.dirname(__FILE__) + '/fixtures/classes'

describe "Struct#members" do
  ruby_version_is ""..."1.9" do
    it "returns an array of attribute names" do
      Struct::Car.new.members.should == %w(make model year)
      Struct::Car.new('Cadillac').members.should == %w(make model year)
      Struct::Ruby.members.should == %w(version platform)
    end
  end

  ruby_version_is "1.9" do
    it "returns an array of attribute names" do
      Struct::Car.new.members.should == [:make, :model, :year]
      Struct::Car.new('Cadillac').members.should == [:make, :model, :year]
      Struct::Ruby.members.should == [:version, :platform]
    end
  end
end

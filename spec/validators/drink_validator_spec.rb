require 'spec_helper'

describe :drink_validations do

  before do
    Drink::DRINK_TYPES[:no_aspects] = []
    Drink::DRINK_TYPES[:simple_aspect] = [:strength]
    Drink::DRINK_TYPES[:complex_aspect] = [:milk]
  end

  describe :drink_type do

    it "drink must have a drink_type" do
      FactoryGirl.build(:drink).should_not be_valid
      FactoryGirl.build(:drink, :drink_type => :no_aspects).should be_valid
    end

    it "drink's drink_type must be one of available drink type" do
      FactoryGirl.build(:drink, :drink_type => :cake).should_not be_valid
    end
  end

  describe :simple_aspect_drink do
    it "should not be valid if missing aspect" do
      FactoryGirl.build(:drink, :drink_type => :simple_aspect).should_not be_valid
    end
    it "should not be valid if aspect is wrong" do
      FactoryGirl.build(:drink, :drink_type => :simple_aspect, :strength => :lol).should_not be_valid
    end
    it "should be valid if aspect is present and part of valid values" do
      FactoryGirl.build(:drink, :drink_type => :simple_aspect, :strength => :normal).should be_valid
    end
  end

  describe :complex_aspect_drink do
    it "should not be valid if any of the aspects are missing" do
      FactoryGirl.build(:drink, :drink_type => :complex_aspect, :milk_type => :soy).should_not be_valid
    end

    it "should not be valid if any of the aspects are invalid" do
      FactoryGirl.build(:drink, :drink_type => :complex_aspect, :milk_type => :lol, :milk_amount => :none).should_not be_valid
    end

    it "should be valid if all aspects present and valid" do
      FactoryGirl.build(:drink, :drink_type => :complex_aspect, :milk_type => :soy, :milk_amount => :none).should be_valid
    end
  end


end
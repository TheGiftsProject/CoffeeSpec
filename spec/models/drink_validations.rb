describe :drink_validations do

  it "drink should not be valid if no name" do
    Drink.new().should_not be_valid
  end

end
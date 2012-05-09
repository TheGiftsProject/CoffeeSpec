DrinkType.create(:value => :coffee)
DrinkType.create(:value => :tea)

SugarType.create(:value => :white)
SugarType.create(:value => :brown)
SugarType.create(:value => :artificial)

SugarAmount.create(:value => 0.0)
SugarAmount.create(:value => 0.5)
SugarAmount.create(:value => 1.0)
SugarAmount.create(:value => 1.5)
SugarAmount.create(:value => 2.0)
SugarAmount.create(:value => 3.0)

MilkType.create(:value => :regular)
MilkType.create(:value => :low_fat)
MilkType.create(:value => :soy)

MilkAmount.create(:value => :none)
MilkAmount.create(:value => :touch)
MilkAmount.create(:value => :little)
MilkAmount.create(:value => :third)
MilkAmount.create(:value => :half)
MilkAmount.create(:value => :max)

Strength.create(:value => :light)
Strength.create(:value => :normal)
Strength.create(:value => :strong)

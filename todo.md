## Todo

* Separate User from company
* improve edit page to support hiding sugar_type/milk_type when selecting 0 sugar/milk
* Add note to drink
* Add variation to drink
* seperate drink string building to different class and improve it
* Enable simple sharing - view sheet
* Enable company sharing - sharing with creation + edit capabilities
* Good Print css
* Support all combinations of drinks
* Maybe move to canvas to draw drink (seems canvas support prints)
* Add Juice, Black Coffee, Espresso, Latte, Water


User:
* Name
* Tokens
* Company

Company:
* Drinks
* Admin (User)

Drink:
* name (employee)
* Company
* DrinkType
* DrinkVariation
* SelectedDrinkAspects

DrinkType:
* name (coffee, tea, water, juice)
* DrinkVariations
* DrinkAspects

DrinkVariation:
* DrinkType
* value (regular, filter, nuts | orange juice grapefruit... | earl grey , fruit)

DrinkAspect:
* name: (Sugar, Milk, Strength / sugar_type, milk_amount)
* SubDrinkAspects
* DrinkAspectValues
* ParentDrinkAspect

DrinkAspectValue:
* DrinkAspect
* value (low fat | soy | regular)

SelectedDrinkAspect:
* Drink
* DrinkAspectValue
* DrinkAspect (via DAV) uniq

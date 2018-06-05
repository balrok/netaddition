P:Button_Coffee -> P:Coffee
P:Button_Milk -> P:Milk
P:Button_Cappuccino -> P:Cappuccino

P:Button_Start
P:Running

T:Start - P:running inhibits
T:End - clear P:RUNNING


P:Preparing -> P:Dispending -> T:End


Subnets:
	P:Preparing:
		Milksubnet
		P:IN -> T -> P:GetMilk -> T -> Heating -> T-> P:OUT

		Coffee subnet
		P:IN -> T -> P:GetWater -> T -> Heating -> T-> P:OUT
			 -> T -> Grind:Coffee -> T -> P:OUT

New ideas:
	* reqn always connected from place
	* a single deactivation transition at the end
	* one page enabled by two pages means either page would start this -> two starting transitions


TODO:
* Deadlock-scenario
	+ When one of the pages does not fire context will never be activated
	+ Only one heater can be active
		- can not be expressed with my syntax
			- no cross-page-reference
			- no multiple inputs
* Why do we need cappucino? - just press espresso+milk
	+ OK - but it is Nicer - and could add some twist

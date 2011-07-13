describe "bar offsets", -> 
		
	it "grow data values for additive elements", ->
		(expect tops([100, 20])).toEqual [100,120]

	it "shrink data values of negative elements", ->
		(expect tops([100, -40])).toEqual [100, 60]
  
	it "grow 2", ->
		(expect tops([100, 40, 40])).toEqual [100, 140, 180]

	it "error", ->
		(expect "right").toEqual "wrong"

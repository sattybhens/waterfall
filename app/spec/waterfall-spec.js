(function() {
  describe("bar offsets", function() {
    it("grow data values for additive elements", function() {
      return (expect(tops([100, 20]))).toEqual([100, 120]);
    });
    it("shrink data values of negative elements", function() {
      return (expect(tops([100, -40]))).toEqual([100, 60]);
    });
    it("grow 2", function() {
      return (expect(tops([100, 40, 40]))).toEqual([100, 140, 180]);
    });
    return it("error", function() {
      return (expect("right")).toEqual("wrong");
    });
  });
}).call(this);

const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("TestPRBMath", function () {
  let testPrbMath;

  // Deploy the contract before each test
  beforeEach(async function () {
    const TestPRBMath = await ethers.getContractFactory("TestPRBMath2");
    testPrbMath = await TestPRBMath.deploy();
  });

  // Test case to verify precision with base = 5, exponent = 3
  it("Should return true for precision PRBMath", async function () {
    const base = ethers.parseUnits("5", 18); // 5 with 18 decimal places
    const exponent = ethers.parseUnits("3", 18); // 3 with 18 decimal places
    const expected = ethers.parseUnits("125", 18); // 125000 with 18 decimal places

    expect(
      await testPrbMath.testPRBMathPrecision(base, exponent, expected)
    ).to.equal(true);
  });

  // Test case to verify precision with base = 3, exponent = 3
  it("Should return true for precision checkLogExpMath", async function () {
    const base = ethers.parseUnits("5", 18);
    const exponent = ethers.parseUnits("3", 18);
    const expected = ethers.parseUnits("125", 18);

    expect(
      await testPrbMath.testLogExpMathPrecision(base, exponent, expected)
    ).to.equal(true);
  });
});

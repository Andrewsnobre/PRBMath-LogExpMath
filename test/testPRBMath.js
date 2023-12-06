const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("TestPRBMath", function () {
  let testPrbMath;

  // Deploy the contract before each test
  beforeEach(async function () {
    const TestPRBMath = await ethers.getContractFactory("TestPRBMath");
    testPrbMath = await TestPRBMath.deploy();
  });

  // Test case to verify precision with base = 50, exponent = 3
  it("Should return true for precision check with base 50 and exponent 3", async function () {
    const base = ethers.parseUnits("50", 18); // 50 with 18 decimal places
    const exponent = ethers.parseUnits("3", 18); // 3 with 18 decimal places
    const expected = ethers.parseUnits("125000", 18); // 125000 with 18 decimal places

    expect(await testPrbMath.testPrecision(base, exponent, expected)).to.equal(
      true
    );
  });

  // Test case to verify precision with base = 3, exponent = 3
  it("Should return true for precision check with base 3 and exponent 3", async function () {
    const base = ethers.parseUnits("3", 18); // 3 with 18 decimal places
    const exponent = ethers.parseUnits("3", 18); // 3 with 18 decimal places
    const expected = ethers.parseUnits("27", 18); // 27 with 18 decimal places

    expect(await testPrbMath.testPrecision(base, exponent, expected)).to.equal(
      true
    );
  });
});

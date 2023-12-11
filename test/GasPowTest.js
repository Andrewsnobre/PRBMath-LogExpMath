const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Gas used pow function: (PRBMath x LogExpMath X PRBMathlastversion)", function () {
  let testPrbMath;
  let base;
  let exponent;
  let expected;

  before(async function () {
    const TestPRBMath = await ethers.getContractFactory("Pow");
    testPrbMath = await TestPRBMath.deploy();
    // Set the values for the test
    base = ethers.parseUnits("5", 18);
    exponent = ethers.parseUnits("3", 18);
    expected = ethers.parseUnits("125", 18); // 2^3 = 8
  });

  it("Measures gas usage of the PRBMath function", async function () {
    const tx = await testPrbMath.testPRBMathPrecision(base, exponent);
    const receipt = await tx.wait();
    console.log(`Gas used by PRBMath: ${receipt.gasUsed.toString()}`);
  });

  it("Measures gas usage of the LogExpMath function", async function () {
    const tx = await testPrbMath.testLogExpMathPrecision(base, exponent);
    const receipt = await tx.wait();
    console.log(`Gas used by LogExpMath: ${receipt.gasUsed.toString()}`);
  });

  it("Measures gas usage of the PRBMathlastversion function", async function () {
    const tx = await testPrbMath.testPRBMathLastVersionPrecision(
      base,
      exponent
    );
    const receipt = await tx.wait();
    console.log(
      `Gas used by PRBMathlastversion: ${receipt.gasUsed.toString()}`
    );
  });
});

//unsignedPercentage

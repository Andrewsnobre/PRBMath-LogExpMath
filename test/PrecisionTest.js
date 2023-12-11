const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Precision test: (PRBMath x LogExpMath X PRBMathlastversion)", function () {
  let testPrbMath;
  let base;
  let exponent;
  let expected;

  before(async function () {
    const TestPRBMath = await ethers.getContractFactory("TestPRBMath2");
    testPrbMath = await TestPRBMath.deploy();
    // Set the values for the test
    base = ethers.parseUnits("50", 18);
    exponent = ethers.parseUnits("3", 18);
    expected = ethers.parseUnits("125000", 18);
  });

  it("Measures precision PRBMath function", async function () {
    const tx = await testPrbMath.testPRBMathPrecision(base, exponent, expected);
    const receipt = await tx.wait();
    // console.log(`Gas used by PRBMath: ${receipt.gasUsed.toString()}`);
  });

  it("Measures precision LogExpMath function", async function () {
    const tx = await testPrbMath.testLogExpMathPrecision(
      base,
      exponent,
      expected
    );
    const receipt = await tx.wait();
    // console.log(`Gas used by LogExpMath: ${receipt.gasUsed.toString()}`);
  });

  it("Measures precision PRBMath(lastversion) function", async function () {
    const tx = await testPrbMath.testPRBMathLastVersionPrecision(
      base,
      exponent,
      expected
    );

    const receipt = await tx.wait();
    // console.log(`Gas used by NewMath: ${receipt.gasUsed.toString()}`);
  });
});

//unsignedPercentage

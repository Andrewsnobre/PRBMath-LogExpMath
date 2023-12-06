const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("TestPRBMath", function () {
  it("Should return true if the precision is within acceptable limits", async function () {
    const TestPRBMath = await ethers.getContractFactory("TestPRBMath");
    const testPrbMath = await TestPRBMath.deploy();

    // Não precisa mais desta linha:
    // await testPrbMath.deployed();

    expect(await testPrbMath.testPrecision()).to.equal(true);
  });
});

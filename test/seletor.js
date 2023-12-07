const ethers = require("ethers");

function calculateFunctionSelector(functionSignature) {
  return ethers.keccak256(ethers.toUtf8Bytes(functionSignature)).slice(0, 10);
}

const selector = calculateFunctionSelector("testPow(uint256,uint256)");
console.log(selector); // Saída: 0x(seletor de 4 bytes)

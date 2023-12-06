// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "prb-math/contracts/PRBMathUD60x18.sol";

contract TestPRBMath {
    function testPow(uint256 base, uint256 exponent) public pure returns (uint256) {
        return PRBMathUD60x18.pow(base, exponent);
    }
}

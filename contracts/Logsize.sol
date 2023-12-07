// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./LogExpMath.sol"; 

contract Test {
    function testPow(uint256 base, uint256 exponent) public pure returns (uint256) {
        return LogExpMath.pow(base, exponent);
    }
}

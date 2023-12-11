// SPDX-License-Identifier: MITfff
pragma solidity >=0.8.19;
import {UD60x18, ud, convert, intoUint256} from "@prb/math/src/UD60x18.sol";
import "prb-math/contracts/PRBMathUD60x18.sol";
import "./LogExpMath.sol";
import "hardhat/console.sol";

contract Pow {
    function   testPRBMathLastVersionPrecision(
        UD60x18 base,
        UD60x18 exponent
    ) public returns (UD60x18 result) {
        UD60x18 A = base.pow(exponent);
    }

    function testPRBMathPrecision(
        uint256 base,
        uint256 exponent
    ) public returns (bool) {
        uint256 result = PRBMathUD60x18.pow(base, exponent);
    }

    function testLogExpMathPrecision(
        uint256 base,
        uint256 exponent
    ) public returns (bool) {
        uint256 result = LogExpMath.pow(base, exponent);
    }
}

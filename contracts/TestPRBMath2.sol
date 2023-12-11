// SPDX-License-Identifier: MITfff
pragma solidity >=0.8.19;
import {UD60x18, ud, convert, intoUint256} from "@prb/math/src/UD60x18.sol";
import "prb-math/contracts/PRBMathUD60x18.sol";
import "./LogExpMath.sol";
import "hardhat/console.sol";

contract TestPRBMath2 {
    // Constant acceptable error limit
    uint256 private constant ACCEPTABLE_ERROR_LIMIT = 2000; //%

    // Function to test precision using PRBMath
    function    testPRBMathLastVersionPrecision(
        UD60x18 base,
        UD60x18 exponent,
        UD60x18 expected
    ) public returns (UD60x18 result) {
        UD60x18 A = base.pow(exponent);

        uint256 diff = _calculateDifference(
            intoUint256(A),
            intoUint256(expected)
        );
        uint256 diffPercentage = _calculatePercentageDifference(
            diff,
            intoUint256(expected)
        );

        //uint256 zz1 = intoUint256(A);
        //result= diff;
        console.log(
            "PRBMathlastversion Difference (result, absolute, precision .10e18):",
            intoUint256(A),
            diff,
            diffPercentage
        );
    }

    function testPRBMathPrecision(
        uint256 base,
        uint256 exponent,
        uint256 expected
    ) public returns (bool) {
        uint256 result = PRBMathUD60x18.pow(base, exponent);

        // Calculate the absolute difference and percentage difference
        uint256 diff = _calculateDifference(result, expected);
        uint256 diffPercentage = _calculatePercentageDifference(diff, expected);

        // Log the difference
        console.log(
            "PRBMath Difference (result, absolute, precision .10e18):",
            result,
            diff,
            diffPercentage
        );

        return (diff < ACCEPTABLE_ERROR_LIMIT);
    }

    // Function to test precision using LogExpMath
    function testLogExpMathPrecision(
        uint256 base,
        uint256 exponent,
        uint256 expected
    ) public returns (bool) {
        uint256 result = LogExpMath.pow(base, exponent);

        // Calculate the absolute difference and percentage difference
        uint256 diff = _calculateDifference(result, expected);
        uint256 diffPercentage = _calculatePercentageDifference(diff, expected);

        // Log the difference
        console.log(
            "LogExpMath Difference (result, absolute, precision .10e18):",
            result,
            diff,
            diffPercentage
        );

        return (diff < ACCEPTABLE_ERROR_LIMIT);
    }

    function _calculateDifference(
        uint256 a,
        uint256 b
    ) internal pure returns (uint256) {
        return a > b ? a - b : b - a;
    }

    function _calculatePercentageDifference(
        uint256 diff,
        uint256 reference1
    ) internal pure returns (uint256) {
        return (diff * 1e18) / reference1; // Result in fixed-point notation
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "prb-math/contracts/PRBMathUD60x18.sol";
import "./LogExpMath.sol";
import "hardhat/console.sol";

contract TestPRBMath2 {
    // Constant acceptable error limit
    uint256 private constant ACCEPTABLE_ERROR_LIMIT = 20; //%

    // Function to test precision using PRBMath
    function testPRBMathPrecision(uint256 base, uint256 exponent, uint256 expected) public pure returns (bool) {
        uint256 result = PRBMathUD60x18.pow(base, exponent);

        // Calculate the absolute difference and percentage difference
        uint256 diff = _calculateDifference(result, expected);
        uint256 diffPercentage = _calculatePercentageDifference(diff, expected);

        // Log the difference
        console.log("PRBMath Difference (result,absolute, percentage):", result, diff, diffPercentage);

        return (diffPercentage < ACCEPTABLE_ERROR_LIMIT);
    }

    // Function to test precision using LogExpMath
    function testLogExpMathPrecision(uint256 base, uint256 exponent, uint256 expected) public pure returns (bool) {
        uint256 result = LogExpMath.pow(base, exponent);

        // Calculate the absolute difference and percentage difference
        uint256 diff = _calculateDifference(result, expected);
        uint256 diffPercentage = _calculatePercentageDifference(diff, expected);

        // Log the difference
        console.log("LogExpMath Difference (result,absolute, percentage):", result, diff, diffPercentage);

        return (diffPercentage < ACCEPTABLE_ERROR_LIMIT);
    }

    function _calculateDifference(uint256 a, uint256 b) internal pure returns (uint256) {
        return a > b ? a - b : b - a;
    }

    function _calculatePercentageDifference(uint256 diff, uint256 reference1) internal pure returns (uint256) {
        return diff * 1e18 / reference1; // Result in fixed-point notation
    }
}

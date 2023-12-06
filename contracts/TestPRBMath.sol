// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "prb-math/contracts/PRBMathUD60x18.sol";
import "./LogExpMath.sol";
import "hardhat/console.sol";

contract TestPRBMath {
    function testPrecision() public view returns (bool) {
        uint256 base = 5e18; // 50 in fixed-point notation
        uint256 exponent = 3e18; // 3 in fixed-point notation

        uint256 resultPRBMath = PRBMathUD60x18.pow(base, exponent);
        uint256 resultLogExpMath = LogExpMath.pow(base, exponent);
        uint256 resultHighPrecision = 125e18; // Expected result with high precision

        // Calculate the absolute difference and percentage difference
        uint256 diff = _calculateDifference(resultPRBMath, resultHighPrecision);
        uint256 diffPercentage = _calculatePercentageDifference(diff, resultHighPrecision);

        uint256 diff2 = _calculateDifference(resultLogExpMath, resultHighPrecision);
        uint256 diff2Percentage = _calculatePercentageDifference(diff2, resultHighPrecision);

        // Check if the difference is within an acceptable limit
        uint256 acceptableErrorLimit = 1e16; // Set your acceptable limit
        console.log("PRBMath Difference (absolute, percentage):", diff, diffPercentage);
        console.log("LogExpMath Difference (absolute, percentage):", diff2, diff2Percentage);

        return (diff < acceptableErrorLimit && diff2 < acceptableErrorLimit);
    }

    function _calculateDifference(uint256 a, uint256 b) internal pure returns (uint256) {
        return a > b ? a - b : b - a;
    }

    function _calculatePercentageDifference(uint256 diff, uint256 reference1) internal pure returns (uint256) {
        return diff * 1e18 / reference1; // Result in fixed-point notation
    }
}

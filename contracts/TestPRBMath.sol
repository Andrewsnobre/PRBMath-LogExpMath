// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "prb-math/contracts/PRBMathUD60x18.sol";
import "./LogExpMath.sol";
import "hardhat/console.sol";

contract TestPRBMath {
    function testPrecision() public view returns (bool) {
        uint256 base = 50e18; // 2 em notação de ponto fixo
        uint256 exponent = 3e18; // 3 em notação de ponto fixo

        uint256 resultPRBMath = PRBMathUD60x18.pow(base, exponent);
        uint256 resultLogExpMath = LogExpMath.pow(base, exponent);
        uint256 resultHighPrecision = 125000e18; // Resultado esperado com alta precisão

        // Calcule a diferença absoluta e a porcentagem de diferença
        uint256 diff = _calculateDifference(resultPRBMath, resultHighPrecision);
        uint256 diffPercentage = _calculatePercentageDifference(diff, resultHighPrecision);

        uint256 diff2 = _calculateDifference(resultLogExpMath, resultHighPrecision);
        uint256 diff2Percentage = _calculatePercentageDifference(diff2, resultHighPrecision);

        // Verifique se a diferença está dentro de um limite aceitável
        uint256 acceptableErrorLimit = 1e16; // Defina seu limite aceitável
        console.log("Diferenca PRBMath (absoluta, percentual):", diff, diffPercentage);
        console.log("Diferenca LogExpMath (absoluta, percentual):", diff2, diff2Percentage);

        return (diff < acceptableErrorLimit && diff2 < acceptableErrorLimit);
    }

    function _calculateDifference(uint256 a, uint256 b) internal pure returns (uint256) {
        return a > b ? a - b : b - a;
    }

    function _calculatePercentageDifference(uint256 diff, uint256 reference1) internal pure returns (uint256) {
        return diff * 1e18 / reference1; // Resultado em notação de ponto fixo
    }
}

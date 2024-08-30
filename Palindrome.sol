// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PalindromeNumber {
    function isPalindrome(int256 x) public pure returns (bool) {
        if (x < 0) x = -x;
        
        // Convert to uint for easier manipulation
        uint256 num = uint256(x);
        
        // Single digit numbers are palindromes
        if (num < 10) return true;
        
        // Find the highest place value
        uint256 div = 1; 
        while (num / div >= 10) {
            div *= 10;
        }
        
        while (num > 0) {
            uint256 left = num / div;
            uint256 right = num % 10;
            
            if (left != right) return false;
            
            // Remove the first and last digit
            num = (num % div) / 10;
            div /= 100;
        }
        
        return true;
    }
}

// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract TicTacToe {
    /* 
        This exercise assumes you know how to manipulate nested array.
        1. This contract checks if TicTacToe board is winning or not.
        2. Write your code in `isWinning` function that returns true if a board is winning
           or false if not.
        3. Board contains 1's and 0's elements and it is also a 3x3 nested array.
    */

    function isWinning(uint8[3][3] memory board) public pure returns (bool) {

        for (uint8 i =0; i<3;i++){
            if(board[i][0] == board[i][1] && board[i][1] == board[i][2]){
                return true;
            } //all elements in row i are equal
        }
        for (uint8 j = 0; j < 3; j++) {
            if (board[0][j] == board[1][j] && board[1][j] == board[2][j]) {
                return true; // All elements in column j are equal
            }
        }


         if (board[0][0] == board[1][1] && board[1][1] == board[2][2]) {
            return true;
        }

        // Check anti-diagonal (top-right to bottom-left)
        if (board[0][2] == board[1][1] && board[1][1] == board[2][0]) {
            return true;
        }
        return false;
    }
}

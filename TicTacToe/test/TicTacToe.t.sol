// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/TicTacToe.sol";

contract TicTacToeTest is Test {
    TicTacToe public tictactoe;

    function setUp() public {
        tictactoe = new TicTacToe();
    }

    function testIsWinning() external {
        uint8[3][3] memory board = [[1, 1, 0], [0, 1, 0], [1, 0, 1]];

        bool isWinning = tictactoe.isWinning(board);

        assertEq(isWinning, true, "expected isWinning to be true");
    }

    function testIsLosing() external {
        uint8[3][3] memory board = [[0, 1, 0], [0, 1, 0], [1, 0, 1]];

        bool isWinning = tictactoe.isWinning(board);

        assertFalse(isWinning, "expected isWinning to be false");
    }
}

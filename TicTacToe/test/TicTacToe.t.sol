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

    function testWinningRow() external {
        uint8[3][3] memory board = [[1, 1, 1], [0, 0, 1], [1, 0, 0]];
        assertEq(tictactoe.isWinning(board), true, "expected row win");
    }

    function testWinningColumn() external {
        uint8[3][3] memory board = [[1, 0, 0], [1, 0, 1], [1, 0, 0]];
        assertEq(tictactoe.isWinning(board), true, "expected column win");
    }

    function testWinningDiagonalLeftToRight() external {
        uint8[3][3] memory board = [[1, 0, 0], [0, 1, 0], [0, 0, 1]];
        assertEq(tictactoe.isWinning(board), true, "expected diagonal win");
    }

    function testWinningDiagonalRightToLeft() external {
        uint8[3][3] memory board = [[0, 0, 1], [0, 1, 0], [1, 0, 0]];
        assertEq(
            tictactoe.isWinning(board),
            true,
            "expected right to left diagonal win"
        );
    }

    function testIsLosing() external {
        uint8[3][3] memory board = [[0, 1, 0], [0, 1, 0], [1, 0, 1]];

        bool isWinning = tictactoe.isWinning(board);

        assertFalse(isWinning, "expected isWinning to be false");
    }

    function testAllZeros() external {
        uint8[3][3] memory board = [[0, 0, 0], [0, 0, 0], [0, 0, 0]];
        assertEq(
            tictactoe.isWinning(board),
            true,
            "expected win for all zeros"
        );
    }

    function testAllOnes() external {
        uint8[3][3] memory board = [[1, 1, 1], [1, 1, 1], [1, 1, 1]];
        assertEq(tictactoe.isWinning(board), true, "expected win for all ones");
    }

    function testCornerCaseWin() external {
        uint8[3][3] memory board = [[1, 1, 1], [0, 0, 0], [1, 0, 1]];
        assertEq(
            tictactoe.isWinning(board),
            true,
            "expected win with only one row full"
        );
    }

    function testNoWin() external {
        uint8[3][3] memory board = [[1, 1, 0], [0, 1, 1], [1, 0, 0]];
        assertEq(tictactoe.isWinning(board), false, "expected false");
    }
}

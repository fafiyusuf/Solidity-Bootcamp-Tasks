// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Bank.sol";

contract BankTest is Test {

    Bank bank;
    address user = address(1);

    function setUp() public {
        bank = new Bank();
    }

    function testDeposit() public {
        vm.deal(user, 1 ether);

        vm.prank(user);
        bank.deposit{value: 1 ether}();

        assertEq(bank.getBalance(user), 1 ether);
    }

    function testWithdraw() public {
        vm.deal(user, 1 ether);

        vm.prank(user);
        bank.deposit{value: 1 ether}();

        vm.prank(user);
        bank.withdraw(0.5 ether);

        assertEq(bank.getBalance(user), 0.5 ether);
    }

    function testFailWithdrawTooMuch() public {
        vm.deal(user, 1 ether);

        vm.prank(user);
        bank.deposit{value: 1 ether}();

        vm.prank(user);
        bank.withdraw(2 ether);
    }

    function testBalanceUpdate() public {
        vm.deal(user, 2 ether);

        vm.startPrank(user);
        bank.deposit{value: 2 ether}();
        bank.withdraw(1 ether);
        vm.stopPrank();

        assertEq(bank.getBalance(user), 1 ether);
    }

    function testRevertOnZeroDeposit() public {
        vm.prank(user);
        vm.expectRevert("Must send ETH");
        bank.deposit{value: 0}();
    }
}







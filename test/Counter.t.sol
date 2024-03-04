// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console, stdError} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function test_OwnerCanSend() public {
        counter.incrementOwner();
        assertEq(counter.number(), 1);
    }

    function test_RevertWhen_NotOwner() public {
        vm.prank(address(0));
        vm.expectRevert("only owner can do this");
        counter.incrementOwner();
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    function test_CannotSubtractFrom0() public {
        counter.setNumber(0);
        // NOTE: The expect revert can only be applied here
        // because it always checks the next contract call.
        vm.expectRevert(stdError.arithmeticError);
        counter.subtract();
    }
}

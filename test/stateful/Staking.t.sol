// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import "../../src/stateful/StakingI.sol" as staking;

contract StakingTest is Test {
    string[] private stakingMethods = [staking.MSG_DELEGATE];

    function test_approveMethods() public {
        uint256 allowance = staking.STAKING_CONTRACT.allowance(
            address(this),
            address(staking.STAKING_CONTRACT),
            stakingMethods[0]
        );
        assertEq(allowance, 0);

        bool success = staking.STAKING_CONTRACT.approve(
            address(this),
            type(uint256).max,
            stakingMethods
        );
        assert(success);
    }
}

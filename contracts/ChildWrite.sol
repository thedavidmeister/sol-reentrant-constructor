// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "hardhat/console.sol";
import { ParentWrite } from "./ParentWrite.sol";

contract ChildWrite {
    constructor() public {
        console.log("ParentWrite contract: %s", msg.sender);
        ParentWrite(msg.sender).writeData();
    }
}
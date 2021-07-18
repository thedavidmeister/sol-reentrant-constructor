// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import { ChildWrite } from "./ChildWrite.sol";

contract ParentWrite {
    bool public data;

    constructor() public {
        new ChildWrite();
    }

    function writeData() public {
        data = true;
    }
}
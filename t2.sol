// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.9/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.9/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.9/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract FindTheNumber is ERC20, Ownable, ERC20Burnable {

    uint256 private constant INITIAL_SUPPLY = 1_000_000_000 * 10 ** 18; // 1 milliard de tokens

    constructor() ERC20("FindTheNumber", "FTN") {
        _mint(msg.sender, INITIAL_SUPPLY); // 1 milliard émis directement au créateur
    }

    // 🔥 Fonction pour brûler 1% de la supply actuelle
    function burnOnePercent() external onlyOwner {
        uint256 burnAmount = totalSupply() / 100; // 1% de la supply
        _burn(msg.sender, burnAmount);
    }
}

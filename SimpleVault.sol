// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title SimpleVault
 * @dev A basic ERC-4626 implementation that takes an underlying asset 
 * and issues shares. In a production scenario, you would add logic 
 * to invest the underlying assets to generate yield.
 */
contract SimpleVault is ERC4626 {
    
    /**
     * @param asset The address of the underlying token (e.g., USDC)
     * @param name The name of the Vault Share token
     * @param symbol The symbol of the Vault Share token
     */
    constructor(
        IERC20 asset,
        string memory name,
        string memory symbol
    ) ERC20(name, symbol) ERC4626(asset) {}

    /**
     * @dev Hook that is called before any transfer of tokens. 
     * This includes minting and burning.
     */
    function _update(address from, address to, uint256 value) internal override {
        super._update(from, to, value);
    }

    /**
     * @notice Returns the total amount of the underlying asset managed by the vault.
     */
    function totalAssets() public view override returns (uint256) {
        return IERC20(asset()).balanceOf(address(this));
    }
}

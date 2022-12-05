// SPDX-Licence-Identifier: MIT 

pragma solidity ^0.8.4;

contract Whitelist {

    // Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // Create a mapping of whitelistedAddresses
    // if an address is whitelisted, we would set it to true, it is false by default for all other addresses.
    mapping(address => bool) public whitelistedAddresses;

    // numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    // NOTE: Don't change this variable name, as it will be part of verification
    uint8 public numAddressesWhitelisted;

    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses =  _maxWhitelistedAddresses;
 }

   function addAddressToWhitelist() public {
     // check if the user has already been whitelisted
     require (!whitelistedAddresses[msg.sender], "Sender has already been Whitelisted");
     // check is number of addresses whitelisted is < maxWhitelistedAddresses if not then throw an error
     require (numAddressesWhitelisted < maxWhitelistedAddresses, "Can't add more addresses, limit reached");
     // add the address that called the function to the whitelisted addresses array 
     whitelistedAddresses[msg.sender] = true;
     numAddressesWhitelisted += 1;
 }
}
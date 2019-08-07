pragma solidity >=0.5.0 <0.7.0;

contract HelloWorld {
    string message = "Hello World";

    function getMessage() public view returns(string memory) {
        return(message);
    }
}
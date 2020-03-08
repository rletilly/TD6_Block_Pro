# TD6_Block_Pro

Question 1 : For the rest of our TD, we'll use this repo and it has been shared with the teacher.

Question 2-3 : We've duplicate the ERC721 contract template from open-zeppelin. That way every functions are already implemented, we'll modify some of them to better fit our particular problem.

Question 4 : We decided to separate the ERC721 token from our contract with every asked functions from the TD. In order to create a Breeder register, we created a Bigboss address in the constructor and put a require that the only one that can call it, is the creator of the contract. We added a mapping that goes from the address to a boolean and fill it in the function registerBreeder.

Question 5 : To better manipulate our animals properties, we decided to create a struct with our five properties as asked. A struct is a custom type in solidity that can group multiple variables of different types.

Question 6 : 
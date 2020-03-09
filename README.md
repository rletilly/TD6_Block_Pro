# TD6_Block_Pro

Question 1 : For the rest of our TD, we'll use this repo and it has been shared with the teacher.

Question 2-3 : We've duplicate the ERC721 contract template from open-zeppelin. That way every functions are already implemented, we'll modify some of them to better fit our particular problem.

Question 4 : We decided to separate the ERC721 token from our contract with every asked functions from the TD. In order to create a Breeder register, we created a Bigboss address in the constructor and put a require that the only one that can call it, is the creator of the contract. We added a mapping that goes from the address to a boolean and fill it in the function registerBreeder. At the same time, to gain some time and function gas, we call _safeMint()_ to give the new breder a token.

Question 5 : To better manipulate our animals properties, we decided to create a struct with our five properties as asked and the address of the animal's breeder. A struct is a custom type in solidity that can group multiple variables of different types.
Then, as decentralisation goes with freedom, we let the user choose the aspect of his/her waterdoggo.
We require that the address belong to the "whitelist" and registers it in our mapping of addresses to doggos owned.

Question 6 : To know if your doggo is on the verge of passing out, you just have to check for his age. Of course the doggo must be yours and afterwards your token is burned.
Later we'll implement in a recurrent functions an increment of every ages of doggos.

Question 7 : There are two functions going there. The first one checks if the oposite address used for breeding has already been used. That way we don't have Game of thrones stuff. Period.
The other one does three things, it guesses the gender of the futur doggo and his capacity to hold his breath under water. Lastly, as we don't know how to make secure functions, you can breed your doggo with any other doggo linked to a public address.
However, we check for consanguinity and every baby doggo goes to the address that is no the msg.sender one. That way you need someone who is legitimatly agree with you to get your baby doggo.

Question 8-9 : We didn't have time to do those ones but there are some efficient escrow functions you can use for auctions.

Question 10 : We've deployed to rinkeby and sent you the token 3


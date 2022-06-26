// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mappgins {
    mapping(uint256 => Book) public books;
    mapping(address => mapping(uint256 => Book)) public myBooks;

    struct Book {
        string title;
        string author;
    }

    constructor() {
        books[0] = Book("Lord of the Rings", "Tolkien");
        books[1] = Book("The man versus the state", "Spencer");
    }

    function addBook (
        uint256 _id,
        string memory _title,
        string memory _author
    ) public {
        books[_id] = Book(_title, _author);
    } 

    function addMyBook(
        uint256 _id,
        string memory _title,
        string memory _author
    ) public {
        myBooks[msg.sender][_id] = Book(_title, _author);
    }
}

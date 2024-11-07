#include "user.hpp"
#include <iostream>
#include <array>

// Initialize the static counter variable to count number of user.
int user::counter = ID_OFFSET;

// Default constructor
user::user() : Name("unknown"), Age(0) {
    counter++;
    id = counter;
}

// Set the name
void user::setName(const std::string& _name) {
    Name = _name;
    
}

// Get the name (returning by value)
std::string user::getName() const {
    return Name;
}

// Set the age
void user::setAge(const int& _age) {
    Age = _age;
}

// Get the age (returning by value)
int user::getAge() const {
    return Age;
}

// Get the ID
int user::getID() const {
    return id;
}

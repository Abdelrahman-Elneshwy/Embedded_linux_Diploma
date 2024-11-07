#pragma once
#include <string>

constexpr int ID_OFFSET = 9999;

class user {
private:
    std::string Name = "unknown";
    int Age = 0;
    int id;
    static int counter;

public:
    // Constructor
    user();

    // Setters
    void setName(const std::string& _name);
    void setAge(const int& _age);

    // Getters
    std::string getName() const;
    int getAge() const;
    int getID() const;
};

#include <iostream>
#include <string>
#include <array>
#include <list>
#include "user.hpp"

constexpr int NOT_FOUND = 0;
constexpr int FOUND = 1;
bool PROGRAM_RUNNING = true;
enum option{
    add_record=1,
    fetch_record=2,
    quit=3
};


std::istream & operator>>(std::istream & in, option & opt)
{
    int input;
    in >> input;
    opt = static_cast<option>(input);
    return in;
}

void print_msg(std::string msg);



int main(){
    int user_age=NOT_FOUND;
    option opt;
    std::string user_name;
    std::list<user> LinkedList;
    

    while (PROGRAM_RUNNING)
    {
        print_msg("1. Add record\n");
        print_msg("2. Fetch record\n");
        print_msg("3. Quit\n");
    
        std::cin >> opt;

        switch(opt)
        {
        case add_record:
            {
                user person;
                std::cout << "Enter user name : ";
                std::cin >> user_name;
                std::cout << "Enter user age : ";
                std::cin >> user_age;
                
                person.setName(user_name);
                person.setAge(user_age);
                LinkedList.push_back(person);
                std::cout << "user record Successfully with ID " <<person.getID() << "\n";
            }
            
            break;


        case fetch_record:{
            int search_key=NOT_FOUND;
            int Found_flag=NOT_FOUND;
            print_msg("Please Enter user ID: ");

            std::cin >> search_key;

            for(user Find_user: LinkedList)
            {
                if(search_key == Find_user.getID())
                {
                    std::cout << "user ID: " << Find_user.getID() << "\n";
                    std::cout << "user name: " << Find_user.getName() << "\n";
                    std::cout << "user age: " << Find_user.getAge() << "\n";
                    Found_flag = FOUND;
                    break;
                }
                else{
                    //do nothing
                }
            }
            if( NOT_FOUND == Found_flag )
            {
                print_msg("invaild ID.\n");
            }
            else{
                //do nothing
            }
        }    
        break;


        case quit:
            print_msg("System has been ended.\n");
            PROGRAM_RUNNING = false;
            break;
        
        default:
            std::cout << "Invaild option\n";
            break;
        }
    }
            
}


void print_msg(std::string msg){
    std::cout << msg ;
}

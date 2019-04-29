//a basic cpp program that takes a random amount of time to execute
#include <iostream>
#include <cstdlib>
#include <ctime>

using namespace std;

int main(){
    srand((unsigned)time(0));
    int x=rand();
    int y=0;
    for(int i=0;i<x;i++){
        y++;
        y--;
        y++;
    }
}
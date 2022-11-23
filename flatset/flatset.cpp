#include "flatset.hpp"
#include <iostream>
#include <boost/container/flat_set.hpp>

void modifyAndPrintSets() {
  //Different ways of initializing the flat_set container
  boost::container::flat_set<int> s1;
  
  //Inserting values into s1
  s1.insert(3);
  s1.insert(1);
  s1.insert(2);
  s1.insert(4);

  s1.insert(4); //Eventhough 4 is inserted multiple times only one is considered
  
  std::cout << "Elements in s1: ";
  for(int i:s1)
    std::cout<<i<<"	";
  std::cout<<std::endl;  
}


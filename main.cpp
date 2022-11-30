#include "fem/fem.hpp"
#include "flatset/flatset.hpp"
#include "filesystem/filesystem.hpp"
#include <iostream>

int main(int argc, char *argv[])
{
  std::cout << "Let's fight with CMake, Docker, and some dependencies!" << std::endl << std::endl;

  std::cout << "Solve Poisson problem with FEM using deal.II" << std::endl;
  Fem fem;
  fem.run();
  std::cout << std::endl;

  std::cout << "Modify a flat set using boost container" << std::endl;
  modifyAndPrintSets();
  std::cout << std::endl;

  std::cout << "Inspect the current directory using boost filesystem" << std::endl;
  inspectDirectory();
  std::cout << std::endl;



  return 0;
}

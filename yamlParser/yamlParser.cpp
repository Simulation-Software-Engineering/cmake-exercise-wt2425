#include "yamlParser.hpp"
#include "yaml-cpp/yaml.h"
#include <iostream>

void parseConfig(){
  YAML::Node config = YAML::LoadFile("../yamlParser/config.yml");
  std::cout << "Version: " << config["version"].as<std::string>() << std::endl;
}

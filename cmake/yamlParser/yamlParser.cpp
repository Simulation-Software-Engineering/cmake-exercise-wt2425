#include "yamlParser.hpp"
#include "yaml-cpp/yaml.h"
#include <iostream>

void parseConfig(const std::string yamlFile){
  YAML::Node config = YAML::LoadFile(yamlFile);
  std::cout << "Version: " << config["version"].as<std::string>() << std::endl;
}

#!/bin/bash

# Visual Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}===========================================${NC}"
echo -e "${BLUE}    COMPLETE DEVOPS ENVIRONMENT CHECKLIST  ${NC}"
echo -e "${BLUE}===========================================${NC}"

check_tool() {
    local tool_name=$1
    local check_cmd=$2

    if eval "$check_cmd" > /dev/null 2>&1; then
        echo -e "[ ${GREEN}READY${NC} ]  $tool_name"
    else
        echo -e "[ ${RED}MISSING${NC} ] $tool_name"
    fi
}

echo -e "${YELLOW}--- Core Dev & Cloud CLIs ---${NC}"
check_tool "Git" "git --version"
check_tool "Python 3" "python3 --version"
check_tool "Java (JDK)" "java -version"
check_tool "Terraform" "terraform -version"
check_tool "Azure CLI" "az --version"
check_tool "AWS CLI" "aws --version"

echo -e "\n${YELLOW}--- Containers & Kubernetes ---${NC}"
check_tool "Docker Daemon" "docker ps"
check_tool "kubectl" "kubectl version --client"
check_tool "Kind" "kind --version"
check_tool "Helm" "helm version"

echo -e "\n${YELLOW}--- Essential Utilities ---${NC}"
check_tool "jq (JSON Parser)" "jq --version"
check_tool "yq (YAML Parser)" "yq --version"
check_tool "tree (Directory Visualizer)" "tree --version"
check_tool "dig / nslookup (DNS)" "dig -v"
check_tool "fzf (Fuzzy Finder)" "fzf --version"
check_tool "htop (System Monitor)" "htop --version"

echo -e "${BLUE}===========================================${NC}"

#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

failed_tests=()
success_test_counter=0

for dir in */; do
  cd "$dir"
  echo "Testing $dir:"
  forge test -vvv
  return_code=$?
  cd ..

  if [ $return_code -ne 0 ]; then
    failed_tests+=("${dir%?}")
  else
    success_test_counter=$((success_test_counter+1))
  fi
done

echo -e "${GREEN}Success tests: $success_test_counter${NC}"
echo -e "${RED}Failed tests: ${#failed_tests[@]}${NC}"

if [ ${#failed_tests[@]} -ne 0 ]; then
  echo -e "Failed tests are: $(IFS=, ; echo "${failed_tests[*]}" | sed 's/,/, /g')"
  exit 1
fi

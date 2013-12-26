echo "-DDEBUG" >> .clang_complete
echo | g++ -v -x c++ -E - 2>&1 | sed -e '1,/#include </d' | sed -n '/^ \/usr/p' | sed -e 's/^ /-I/' >> .clang_complete

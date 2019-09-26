#!/bin/bash
# Install Home Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap microsoft/mssql-release https://github.com/Microsoft/homebrew-mssql-release
brew update
brew install freetds memcached libmemcached postgresql msodbcsql17
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

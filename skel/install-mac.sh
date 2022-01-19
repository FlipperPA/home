#!/bin/bash
# Install Home Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew tap microsoft/mssql-release https://github.com/Microsoft/homebrew-mssql-release
brew update
brew install freetds memcached libmemcached postgresql msodbcsql17 git bash-completion bat

#ifndef SCANNER_H
#define SCANNER_H

#include <string>
#include <utility>
#include "tokenInfo.h"

class Scanner {
   private:
    TokenInfo* _tokenInfo;
    std::string _buffer;
    size_t _position;

   public:
    Scanner(std::string = "");
    std::pair<std::string, int> nextToken();
    size_t skipLeadingWhiteSpace();
    std::string extractAtom();
    std::string extractAtomSC();
    std::string extractNumber();
    std::string extractVariable();
    char extractChar();
    char currentChar();
    size_t position();
};

#endif
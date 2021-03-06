#!/usr/bin/sed
# bintoascii: Convert an ASCII file of 1 and 0 into the code they represent by
#     replacing the binary bytes with their ASCII representation
# Copyright (C) 2015  Jaime Mosquera
#
# MIPC is free software: you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# MIPC is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# MIPC.  If not, see <http://www.gnu.org/licenses/>.

# Yes, I _DO_ know this is a very ugly way to convert binary into ASCII
s/\([01]\{8\}\)/\1 /g
s/00000000 /\ /g
s/00000001 /\/g
s/00000010 /\/g
s/00000011 /\/g
s/00000100 /\/g
s/00000101 /\/g
s/00000110 /\/g
s/00000111 /\/g
s/00001000 /\/g
s/00001001 /\	/g
s/00001010 /\n/g
s/00001011 /\/g
s/00001100 /\/g
s/00001101 /\/g
s/00001110 /\/g
s/00001111 /\/g
s/00010000 /\/g
s/00010001 /\/g
s/00010010 /\/g
s/00010011 /\/g
s/00010100 /\/g
s/00010101 /\/g
s/00010110 /\/g
s/00010111 /\/g
s/00011000 /\/g
s/00011001 /\/g
s/00011010 /\/g
s/00011011 /\/g
s/00011100 /\/g
s/00011101 /\/g
s/00011110 /\/g
s/00011111 /\/g
s/00100000 /\ /g
s/00100001 /\!/g
s/00100010 /\"/g
s/00100011 /\#/g
s/00100100 /\$/g
s/00100101 /%/g
s/00100110 /\&/g
s/00100111 /'/g
s/00101000 /(/g
s/00101001 /)/g
s/00101010 /\*/g
s/00101011 /+/g
s/00101100 /,/g
s/00101101 /-/g
s/00101110 /./g
s/00101111 /\//g
s/00110000 /0/g
s/00110001 /1/g
s/00110010 /2/g
s/00110011 /3/g
s/00110100 /4/g
s/00110101 /5/g
s/00110110 /6/g
s/00110111 /7/g
s/00111000 /8/g
s/00111001 /9/g
s/00111010 /\:/g
s/00111011 /\;/g
s/00111100 /\</g
s/00111101 /\=/g
s/00111110 /\>/g
s/00111111 /?/g
s/01000000 /@/g
s/01000001 /A/g
s/01000010 /B/g
s/01000011 /C/g
s/01000100 /D/g
s/01000101 /E/g
s/01000110 /F/g
s/01000111 /G/g
s/01001000 /H/g
s/01001001 /I/g
s/01001010 /J/g
s/01001011 /K/g
s/01001100 /L/g
s/01001101 /M/g
s/01001110 /N/g
s/01001111 /O/g
s/01010000 /P/g
s/01010001 /Q/g
s/01010010 /R/g
s/01010011 /S/g
s/01010100 /T/g
s/01010101 /U/g
s/01010110 /V/g
s/01010111 /W/g
s/01011000 /X/g
s/01011001 /Y/g
s/01011010 /Z/g
s/01011011 /[/g
s/01011100 /\\/g
s/01011101 /\]/g
s/01011110 /^/g
s/01011111 /_/g
s/01100000 /`/g
s/01100001 /a/g
s/01100010 /b/g
s/01100011 /c/g
s/01100100 /d/g
s/01100101 /e/g
s/01100110 /f/g
s/01100111 /g/g
s/01101000 /h/g
s/01101001 /i/g
s/01101010 /j/g
s/01101011 /k/g
s/01101100 /l/g
s/01101101 /m/g
s/01101110 /n/g
s/01101111 /o/g
s/01110000 /p/g
s/01110001 /q/g
s/01110010 /r/g
s/01110011 /s/g
s/01110100 /t/g
s/01110101 /u/g
s/01110110 /v/g
s/01110111 /w/g
s/01111000 /x/g
s/01111001 /y/g
s/01111010 /z/g
s/01111011 /{/g
s/01111100 /|/g
s/01111101 /}/g
s/01111110 /\~/g
s/01111111 /\/g
s/10000000 /\�/g
s/10000001 /\�/g
s/10000010 /\�/g
s/10000011 /\�/g
s/10000100 /\�/g
s/10000101 /\�/g
s/10000110 /\�/g
s/10000111 /\�/g
s/10001000 /\�/g
s/10001001 /\�/g
s/10001010 /\�/g
s/10001011 /\�/g
s/10001100 /\�/g
s/10001101 /\�/g
s/10001110 /\�/g
s/10001111 /\�/g
s/10010000 /\�/g
s/10010001 /\�/g
s/10010010 /\�/g
s/10010011 /\�/g
s/10010100 /\�/g
s/10010101 /\�/g
s/10010110 /\�/g
s/10010111 /\�/g
s/10011000 /\�/g
s/10011001 /\�/g
s/10011010 /\�/g
s/10011011 /\�/g
s/10011100 /\�/g
s/10011101 /\�/g
s/10011110 /\�/g
s/10011111 /\�/g
s/10100000 /\�/g
s/10100001 /\�/g
s/10100010 /\�/g
s/10100011 /\�/g
s/10100100 /\�/g
s/10100101 /\�/g
s/10100110 /\�/g
s/10100111 /\�/g
s/10101000 /\�/g
s/10101001 /\�/g
s/10101010 /\�/g
s/10101011 /\�/g
s/10101100 /\�/g
s/10101101 /\�/g
s/10101110 /\�/g
s/10101111 /\�/g
s/10110000 /\�/g
s/10110001 /\�/g
s/10110010 /\�/g
s/10110011 /\�/g
s/10110100 /\�/g
s/10110101 /\�/g
s/10110110 /\�/g
s/10110111 /\�/g
s/10111000 /\�/g
s/10111001 /\�/g
s/10111010 /\�/g
s/10111011 /\�/g
s/10111100 /\�/g
s/10111101 /\�/g
s/10111110 /\�/g
s/10111111 /\�/g
s/11000000 /\�/g
s/11000001 /\�/g
s/11000010 /\�/g
s/11000011 /\�/g
s/11000100 /\�/g
s/11000101 /\�/g
s/11000110 /\�/g
s/11000111 /\�/g
s/11001000 /\�/g
s/11001001 /\�/g
s/11001010 /\�/g
s/11001011 /\�/g
s/11001100 /\�/g
s/11001101 /\�/g
s/11001110 /\�/g
s/11001111 /\�/g
s/11010000 /\�/g
s/11010001 /\�/g
s/11010010 /\�/g
s/11010011 /\�/g
s/11010100 /\�/g
s/11010101 /\�/g
s/11010110 /\�/g
s/11010111 /\�/g
s/11011000 /\�/g
s/11011001 /\�/g
s/11011010 /\�/g
s/11011011 /\�/g
s/11011100 /\�/g
s/11011101 /\�/g
s/11011110 /\�/g
s/11011111 /\�/g
s/11100000 /\�/g
s/11100001 /\�/g
s/11100010 /\�/g
s/11100011 /\�/g
s/11100100 /\�/g
s/11100101 /\�/g
s/11100110 /\�/g
s/11100111 /\�/g
s/11101000 /\�/g
s/11101001 /\�/g
s/11101010 /\�/g
s/11101011 /\�/g
s/11101100 /\�/g
s/11101101 /\�/g
s/11101110 /\�/g
s/11101111 /\�/g
s/11110000 /\�/g
s/11110001 /\�/g
s/11110010 /\�/g
s/11110011 /\�/g
s/11110100 /\�/g
s/11110101 /\�/g
s/11110110 /\�/g
s/11110111 /\�/g
s/11111000 /\�/g
s/11111001 /\�/g
s/11111010 /\�/g
s/11111011 /\�/g
s/11111100 /\�/g
s/11111101 /\�/g
s/11111110 /\�/g
s/11111111 /\�/g

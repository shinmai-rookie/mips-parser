divert(-1)
    # MIPS-count-pc: Read tags and define macros that expand to their address
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

    define(`CURRENT_ADDRESS_', `eval(2 << 22)')
    define(`PROGRAM_COUNTER_', `eval(CURRENT_ADDRESS_+4)')
    define(`START_TAG_FOUND_', 0)

    define(`REGISTER_NUMBER__', `eval($1 % 32,2,5)')
    define(`BEGIN_CODE_HERE__', `dnl')
    define(`BEGIN_ALLOCATIONS_HERE__', `dnl')
dnl    define(`BEGIN_CODE_HERE__',`undefine(DATA_SEGMENT__)define(`CODE_SEGMENT_',`1')dnl')
dnl    define(`BEGIN_ALLOCATIONS_HERE__',`undefine(CODE_SEGMENT__)define(`DATA_SEGMENT_',`1')dnl')
    define(`GLOBAL_STARTING_POINT__', `dnl')

    define(`MOVE_FORWARD__', `define(`CURRENT_ADDRESS_', eval(CURRENT_ADDRESS_ + 4))')

    define(`DEFINE_TAG__', `dnl')

    # Allocate space for variables
    define(`ALLOCATE_ASCII', `dnl')
    define(`ALLOCATE_ASCIIZ',`dnl')
    define(`ALLOCATE_BYTE',  `dnl')
    define(`ALLOCATE_DOUBLE',`dnl')
    define(`ALLOCATE_FLOAT', `dnl')
    define(`ALLOCATE_HALF',  `dnl')
    define(`ALLOCATE_SPACE', `dnl')
    define(`ALLOCATE_WORD',  `dnl')

    # R-instructions
    # TODO: Many of these instructions might not be 32-bit long!!!!
    define(`ADD',     `MOVE_FORWARD__()000000`'$2$3$1`'00000100000`'dnl')
    define(`ADDU',    `MOVE_FORWARD__()000000`'$2$3$1`'00000100001`'dnl')
    define(`AND',     `MOVE_FORWARD__()000000`'$2$3$1`'00000100100`'dnl')
    define(`DIV',     `MOVE_FORWARD__()000000`'$1$2`'0000000000011010`'dnl')
    define(`DIVU',    `MOVE_FORWARD__()000000`'$1$2`'0000000000011011`'dnl')
    define(`JR',      `MOVE_FORWARD__()000000`'$1`'000000000000000001000`'dnl')
    define(`MFHI',    `MOVE_FORWARD__()0000000000000000`'$1`'00000010000`'dnl')
    define(`MFLO',    `MOVE_FORWARD__()0000000000000000`'$1`'00000010010`'dnl')
    define(`MULT',    `MOVE_FORWARD__()000000`'$1$2`'0000000000011000`'dnl')
    define(`MULTU',   `MOVE_FORWARD__()000000`'$1$2`'0000000000011001`'dnl')
    define(`NOOP',    `MOVE_FORWARD__()00000000000000000000000000000000`'dnl')
    define(`OR',      `MOVE_FORWARD__()000000`'$2$3$1`'00000100101`'dnl')
    define(`SLL',     `MOVE_FORWARD__()00000000000`'$2$1`'eval(($3 + 32) % 32,2,5)000000`'dnl')
    define(`SLLV',    `MOVE_FORWARD__()000000`'$2$3$1`'00000000100`'dnl')
    define(`SLT',     `MOVE_FORWARD__()000000`'$2$3$1`'00000101010`'dnl')
    define(`SLTU',    `MOVE_FORWARD__()000000`'$2$3$1`'00000101011`'dnl')
    define(`SRA',     `MOVE_FORWARD__()00000000000`'$2$1`'eval(($3 + 32) % 32,2,5)000011`'dnl')
    define(`SRL',     `MOVE_FORWARD__()00000000000`'$2$1`'eval(($3 + 32) % 32,2,5)000010`'dnl')
    define(`SRLV',    `MOVE_FORWARD__()00000000000`'$3$2$1`'0000000110`'dnl')
    define(`SUB',     `MOVE_FORWARD__()000000`'$2$3$1`'00000100010`'dnl')
    define(`SUBU',    `MOVE_FORWARD__()000000`'$2$3$1`'00000100011`'dnl')
    define(`SYSCALL', `MOVE_FORWARD__()00000000000000000000000000001100`'dnl')
    define(`XOR',     `MOVE_FORWARD__()000000`'$2$3$1`'00000100110`'dnl')

    # I-instructions
    define(`ADDI',    `MOVE_FORWARD__()001000`'$2$1`'eval(($3 + 2**16) % (2**16), 2, 16)dnl')
    define(`ADDIU',   `MOVE_FORWARD__()001001`'$2$1`'eval(($3 + 2**16) % (2**16), 2, 16)dnl')
    define(`ANDI',    `MOVE_FORWARD__()001100`'$2$1`'eval(($3 + 2**16) % (2**16), 2, 16)dnl')
    define(`BEQ',     `MOVE_FORWARD__()000100`'$1$2`'eval((($3 - PROGRAM_COUNTER_)/4) % (2**16), 2, 16)dnl')
    define(`BGEZ',    `MOVE_FORWARD__()000001`'$1`'00001`'eval((($2 - PROGRAM_COUNTER_)/4) % (2**16), 2, 16)dnl')
    define(`BGEZAL',  `MOVE_FORWARD__()000001`'$1`'10001`'eval((($2 - PROGRAM_COUNTER_)/4) % (2**16), 2, 16)dnl')
    define(`BGTZ',    `MOVE_FORWARD__()000111`'$1`'00000`'eval((($2 - PROGRAM_COUNTER_)/4) % (2**16), 2, 16)dnl')
    define(`BLEZ',    `MOVE_FORWARD__()000110`'$1`'00000`'eval((($2 - PROGRAM_COUNTER_)/4) % (2**16), 2, 16)dnl')
    define(`BLTZ',    `MOVE_FORWARD__()000001`'$1`'00000`'eval((($2 - PROGRAM_COUNTER_)/4) % (2**16), 2, 16)dnl')
    define(`BLTZAL',  `MOVE_FORWARD__()000001`'$1`'10000`'eval((($2 - PROGRAM_COUNTER_)/4) % (2**16), 2, 16)dnl')
    define(`BNE',     `MOVE_FORWARD__()000101`'$1$2`'eval((($3 - PROGRAM_COUNTER_)/4) % (2**16), 2, 16)dnl')
    define(`LB',      `MOVE_FORWARD__()100000`'$2$1`'eval(($3 + 2**16) % (2**16), 2, 16)dnl')
    define(`LUI',     `MOVE_FORWARD__()00111100000`'$1`'eval(($2 + 2**16) % (2**16), 2, 16)dnl')
    define(`LW',      `MOVE_FORWARD__()001111`'$2$1`'eval(($3 + 2**16) % (2**16), 2, 16)dnl')
    define(`ORI',     `MOVE_FORWARD__()001101`'$2$1`'eval(($3 + 2**16) % (2**16), 2, 16)dnl')
    define(`SB',      `MOVE_FORWARD__()101000`'$2$1`'eval(($3 + 2**16) % (2**16), 2, 16)dnl')
    define(`SLTI',    `MOVE_FORWARD__()001010`'$2$1`'eval(($3 + 2**16) % (2**16), 2, 16)dnl')
    define(`SLTIU',   `MOVE_FORWARD__()001011`'$2$1`'eval(($3 + 2**16) % (2**16), 2, 16)dnl')
    define(`SW',      `MOVE_FORWARD__()101011`'$2$1`'eval(($3 + 2**16) % (2**16), 2, 16)dnl')
    define(`XORI',    `MOVE_FORWARD__()001110`'$2$1`'eval(($3 + 2**16) % (2**16), 2, 16)dnl')

    # J-instructions
    define(`J',       `MOVE_FORWARD__()000010`'eval((($1 % (2**28)) + (PROGRAM_COUNTER_ & (15 << 28)))/4, 2, 26)dnl')
    define(`JAL',     `MOVE_FORWARD__()000011`'eval((($1 % (2**28)) + (PROGRAM_COUNTER_ & (15 << 28)))/4, 2, 26)dnl')

    # Pseudoinstructions
    define(`BLT',  `SLT(REGISTER_NUMBER__(1), $1, $2)
BNE(REGISTER_NUMBER__(1), REGISTER_NUMBER__(0), $3)')
    define(`BGT',  `SLT(REGISTER_NUMBER__(1), $1, $2)
BEQ(REGISTER_NUMBER__(1), REGISTER_NUMBER__(0), $3)
BEQ($1, $2, $3)')
    define(`BLE',  `SLT(REGISTER_NUMBER__(1), $1, $2)
BNE(REGISTER_NUMBER__(1), REGISTER_NUMBER__(0), $3)
BEQ($1, $2, $3)')
    define(`NOT',  `SLTIU($1, $1, 1)')
    define(`BGE',  `SLT(REGISTER_NUMBER__(1), $1, $2)
BEQ(REGISTER_NUMBER__(1), REGISTER_NUMBER__(0), $3)')
    define(`LI',   `LUI($1, eval($2 >> 16, 2, 16))
ORI($1, $1, eval($2 % (2**16), 2, 16))')
    define(`LA',   `LUI(REGISTER_NUMBER__(1), eval($2 >> 16, 2, 16))
ORI($1, REGISTER_NUMBER__(1),eval($2 % (2**16) - 1, 2, 16))')
    define(`MOVE', `ADD($1, $2, REGISTER_NUMBER__(0))')
    define(`SGT',  `SLT($1, $3, $2)')
divert(0)dnl

divert(-1)
    # mips-count-pc: Read tags and define macros that expand to their address
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

    define(`CURRENT_ADDRESS_', eval(1 << 22))
    define(`LITERAL_SPACE_', 0)

    define(`UNINITIALIZED_SPACE_', 0)
    define(`UNINITIALIZED_HEADER_', `')
    define(`DATA_ADDRESS_',eval(1<<))
    define(`DATA_SEGMENT_', 0)
    define(`CODE_SEGMENT_', 0)

    # Not used here, but in mips-lib
    # (Included to make it "mute")
    define(`REGISTER_NUMBER__', `')

    define(`GLOBAL_STARTING_POINT__', `')

    define(`BEGIN_CODE_HERE__',
           `ifelse(CODE_SEGMENT_, 0,
               `define(`DATA_SEGMENT_', eval(DATA_SEGMENT_*2))
                define(`CODE_SEGMENT_', eval(CODE_SEGMENT_+1))',
             `errprint(`Error: two .text directives')
              m4exit(2)')')

    define(`BEGIN_ALLOCATIONS_HERE__',
           `ifelse(DATA_SEGMENT_, 0,
               `define(`CODE_SEGMENT_', eval(CODE_SEGMENT_*2))
                define(`DATA_SEGMENT_', eval(DATA_SEGMENT_+1))',
             `errprint(`Error: two .data directives')
              m4exit(2)')')

    define(`DEFINE_TAG__', `define(`$1', CURRENT_ADDRESS_)')

    define(`MOVE_FORWARD__',
           `ifelse(DATA_SEGMENT_, 1,
               `errprint(`Error: instruction inside .data segment')
                m4exit(10)',
              define(`CURRENT_ADDRESS_', eval(CURRENT_ADDRESS_+4)))')

    define(`INITIALIZE_DATA__', `')

    # Reserve space for uninitialized variables
    define(`RESERVE_SPACE__',
           `define(`UNINITIALIZED_SPACE_',  eval(UNINITIALIZED_SPACE_ + $1))
            define(`DATA_ADDRESS_', eval(DATA_ADDRESS + $1))
            define(`UNINITIALIZED_HEADER_', UNINITIALIZED_HEADER_`'eval(DATA_ADDRESS_, 2, 32)'))

    define(`INITIALIZED_DATA_', 1)
    define(`UNINITIALIZED_DATA_', 0)

    # Allocate space for static variables
    define(`ALLOC__',
           `ifelse(DATA_SEGMENT_, 1,
                define($1, DATA_ADDRESS_)
                define(`ALLOCED_SPACE_', eval(ALLOCED_SPACE_ + $2))
                ifelse($3, INITIALIZED_DATA_,
                    `INITIALIZE_DATA__(shift(shift(shift($@))))'
                  `RESERVE_SPACE__($2)')
                define(`DATA_ADDRESS_', eval(DATA_ADDRESS + $1)),
             `errprint(`Error: declaration of $1 is outside .data')
              m4exit(10)')')

    define(`ALLOCATE_SPACE',  `ALLOC__($1, $2, UNINITIALIZED_DATA_)')

    define(`ALLOCATE_ASCII',  `ALLOC__($1, eval(len($2)),       INITIALIZED_DATA_, `$2')')
    define(`ALLOCATE_ASCIIZ', `ALLOC__($1, eval(len($2) + 1),   INITIALIZED_DATA_, `$2', `00000000')')
    define(`ALLOCATE_BYTE',   `ALLOC__($1, eval(($# - 1) * 8),  INITIALIZED_DATA_, shift(`$@'))')
    define(`ALLOCATE_HALF',   `ALLOC__($1, eval(($# - 1) * 16), INITIALIZED_DATA_, shift(`$@'))')
    define(`ALLOCATE_WORD',   `ALLOC__($1, eval(($# - 1) * 32), INITIALIZED_DATA_, shift(`$@'))')
    define(`ALLOCATE_FLOAT',  `ALLOC__($1, eval(($# - 1) * 32), INITIALIZED_DATA_, shift(`$@'))')
    define(`ALLOCATE_DOUBLE', `ALLOC__($1, eval(($# - 1) * 64), INITIALIZED_DATA_, shift(`$@'))')

    # R-instructions
    define(`ADD',     `MOVE_FORWARD__()')
    define(`ADDU',    `MOVE_FORWARD__()')
    define(`AND',     `MOVE_FORWARD__()')
    define(`DIV',     `MOVE_FORWARD__()')
    define(`DIVU',    `MOVE_FORWARD__()')
    define(`JR',      `MOVE_FORWARD__()')
    define(`MFHI',    `MOVE_FORWARD__()')
    define(`MFLO',    `MOVE_FORWARD__()')
    define(`MULT',    `MOVE_FORWARD__()')
    define(`MULTU',   `MOVE_FORWARD__()')
    define(`NOOP',    `MOVE_FORWARD__()')
    define(`OR',      `MOVE_FORWARD__()')
    define(`SLL',     `MOVE_FORWARD__()')
    define(`SLLV',    `MOVE_FORWARD__()')
    define(`SLT',     `MOVE_FORWARD__()')
    define(`SLTU',    `MOVE_FORWARD__()')
    define(`SRA',     `MOVE_FORWARD__()')
    define(`SRL',     `MOVE_FORWARD__()')
    define(`SRLV',    `MOVE_FORWARD__()')
    define(`SUB',     `MOVE_FORWARD__()')
    define(`SUBU',    `MOVE_FORWARD__()')
    define(`SYSCALL', `MOVE_FORWARD__()')
    define(`XOR',     `MOVE_FORWARD__()')

    # I-instructions
    define(`ADDI',    `MOVE_FORWARD__()')
    define(`ADDIU',   `MOVE_FORWARD__()')
    define(`ANDI',    `MOVE_FORWARD__()')
    define(`BEQ',     `MOVE_FORWARD__()')
    define(`BGEZ',    `MOVE_FORWARD__()')
    define(`BGEZAL',  `MOVE_FORWARD__()')
    define(`BGTZ',    `MOVE_FORWARD__()')
    define(`BLEZ',    `MOVE_FORWARD__()')
    define(`BLTZ',    `MOVE_FORWARD__()')
    define(`BLTZAL',  `MOVE_FORWARD__()')
    define(`BNE',     `MOVE_FORWARD__()')
    define(`LB',      `MOVE_FORWARD__()')
    define(`LUI',     `MOVE_FORWARD__()')
    define(`LW',      `MOVE_FORWARD__()')
    define(`ORI',     `MOVE_FORWARD__()')
    define(`SB',      `MOVE_FORWARD__()')
    define(`SLTI',    `MOVE_FORWARD__()')
    define(`SLTIU',   `MOVE_FORWARD__()')
    define(`SW',      `MOVE_FORWARD__()')
    define(`XORI',    `MOVE_FORWARD__()')

    # J-instructions
    define(`J',       `MOVE_FORWARD__()')
    define(`JAL',     `MOVE_FORWARD__()')

    # Pseudoinstructions
    define(`BLT',     `MOVE_FORWARD__() MOVE_FORWARD__()')
    define(`BGT',     `MOVE_FORWARD__() MOVE_FORWARD__() MOVE_FORWARD__()')
    define(`BLE',     `MOVE_FORWARD__() MOVE_FORWARD__() MOVE_FORWARD__()')
    define(`NOT',     `MOVE_FORWARD__()')
    define(`BGE',     `MOVE_FORWARD__() MOVE_FORWARD__()')
    define(`LI',      `MOVE_FORWARD__() MOVE_FORWARD__()')
    define(`LA',      `MOVE_FORWARD__() MOVE_FORWARD__()')
    define(`MOVE',    `MOVE_FORWARD__()')
    define(`SGT',     `MOVE_FORWARD__()')
divert(0)

#!/usr/bin/sed -f
# preprocess.sed: Convert a MIPS assembler file into an m4 script
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

# Remove comments
s/[     ]*#.*$//

# Make tags to be on their own lines
s/\(^[^ ].*\)[  ][  ]*\([_a-zA-Z][-_a-zA-Z0-9]*:\)/\1\n\2/g

# Remove empty lines
/^[    ]*$/ D

# Remove trailing space
s/[     ]*$//

# Remove leading space
s/^[    ]*//

# Convert 2+ spaces into one
s/[     ]\{2,\}/ /g

# Remove spaces before and after commas
s/[     ]*,[    ]*/,/g

# Turn argument-accepting instructions uppercase and make them m4 macros
s/\(add\|addi\|addiu\|addu\|and\|andi\|beq\|bgez\|bgezal\|bgtz\|blez\|bltz\|bltzal\|bne\|div\|divu\|j\|jal\|jr\|lb\|lui\|lw\|mfhi\|mflo\|mult\|multu\|or\|ori\|sb\|sll\|sllv\|slt\|slti\|sltiu\|sltu\|sra\|srl\|srlv\|sub\|subu\|sw\|xor\|xori\) \(.*\)$/\U\1\E(\2)/I

# Turn non-argument-accepting instructions uppercase and make them m4 macros
s/\(noop\|syscall\)/\U\1()\E/I

# Turn pseudoinstructions uppercase and make them m4 macros
# (Separate from instructions for later reference)
s/\(blt\|bgt\|ble\|not\|bge\|li\|la\|move\|sgt\) \(.*\)$/\U\1\E(\2)/I

# Turn register names into numbers
s/\$zero/\$0/gI
s/\$at/\$1/gI
s/\$v0/\$2/gI;  s/\$v1/\$3/gI
s/\$a0/\$4/gI;  s/\$a1/\$5/gI;  s/\$a2/\$6/gI;  s/\$a3/\$7/gI
s/\$t0/\$8/gI;  s/\$t1/\$9/gI;  s/\$t2/\$10/gI; s/\$t3/\$11/gI; s/\$t4/\$12/gI; s/\$t5/\$13/gI; s/\$t6/\$14/gI; s/\$t7/\$15/gI
s/\$s0/\$16/gI; s/\$s1/\$17/gI; s/\$s2/\$18/gI; s/\$s3/\$19/gI; s/\$s4/\$20/gI; s/\$s5/\$21/gI; s/\$s6/\$22/gI; s/\$s7/\$23/gI
s/\$t8/\$24/gI; s/\$t9/\$25/gI
s/\$k0/\$26/gI; s/\$k1/\$27/gI
s/\$gp/\$28/gI
s/\$sp/\$29/gI
s/\$fp/\$30/gI
s/\$ra/\$31/gI

# Turn registers into REGISTER_NUMBER__(NN)
s/\$\([0-9]\{1,2\}\)/REGISTER_NUMBER__(\1)/g

# Convert variable declarations into allocating macros
s/\([_a-zA-Z][-_a-zA-Z0-9]*\):[     ]*\.\(word\|byte\|space\|asciiz\|ascii\)\(.*\)$/ALLOCATE_\U\2\E(\1,\3)/I

# Convert tags into tag-defining macros
s/\([_a-zA-Z][-_a-zA-Z0-9]*\):/DEFINE_TAG__(\1)/g

# .globl -> GLOBAL_STARTING_POINT__
s/\.globl \([_a-zA-Z][-_a-zA-Z0-9]*\)/GLOBAL_STARTING_POINT__(\1)/I

# .text -> BEGIN_CODE_HERE__
s/\.text/BEGIN_CODE_HERE__()/I

# .data -> BEGIN_ALLOCATIONS_HERE__
s/\.data/BEGIN_ALLOCATIONS_HERE__()/I

# Turn shamt into ordinary argument
s/\([0-9]*\)[   ]*(\(REGISTER_NUMBER__([0-9]\{1,2\})\))/\2,\1/

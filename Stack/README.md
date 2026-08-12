# 4-Bit Stack (LIFO) using Verilog

## Overview

This project implements a 4-bit Stack using Verilog HDL.

A stack follows the LIFO principle:

Last In, First Out

The last data item pushed into the stack is the first item removed
during a pop operation.

## Features

- 4-bit data width
- 8 storage locations
- Push operation
- Pop operation
- Full flag
- Empty flag
- Synchronous reset
- Clock-based operation

## Inputs

| Input | Size | Description |
|-------|------|-------------|
| clk | 1-bit | Clock signal |
| reset | 1-bit | Resets the stack |
| push | 1-bit | Stores data into stack |
| pop | 1-bit | Removes data from stack |
| data_in | 4-bit | Data to be stored |

## Outputs

| Output | Size | Description |
|--------|------|-------------|
| data_out | 4-bit | Data removed from stack |
| full | 1-bit | HIGH when stack is full |
| empty | 1-bit | HIGH when stack is empty |

## Stack Size

The stack contains 8 locations.

Each location stores 4 bits.

Therefore:

    Stack Size = 8 × 4 bits

## Working Principle

### Push

When:

    push = 1

data_in is stored at the top of the stack.

### Pop

When:

    pop = 1

the most recently stored data is removed and appears at data_out.

## Example

Push sequence:

    5 → 9 → 3

Stack:

    Top → 3
           9
           5

When POP is performed:

    data_out = 3

The next POP gives:

    data_out = 9

This demonstrates the LIFO principle.

## Files

- `stack.v` - Main Verilog design
- `stack_tb.v` - Testbench
- `output.txt` - Simulation output
- `README.md` - Project documentation

## Tools Used

- Verilog HDL
- Icarus Verilog
- Xilinx Vivado
- ModelSim

## How to Run

### Compile

```bash
iverilog -o stack stack.v stack_tb.v
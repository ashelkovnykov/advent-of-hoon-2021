# Advent of Hoon: 2021

Repo for my solutions to [Advent of Code](https://adventofcode.com) using Hoon.

## Contents

The code for my solutions is stored in `src/lib/advent`. The code to run the solutions from the dojo is stored in `src/ted/advent`. The input to the puzzles is stored in `src/input`, in a massaged format (i.e. as a Hoon object).

The code is formatted such that it can be run as its own desk in Hoon.

## Installation

I have made this code publicly available from my ship (`~finmep-lanteb`) as the `%advent` desk. To install it on your own ship, run:

```
|install ~finmep-lanteb %advent
```

Then run the solutions as a thread from the desk:

```
~zod:dojo> -advent!advent-day1-sweep /=advent=/input/day1/hoon
```

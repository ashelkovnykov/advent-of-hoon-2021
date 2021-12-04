# Advent of Hoon: 2021

Repo for my solutions to [Advent of Code](https://adventofcode.com) using Hoon.

## Contents

The code for my solutions is stored in `src/lib/advent`. The code to run the solutions from the dojo is stored in `src/ted/advent`. The input to the puzzles is stored in `src/input`, in a massaged format (i.e. as a Hoon object).

The code is formatted such that it can be run as its own desk in Hoon.

In addition, I adapted [~sipfyn-pidmex's script](https://gist.github.com/ynx0/be93cc1c086f8538155c69614d5644e4) for pulling input directly into your desk from the dojo.

## Installation

0. Clone this repo:

```
ashelkov@pc:~/Urbit/dev$ git clone https://github.com/ashelkovnykov/advent-of-hoon-2021.git
```

1. Create a new `%advent` desk in your ship:

```
~zod:dojo> |merge %advent our %base
~zod:dojo> |mount %advent
```

2. Remove the default contents of `%advent`:

```
ashelkov@pc:~/Urbit/dev$ rm -rf ~/Urbit/piers/finmep-lanteb/advent/*
```

3. Add contents from cloned repo to `%advent`:

```
ashelkov@pc:~/Urbit/dev$ cp -rfL advent-of-hoon-2021/src/* ~/Urbit/piers/finmep-lanteb/advent/
```

4. Commit changes to your ship:

```
~zod:dojo> |commit %advent
```

## Usage

Pull input directly to `src/input`:

```
~zod:dojo> -advent!advent-getinput [DAY] [ADVENT OF CODE SESSION COOKIE]
```

Then run the solutions as a thread from the desk:

```
~zod:dojo> -advent!advent-day1-sweep /=advent=/input/day1/txt
```

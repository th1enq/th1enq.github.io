---
title: Weird Algorithm
layout: post
problem_id: 1068
category: introduce
date: 2025-05-04
permalink: /cses/weird-algorithm/
math: true
---

## [Problem Source](https://cses.fi/problemset/task/1068)

## Problem Statement

Print the sequence of integers by following the rules:
- If the number is even, divide it by $2$.
- If the number is odd, multiply it by $3$ and add $1$.
- Repeat this process until the number becomes $1$.
- The first number is $n$.

## Solution
```py
n = int(input())

while n > 1:
    print(n, end=" ")
    n = (n * 3 + 1) if n % 2 else n // 2

print(1)
```
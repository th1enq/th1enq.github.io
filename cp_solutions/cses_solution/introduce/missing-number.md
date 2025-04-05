---
title: Missing Number
layout: post
problem_id: 1083
category: introduce
date: 2025-05-04
permalink: /cses/missing-number/
math: true
---

## [Problem Source](https://cses.fi/problemset/task/1083)

## Problem Statement
You are given all numbers between $1,2,…,n$ except one. Your task is to find the missing number.

## Solution
```py
n = int(input())
numbers = list(map(int, input().split()))

print((n * (n + 1) >> 1) - sum(numbers))
```

## Explanation
- Assume that the missing number is $x$.
- We have: 
  - $1 + 2 + ... + (x - 1) + x + (x + 1) + ... + n = \frac{n(n + 1)}{2}$
  - $x = \frac{n(n + 1)}{2} - 1 - 2 - ... - (x - 1) - (x + 1) - ... - n$
- So, we can find the missing number by subtracting the sum of the given numbers from the sum of all numbers from $1$ to $n$.

- Time complexity: $O(n)$
- Space complexity: $O(1)$ 
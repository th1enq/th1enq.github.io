---
title: Increasing Array
layout: post
problem_id: 1094
category: introduce
date: 2025-05-04
permalink: /cses/increasing-array/
math: true
---

## [Problem Source](https://cses.fi/problemset/task/1094)

## Problem Statement

You are given an array of $n$ integers. You want to modify the array so that it is increasing, i.e., every element is at least as large as the previous element.

On each move, you may increase the value of any element by one. What is the minimum number of moves required?

## Solution
```py
n = int(input())
a = list(map(int, input().split()))
 
result = 0
 
for i in range(1, n):
    if a[i] < a[i - 1]:
        result += a[i - 1] - a[i]
        a[i] = a[i - 1]
 
print(result)
```
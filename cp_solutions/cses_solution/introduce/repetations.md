---
title: Repeatations
layout: post
problem_id: 1069
category: introduce
date: 2025-05-04
permalink: /cses/repeatations/
math: true
---

## [Problem Source](https://cses.fi/problemset/task/1069)

## Problem Statement
You are given a DNA sequence: a string consisting of characters A, C, G, and T. Your task is to find the longest repetition in the sequence. This is a maximum-length substring containing only one type of character.

## Solution
```py
s = input()
 
current = 1
result = 1
pre = '?'
 
for c in s:
    current = current + 1 if c == pre else 1
    result = max(result, current)
    pre = c
 
print(result)
```
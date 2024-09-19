---
title: "A problem with magic Convex Hull"
date: 2024-09-18
categories: [Competitive Programming]
tags: [Geometry, Convex Hull]
math: true
--- 

Convex Hull is a very important concept in computational geometry. It is used to find the smallest convex polygon that encloses a set of points. In this post, we will discuss the Convex Hull problem and its application in competitive programming.

## Statement: WATERMOV
*Source: **Le Minh Hoang CSP Training Contest 11/2016***

You are given a set of $N$ bucket of water. The $i$-th bucket has a volume of $a_i$ liters. You are allowed to pour any amount of water from one bucket to next bucket (i.e. you can pour water from bucket $i$ to bucket $i+1$). The energy required to pour is equal to the amount of water poured (may not be an integer). 

Your task is keep the amount of water in the buckets in order from non decreasing, that is:

$$a_1 \leq a_2 \leq a_3 \leq \ldots \leq a_N$$

Find the minimum energy required to do this.

## Constraints:
- $N \leq 10^6$
- $1 \leq a_i \leq 10^6$

## Sample Input:
```
6
1 3 0 0 3 0
```
## Sample Output:
```
4.5
```
## Explanation:
- We will pour water to have the following state: $1 \leq 1.5 \leq 2.5 \leq 3 \leq 3 \leq 3:$
- Transfer $2$ liters from bucket $2$ to bucket $3$.
- Transfer $1$ liter from bucket $3$ to bucket $4$.
- Transfer $1.5$ liters from bucket $5$ to bucket $6$.

## Solution: (Coming soon)


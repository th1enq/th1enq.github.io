---
title: Missing Number 112
problem_id: 1083
category: introduce
date: 2024-03-16
layout: post
permalink: /cses/missing-number/
---

## Problem Statement
You are given all numbers between 1,2,…,n except one. Your task is to find the missing number.

## Solution
```cpp
#include <iostream>
using namespace std;

int main() {
    long long n;
    cin >> n;
    long long sum = 0;
    for (int i = 0; i < n-1; i++) {
        long long x;
        cin >> x;
        sum += x;
    }
    // Sum of first n natural numbers is n*(n+1)/2
    cout << n*(n+1)/2 - sum << endl;
    return 0;
}
```

## Explanation
The solution uses the mathematical formula for the sum of first n natural numbers:
- Sum of first n natural numbers = n*(n+1)/2
- We calculate the sum of given numbers
- The missing number is the difference between the expected sum and the actual sum

Time complexity: O(n)
Space complexity: O(1) 
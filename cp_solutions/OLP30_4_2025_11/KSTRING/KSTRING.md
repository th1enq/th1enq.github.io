---
title: "Problem 2: KSTRING (7 points)"
layout: code-page
category: olp30_4_11
date: 2025-04-06
permalink: /olp_30_4_11/kstring/
math: true
---

## Problem Statement

Tóm tắt đề bài:

Một hoán vị độ dài $k$ gọi là "đẹp" nếu thỏa mãn vị trí của các ký tự phải thỏa mãn bảng $A_{k \cdot k}$ như sau:

- $A_{i, j} = 1$ nếu ký tự $i$ có thể đứng ở vị trí $j$.
- $A_{i, j} = 0$ nếu ký tự $i$ không thể đứng ở vị trí $j$.

Cho một xâu ký tự $s$ có độ dài $n$ và một bảng $A_{k \cdot k}$.

Hãy tìm số lượng hoán vị "đẹp" độ dài $k$ là xâu con của $s$.

Xâu con được định nghĩa là một xâu con không liên tiếp của $s$.

## Contraints

- $1 \leq S \leq 100$
- $1 \leq k \leq 15$

## Solution

- Gọi $dp_{i, mask}$ là số lượng hoán vị "đẹp" **phân biệt** khi xét đến vị trí $i$ của xâu $s$ và các ký tự đã được chọn là biểu diễn bitmask của $mask$.

- Ta sẽ có công thức chuyển trạng thái như sau:
    - $dp_{i, mask} = dp_{i - 1, mask} + \sum_{0 \leq j < k} dp_{i - 1, mask \oplus 2^j}$ với $A_{j, t} = 1$
    - Trong đó, $j$ là các $bit$ chưa được bật trong $mask$ và $t$ là vị trí điền của ký tự $j$.

- Tuy nhiên, nếu làm như vậy, ta sẽ đếm trùng các hoán vị. Giả sử hãy quan sát trường hợp sau:
    - $s$ = `xy**`
    - Khi đó hoán vị `xyz` sẽ được đếm $2$ lần tại $i = 3$ và $i = 4$.

- Như vậy, ta cần phải trừ công thức trên của ta đi một lượng bị trùng

- Gọi $f_{j, mask}$ là số hoán vị "đẹp" phân biệt với ký tự $j$ là ký tự cuối cùng và các ký tự đã được chọn là biểu diễn bitmask của $mask$ trong đoạn $[1, i - 1]$.

- Để tính $f$, ta làm khá tương tự như $dp$:
    - $f_{j, mask} = \sum_{0 \leq p < k} dp_{i-1, mask \oplus 2^p} - f_{j, mask}$ với $A_{j, t} = 1$.

- Như vậy, cuối cùng công thức của ta sẽ là:
    - $dp_{i, mask} = dp_{i - 1, mask} + \sum_{0 \leq j < k} dp_{i - 1, mask \oplus 2^j} - f_{j, mask}$ với $A_{j, t} = 1$.
    - $f_{j, mask} = \sum_{0 \leq p < k} dp_{i-1, mask \oplus 2^p} - f_{j, mask}$ với $A_{j, t} = 1$.

- Độ phức tạp: $O(n \cdot 2^k \cdot k)$.

## Example Code

```golang
package main

import (
	"bufio"
	"fmt"
	"math/bits"
	"os"
	"strconv"
)

const bufferSize = 1000000

var scanner *Scanner

type Scanner struct {
	*bufio.Scanner
}

func (s *Scanner) nextInt() int {
	s.Scan()
	t := s.Text()
	i, _ := strconv.Atoi(t)
	return i
}

func (s *Scanner) nextInt64() int64 {
	s.Scan()
	t := s.Text()
	i, _ := strconv.ParseInt(t, 10, 64)
	return i
}

func (s *Scanner) nextWord() string {
	s.Scan()
	return s.Text()
}

var writer *bufio.Writer

func init() {
	scanner = &Scanner{bufio.NewScanner(os.Stdin)}
	buffer := make([]byte, 0, bufferSize)
	scanner.Buffer(buffer, bufferSize)
	scanner.Split(bufio.ScanWords)

	writer = bufio.NewWriter(os.Stdout)
}

func GetBit(x, i int) int {
	return ((x >> i) & 1)
}

func main() {
	k := scanner.nextInt()
	a := make([][]int, k)

	for i := 0; i < k; i++ {
		a[i] = make([]int, k)
		for j := 0; j < k; j++ {
			a[i][j] = scanner.nextInt()
		}
	}

	s := scanner.nextWord()
	n := len(s)
	s = " " + s

	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, 1<<k)
		for mask := 0; mask < (1 << k); mask++ {
			dp[i][mask] = 0
		}
	}

	f := make([][]int, k)
	for i := 0; i < k; i++ {
		f[i] = make([]int, 1<<k)
		for mask := 0; mask < (1 << k); mask++ {
			f[i][mask] = 0
		}
	}

	dp[0][0] = 1

	for i := 1; i <= n; i++ {
		for mask := 0; mask < (1 << k); mask++ {
			pos := bits.OnesCount(uint(mask))
			dp[i][mask] = dp[i-1][mask]
			if s[i] == '*' {
				for j := 0; j < k; j++ {
					if GetBit(mask, j) == 1 && a[j][pos-1] == 1 {
						dp[i][mask] += dp[i-1][mask^(1<<j)] - f[j][mask]
					}
				}
			} else {
				id := int(s[i] - 'a')
				if id < k && GetBit(mask, id) == 1 && a[id][pos-1] == 1 {
					dp[i][mask] += dp[i-1][mask^(1<<id)] - f[id][mask]
				}
			}
		}

		for mask := 0; mask < (1 << k); mask++ {
			pos := bits.OnesCount(uint(mask))
			if s[i] == '*' {
				for j := 0; j < k; j++ {
					if GetBit(mask, j) == 1 && a[j][pos-1] == 1 {
						f[j][mask] += dp[i-1][mask^(1<<j)] - f[j][mask]
					}
				}
			} else {
				id := int(s[i] - 'a')
				if id < k && GetBit(mask, id) == 1 && a[id][pos-1] == 1 {
					f[id][mask] += dp[i-1][mask^(1<<id)] - f[id][mask]
				}
			}
		}
	}
	fmt.Fprint(writer, dp[n][(1<<k)-1])
	writer.Flush()
}
```
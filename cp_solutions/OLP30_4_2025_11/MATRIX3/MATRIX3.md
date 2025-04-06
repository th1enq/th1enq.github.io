---
title: "Problem 1: MAXTRIX3 (6 points)"
layout: code-page
category: olp30_4_11
date: 2025-04-06
permalink: /olp_30_4_11/matrix3/
math: true
---

## Problem Statement

Tóm tắt đề bài: 

Cho một ma trận kích thước $N$ dòng, $M$ cột. Mỗi ô trong ma trận có giá trị $a_{i, j}$. Từ một ô $(i, j)$, bạn có thể di chuyển đến ô $(i + 1, j)$ hoặc $(i, j + 1)$. Tuy nhiên không thể đi xuống dưới $3$ lần liên tiếp. 

Hãy tìm đường đi có tổng lớn nhất từ ô $(1, 1)$ đến ô $(N, M)$.

## Constraints
- $1 \leq N, M \leq 2025$
- $-10^9 \leq a_{i, j} \leq 10^5$

## Solution

- Đặt $dp_{i, j, k}$ là giá trị lớn nhất có thể đạt được khi đến ô $(i, j)$ với $k$ lần đi xuống liên tiếp.

- Ta sẽ có một số công thức chuyển trạng thái như sau:
  - Nếu $k = 0$, ta có: $dp_{i, j, 0} = max(dp_{i, j - 1, p_{0 \leq p \leq 2}}) + a_{i, j}$.
  - Nếu $k \geq 1$, ta có: $dp_{i, j, k} = max(dp_{i - 1, j, k - 1}) + a_{i, j}$.

- Trường hợp cơ sở: $dp_{1, 1, 0} = a_{1, 1}$.
- Đáp án sẽ là $max(dp_{N, M, k_{0 \leq k \leq 2}})$.

- Độ phức tạp: $O(N \cdot M)$.

## Example Code
```golang
package main

import (
	"bufio"
	"fmt"
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

func main() {

	n, m := scanner.nextInt(), scanner.nextInt()

	dp := make([][][]int64, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([][]int64, m+1)
		for j := 0; j <= m; j++ {
			dp[i][j] = make([]int64, 3)
			for k := 0; k <= 2; k++ {
				dp[i][j][k] = int64(-1e15)
			}
		}
	}

	for i := 1; i <= n; i++ {
		for j := 1; j <= m; j++ {
			x := scanner.nextInt()
			for k := 0; k <= 2; k++ {
				if i == 1 && j == 1 && k == 0 {
					dp[i][j][k] = int64(x)
				} else if j > 1 && k == 0 {
					for p := 0; p <= 2; p++ {
						dp[i][j][k] = max(dp[i][j][k], dp[i][j-1][p]+int64(x))
					}
				} else if i > 1 && k >= 1 {
					dp[i][j][k] = max(dp[i][j][k], dp[i-1][j][k-1]+int64(x))
				}
			}
		}
	}

	res := max(dp[n][m][0], dp[n][m][1], dp[n][m][2])

	fmt.Fprint(writer, res)

	writer.Flush()
}
```
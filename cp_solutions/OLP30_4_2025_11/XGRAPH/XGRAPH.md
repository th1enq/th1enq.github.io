---
title: "Problem 3: XGRAPH (7 points)"
layout: code-page
category: olp30_4_11
date: 2025-04-06
permalink: /olp_30_4_11/xgraph/
math: true
---

## Problem Statement

Tóm tắt đề bài:

Cho một đồ thị vô hướng $n$ đỉnh, $m$ cạnh có trọng số $(u, v, w)$

Mỗi đỉnh có $2$ giá trị là $(S_i, C_i)$.

Cho $q$ truy vấn, mỗi truy vấn có dạng $(L_j, H_j, R_j)$. Với mỗi truy vấn hãy tìm giá trị nhỏ nhất của $C_i$ sao cho $L_j \leq S_i \leq H_j$ và khoảng cách di chuyển từ đỉnh $1$ tới $i$ không quá $R_j$.

## Constraints
- $1 \leq n, m, q \leq 10^5$
- $1 \leq S_i, C_i \leq 10^9$
- $1 \leq u, v \leq n$
- $1 \leq w \leq 10^9$
- $1 \leq L_j, H_j \leq 10^9$
- $1 \leq R_j \leq 10^{14}$

## Solution

- Trước tiên ta sử dụng thuật toán Dijkstra để tìm khoảng cách từ đỉnh $1$ tới tất cả các đỉnh còn lại. 
- Gọi $D_i$ là khoảng cách ngắn nhất từ đỉnh $1$ tới đỉnh $i$.
- Ta sẽ giải quyết các truy vấn offline. 
- Sắp xếp các truy vấn theo thứ tự tăng dần của $R_j$.
- Sắp xếp các đỉnh theo thứ tự tăng dần của $D_i$.
- Với mỗi truy vấn $(L_j, H_j, R_j)$, ta sử dụng 2 con trỏ để tìm $i$ lớn nhất sao cho $D_i \leq R_j$.
- Đến đây, mỗi lúc đi qua đỉnh $i$, ta thực hiện $Update(S_i)$ lên giá trị $C_i$.
- Cuối cùng, truy vấn $(L_j, H_j, R_j)$ sẽ có giá trị là $min(C_i)$ với $L_j \leq S_i \leq H_j$.
- Để thực hiện $Update$ và $QueryMin$, ta có thể sử dụng Segment Tree
- Lưu ý: vì giá trị của $L_j, H_j$ rất lớn, ta sẽ sử dụng kỹ thuật nén số để giảm kích thước của các giá trị này.

- Độ phức tạp: $O((n + m) \cdot log(n) + q \cdot log(n))$.

## Example Code
```golang
package main

import (
	"bufio"
	"container/heap"
	"fmt"
	"os"
	"sort"
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

type Item struct {
	value    int
	priority int64
	index    int
}

type PriorityQueue []*Item

func (pq PriorityQueue) Len() int { return len(pq) }

func (pq PriorityQueue) Less(i, j int) bool { return pq[i].priority < pq[j].priority }

func (pq PriorityQueue) Swap(i, j int) {
	pq[i], pq[j] = pq[j], pq[i]
	pq[i].index = i
	pq[j].index = j
}

func (pq *PriorityQueue) Push(x any) {
	n := len(*pq)
	item := x.(*Item)
	item.index = n
	*pq = append(*pq, item)
}

func (pq *PriorityQueue) Pop() any {
	old := *pq
	n := len(old)
	item := old[n-1]
	old[n-1] = nil
	item.index = -1
	*pq = old[0 : n-1]
	return item
}

type Pair struct {
	firstValue  int
	secondValue int64
}

type Triple struct {
	L     int
	H     int
	R     int64
	index int
}

const maxN int = 3 * int(1e5+3)

var n int
var seg [4 * maxN]int

func Init(node, l, r int) {
	if l == r {
		seg[node] = int(1e9 + 1)
		return
	}

	mid := (l + r) >> 1
	Init(node<<1, l, mid)
	Init(node<<1|1, mid+1, r)
	seg[node] = min(seg[node<<1], seg[node<<1|1])
}

func Update(u, w, node, l, r int) {
	if l == r {
		seg[node] = min(seg[node], w)
		return
	}
	mid := (l + r) >> 1
	if mid >= u {
		Update(u, w, node<<1, l, mid)
	} else {
		Update(u, w, node<<1|1, mid+1, r)
	}
	seg[node] = min(seg[node<<1], seg[node<<1|1])
}

func GetMin(u, v, node, l, r int) int {
	if u > r || v < l {
		return int(1e9 + 1)
	}
	if l >= u && r <= v {
		return seg[node]
	}
	mid := (l + r) >> 1
	return min(GetMin(u, v, node<<1, l, mid), GetMin(u, v, node<<1|1, mid+1, r))
}

func main() {
	n = scanner.nextInt()
	m, q := scanner.nextInt(), scanner.nextInt()

	adj := make([][]Pair, n+1)
	a := make([]Pair, n+1)
	compress := make([]int, 0)

	for i := 1; i <= n; i++ {
		a[i] = Pair{
			firstValue:  scanner.nextInt(),
			secondValue: int64(scanner.nextInt()),
		}
		compress = append(compress, a[i].firstValue)
	}

	for i := 0; i < m; i++ {
		u, v, w := scanner.nextInt(), scanner.nextInt(), scanner.nextInt()
		adj[u] = append(adj[u], Pair{v, int64(w)})
		adj[v] = append(adj[v], Pair{u, int64(w)})
	}

	query := make([]Triple, q)

	for i := 0; i < q; i++ {
		query[i] = Triple{
			L:     scanner.nextInt(),
			H:     scanner.nextInt(),
			R:     scanner.nextInt64(),
			index: i,
		}
		compress = append(compress, query[i].L)
		compress = append(compress, query[i].H)
	}

	sort.Slice(compress, func(i, j int) bool {
		return compress[i] < compress[j]
	})

	mp := make(map[int]int)
	cnt := 0

	for _, v := range compress {
		_, exist := mp[v]
		if !exist {
			cnt++
			mp[v] = cnt
		}
	}

	sort.Slice(query, func(i, j int) bool {
		return query[i].R < query[j].R
	})

	dp := make([]int64, n+1)
	for i := 1; i <= n; i++ {
		dp[i] = int64(1e18)
	}

	dp[1] = 0
	pq := make(PriorityQueue, 0)
	heap.Init(&pq)

	heap.Push(&pq, &Item{
		value:    1,
		priority: dp[1],
	})

	for pq.Len() > 0 {
		u := heap.Pop(&pq).(*Item)
		if dp[u.value] != u.priority {
			continue
		}
		for _, v := range adj[u.value] {
			if dp[v.firstValue] > u.priority+v.secondValue {
				dp[v.firstValue] = u.priority + v.secondValue
				heap.Push(&pq, &Item{
					value:    v.firstValue,
					priority: dp[v.firstValue],
				})
			}
		}
	}

	v := make([]Pair, 0)

	for i := 1; i <= n; i++ {
		if a[i].firstValue != 0 && a[i].secondValue != 0 {
			v = append(v, Pair{
				firstValue:  i,
				secondValue: dp[i],
			})
		}
	}

	sort.Slice(v, func(i, j int) bool {
		return v[i].secondValue < v[j].secondValue
	})

	j := 0

	Init(1, 1, cnt)

	res := make([]int, q)

	for _, qry := range query {
		for j < len(v) && v[j].secondValue <= qry.R {
			u := v[j].firstValue
			Update(mp[a[u].firstValue], int(a[u].secondValue), 1, 1, cnt)
			j++
		}
		l := mp[qry.L]
		r := mp[qry.H]
		res[qry.index] = GetMin(l, r, 1, 1, cnt)
	}

	for i := 0; i < q; i++ {
		if res[i] == int(1e9+1) {
			fmt.Fprintln(writer, -1)
		} else {
			fmt.Fprintln(writer, res[i])
		}
	}

	writer.Flush()
}
```
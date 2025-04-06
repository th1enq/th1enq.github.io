---
title: "Tôi không hiểu mình code gì !!!???"
layout: post
date: 2025-04-05
categories: [Competitive Programming]
tags: [Divide and Conquer]
math: true
---

## Summary

Xin chào, nhân dịp nghỉ lễ không có gì làm. Tình cờ lục lại đống code cũ từ thời cấp 3, mình thấy có một bài code mà mình không hiểu nổi mình đã code gì.

Cụ thể đó là bài [COCI 2014 Contest 2 #6 Norma](https://oj.vnoi.info/problem/norma). Đây là một bài có số điểm khá cao trên VNOI (1.63). Sau khi mở code ra và nó trông như thế này: 

(Ps: Đừng ai để ý mấy cái comment ở đầu nhé, mình chỉ để cho vui thôi. Mình không biết nó có ý nghĩa gì và cũng không biết tại sao mình lại để nó ở đây.
Mình chỉ biết là nó rất đẹp và mình đã từng rất thích nó. Bây giờ thì mình không còn thích nó nữa, nhưng mình vẫn để lại đây để làm kỷ niệm.)

```cpp
/******************************
*    author : @NoFearrr       *
*    date : 17 / 10 / 2022    *
******************************/

/*   (≈ㅇᆽㅇ≈)♡    (≈ㅇᆽㅇ≈)♡    (≈ㅇᆽㅇ≈)♡    (≈ㅇᆽㅇ≈)♡    (≈ㅇᆽㅇ≈)♡ */
/*
                              /^--^\     /^--^\     /^--^\
                              \____/     \____/     \____/
                             /      \   /      \   /      \
                            |        | |        | |        |
                             \__  __/   \__  __/   \__  __/
        |^|^|^|^|^|^|^|^|^|^|^|^\ \^|^|^|^/ /^|^|^|^|^\ \^|^|^|^|^|^|^|^|^|^|^|^|
        | | | | | | | | | | | | |\ \| | |/ /| | | | | |\ \| | | | | | | | | | | |
        | | | | | | | | | | | | |/ /| | |\ \| | | | | |/ /| | | | | | | | | | | |
        | | | | | | | | | | | | |\/ | | | \/| | | | | |\/ | | | | | | | | | | | |
        #########################################################################
        | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
        | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |         */

/*******************************************************************************************
*            #################################################################             *
*            #                             _`                                #             *
*            #                          _ooOoo_                              #             *
*            #                         o8888888o                             #             *
*            #                         88" . "88                             #             *
*            #                         (| -_- |)                             #             *
*            #                         O\  =  /O                             #             *
*            #                      ____/`---'\____                          #             *
*            #                    .'  \|     |//  `.                         #             *
*            #                   /  \|||  :  |||//  \                        #             *
*            #                  /  _||||| -:- |||||_  \                      #             *
*            #                  |   | \  -  /'| |   |                        #             *
*            #                  | \_|  `\`---'//  |_/ |                      #             *
*            #                  \  .-\__ `-. -'__/-.  /                      #             *
*            #                ___`. .'  /--.--\  `. .'___                    #             *
*            #             ."" '<  `.___\_<|>_/___.' _> \"".                 #             *
*            #            | | :  `- \`. ;`. _/; .'/ /  .' ; |                #             *
*            #            \  \ `-.   \_\_`. _.'_/_/  -' _.' /                #             *
*            #=============`-.`___`-.__\ \___  /__.-'_.'_.-'=================#             *
*                                      `=--=-'                                             *
*                                                                                          *
*                                       /\_/\*                                             *
*                                      (  -.-)                                             *
*         _.-/`)                       / >O  \>1                            _.-/`)         *
*        // / / )                                                         // / / )         *
*     .=// / / / )              /\_/\           /\_/\                  .=// / / / )        *
*    //`/ / / / /              (  -.-)         (  -.-)                //`/ / / / /         *
*   // /     ` /               / >O  \>1       / >O  \>1             // /     ` /          *
*   \       /                                                        \       /             *
*    ))    .'            /\_/\         /\_/\         /\_/\            ))    .'             *
*   //    /             (  -.-)       (  -.-)       (  -.-)           //    /              *
*        /              / >O  \>1     / >O  \>1     / >O  \>1              /               *
*                                                                                          *
*******************************************************************************************/

#include <bits/stdc++.h>
// #pragma GCC optimize("O2")
// #pragma GCC target("avx,avx2,fma")
// #pragma GCC optimize ("O3,unroll-loops,no-stack-protector")
// #pragma GCC target ("sse,sse2,sse3,ssse3,sse4,popcnt,abm,mmx,avx,tune=native")
using namespace std;
mt19937 rng(chrono::steady_clock::now().time_since_epoch().count());

#define PB push_back
#define ALL(i_) i_.begin(), i_.end()
#define LOG2(x) (31 - __builtin_clz(x))
#define getBit(x, i) ((x >> i) & 1)
#define rd(l, r) (l + rng() % (r - l + 1))
#define FOR(i_, a_, b_)  for(int i_ = (int) (a_); i_ <= (int) (b_); ++i_)
#define FORD(i_, a_, b_) for(int i_ = (int) (a_); i_ >= (int) (b_); --i_)
#define db(val) "["#val" = "<<(val)<<"] "
#define int long long

typedef long long ll;
typedef long double ld;
typedef pair<int, int> ii;

template<class X, class Y> bool minimize(X &x, const Y &y){
    X eps = 1e-9;
    if (x > y + eps) {
        x = y;
        return 1;
    }
    return 0;
}

template<class X, class Y> bool maximize(X &x, const Y &y) {
    X eps = 1e-9;
    if (x + eps < y) {
        x = y;
        return 1;
    }
    return 0;
}

template<class T> T Abs(const T &x) { return (x < 0 ? -x : x); }

const int mod = (int) 1e9;
const int oo = (int) 1e9 + 99;
const int maxn = (int) 5e5 + 11;
const int LOG = (int) 20;
const ii dxy8[] = { {-1, 0}, {1, 0}, {0, 1}, {0, -1}, {1, -1}, {1, 1}, {-1, 1}, {-1, -1} };
const ii dxy4[] = { {-1, 0}, {1, 0}, {0, 1}, {0, -1} };

int n;
int a[maxn], Mn[maxn];
int res = 0;

void Add(int &x, int y){
	x += y;
	if(x >= mod) x -= mod;
}

void Sub(int &x, int y){
	x -= y;
	if(x < 0) x += mod;
}

int Mul(int x, int y){
	int res = ((ll) x * y) % mod;
	return res;
}

ll SUM(int l, int r){
	ll R = (ll) r * (r + 1) / (ll) 2;
	R %= mod;
	ll L = (ll) l * (l - 1) / (ll) 2;
	L %= mod;
	Sub(R, L);
	return R;
}

void solve(int l, int r){
	if(l > r) return;
	if(l == r){
		Add(res, Mul(a[l], a[r]));
		return;
	}
	int mid = (l + r) >> 1;

	int jmax, jmin, Max, Min, cur, temp;

	cur = 0, temp = 0;
	jmax = mid, jmin = mid;
	Max = INT_MIN;
	Min = INT_MAX;
	Mn[mid] = INT_MAX;

	FORD(i, mid, l){
		maximize(Max, a[i]);
		minimize(Min, a[i]);
		Add(temp, cur);
		while(jmax < r && a[jmax + 1] <= Max){
			++jmax;
			Mn[jmax] = a[jmax];
			minimize(Mn[jmax], Mn[jmax - 1]);
			Add(cur, Mn[jmax]);
			Add(temp, Mul(Mn[jmax], (jmax - i + 1)));
		}
		while(jmin < r && a[jmin + 1] >= Min){
			++jmin;	
			Mn[jmin] = a[jmin];
			minimize(Mn[jmin], Mn[jmin - 1]);
			Sub(cur, Mn[jmin]);
			Sub(temp, Mul(Mn[jmin], (jmin - i + 1)));
		}
		int last = min(jmin, jmax);
		int len = last - (mid + 1) + 1;
		ll sum = (ll) len * (1 - i) % mod;
		Add(sum, SUM(mid + 1, last));
		int val = Mul(Mul(Max, Min), sum);
		Add(res, val);
		if(jmax > jmin){
			Add(res, Mul(Max, temp));
		}
	}

	cur = 0, temp = 0;
	jmax = mid + 1, jmin = mid + 1;
	Max = INT_MIN;
	Min = INT_MAX;
	Mn[mid + 1] = INT_MAX;
	FOR(i, mid + 1, r){
		maximize(Max, a[i]);
		minimize(Min, a[i]);
		Add(temp, cur);
		while(jmax > l && a[jmax - 1] < Max){
			--jmax;
			Mn[jmax] = a[jmax];
			minimize(Mn[jmax], Mn[jmax + 1]);
			Add(cur, Mn[jmax]);
			Add(temp, Mul(Mn[jmax], (i - jmax + 1)));
		}
		while(jmin > l && a[jmin - 1] > Min){
			--jmin;	
			Mn[jmin] = a[jmin];
			minimize(Mn[jmin], Mn[jmin + 1]);
			Sub(cur, Mn[jmin]);
			Sub(temp, Mul(Mn[jmin], (i - jmin + 1)));
		}
		int last = max(jmin, jmax);
		int len = mid - last + 1;
		ll sum = (ll) len * (i + 1) % mod;
		Sub(sum, SUM(last, mid));
		int val = Mul(Mul(Max, Min), sum);
		Add(res, val);
		if(jmax < jmin){
			Add(res, Mul(Max, temp));
		}
	}

	solve(l, mid);
	solve(mid + 1, r);
}

signed main(){
    ios_base::sync_with_stdio(0); cin.tie(0); cout.tie(0);
    #define TASK "NORMA"
    if(fopen(TASK".inp", "r")) {
        freopen(TASK".inp", "r", stdin);
        freopen(TASK".out", "w", stdout);
    }
    cin >> n;
    FOR(i, 1, n) cin >> a[i];
    solve(1, n);
	cout << res;
    return 0;
}
/*   (≈ㅇᆽㅇ≈)♡    (≈ㅇᆽㅇ≈)♡    (≈ㅇᆽㅇ≈)♡    (≈ㅇᆽㅇ≈)♡    (≈ㅇᆽㅇ≈)♡ */
```

## Problem Statement
Tóm tắt bài toán như sau:

Cho một dãy $n$ số nguyên dương $a_1, a_2, \ldots, a_n$. Hãy tính giá trị của biểu thức:

$$S = \sum_{1 \leq i \leq j \leq n} max(a_i, a_{i+1}, \ldots, a_j) \cdot min(a_i, a_{i+1}, \ldots, a_j) \cdot (j - i + 1) \mod 10^9$$

- $1 \leq N \leq 5 \cdot 10^5$
- $1 \leq a_i \leq 10^8$

## Solution

Sau hơn một tiếng đồng hồ ngồi đọc lại đống bầy nhầy này, cuối cùng mình cũng đã hiểu và có thể tự tin giải thích được nó trong bài viết này

Chúng ta sẽ không bàn tới lời giải có độ phức tạp $O(n^2)$ của bài toán này, mà sẽ đi thẳng vào lời giải $O(n \log n)$ của nó.

Giả sử ta đang tính đến đoạn $[l, r]$ và chia làm $2$ phần là $[l, mid]$ và $[mid + 1, r]$. Nhiệm vụ của ta là đếm số cặp $(i, j)$ với $l \leq i \leq mid < j \leq r$ sao cho thỏa mãn.

Ta xây dựng $4$ mảng sau:
- $maxL[i]$: giá trị lớn nhất trong đoạn $[i, mid]$
- $minL[i]$: giá trị nhỏ nhất trong đoạn $[i, mid]$
- $maxR[i]$: giá trị lớn nhất trong đoạn $[mid + 1, i]$
- $minR[i]$: giá trị nhỏ nhất trong đoạn $[mid + 1, i]$

Nếu ta duyệt $i$ và với mỗi điểm $i$ đếm xem có bao nhiêu giá trị $j$ thỏa mãn, tuy nhiên ta thấy rằng nếu xét tất cả $mid < j \leq r$ thì rất khó để xác định được max và min của đoạn $[i, j]$.

Do đó, ta chỉ xét $j$ với $maxL[i] \geq maxR[j]$ tức là ta đang giả sử giá trị max nằm về bên trái của $mid$ 

Và để tránh xét thiếu các $j$ mà $maxL[i] < maxR[j]$ thì ta chỉ cần làm tương tự với trên. Cố định $j$ và đếm số $i$ thỏa mãn. Chú ý dấu ta chỉ xét dấu $<$ thôi nhé để tránh đếm trùng $2$ lần.

Với mỗi giá trị $i$, ta có 
- $j_m$ là vị trí lớn nhất có $maxL[i] \geq maxR[j_m]$ (tức là vị trí $j$ lớn nhất mà $i$ vẫn là max trong đoạn $[i, j_m]$ đó)
- Như vậy ta đã có được giá max trong đoạn $[i, j_m]$ sẽ là $maxL[i]$. Nhiệm vụ bây giờ là tìm min trong đoạn $[i, j_m]$
- Dễ hình dung ta có 2 trường hợp sau đây:
	1. Gọi $j_s$ là vị trí lớn nhất có $minL[i] \leq min[j_s]$ (tức là vị trí cuối cùng mà $minL[i]$ vẫn là min trong đoạn $[i, j_s]$
		Khi đó ta có min của đoạn từ $[mid + 1, j_s]$ chính là bằng $minL[i]$. Trường hợp này đóng góp cho đáp án:

		$$S = \sum_{mid < j \leq j_s} maxL[i] \cdot minL[i] \cdot (j - i + 1)$$
	
		- Để dễ nhìn hơn, đặt $T = maxL[i] \cdot minL[i]$
		- Khi đó ta có thể viết lại công thức trên thành:

		$$S = T \cdot (1-i) \cdot (j_s - mid) + T \cdot \sum_{mid < j \leq j_s} j$$

		$$S = T \cdot (1-i) \cdot (j_s - mid) + T \cdot \frac{(j_s - mid) \cdot (j_s + mid + 1)}{2}$$
	2. Với những vị trí $j$ còn lại tức là $j_s < j \leq j_m$. Min trong đoạn $[i, j]$ này sẽ là $min(minL[i], minR[j])$


		- Trường hợp này, đặt $M = min(minL[i], minR[j])$
		- Khi đó, đáp án cho trường này này bổ sung một lượng:
			
			$$ S = \sum_{j_s < j <= j_m} maxL[i] \cdot M \cdot (j - i + 1)$$

		- Vấn đề là ta không thể duyệt lại thêm một lần nữa từ $j_s$ đến $j_m$ được, vì vậy ta sẽ dùng một biến $temp$ để lưu lại giá trị này.
		- Khi ta tìm $j_m$ ta sẽ thêm một lượng $M \cdot (j - i + 1)$ vào biến $temp$.
		- Khi ta tìm $j_s$ ta sẽ trừ một lượng $M \cdot (j - i + 1)$ vào biến $temp$.
		- Phần dư của temp chính là giá trị cần tìm
		- Như vậy ta sẽ có được giá trị $temp$ cho đoạn $(j_s, j_m]$ mà không cần phải duyệt lại từ đầu.
		- Chú ý, đáp án cho trường hợp nay chỉ tồn tại nếu $j_s < j_m$ thôi nhé. Nếu không thì ta sẽ không có giá trị nào cả :>

Rồi như vậy ta đã giải quyết gần như xong bài toán rồi đó. Về trường hợp thứ 2 khi giá trị max nằm về phía bên phải. Ta làm tương tự y hệt như trên.

Sau đó gọi đệ quy cho $[l, mid]$ và $[mid + 1, r]$ là xong bài toán rồi.

## Conclusion

Theo mình đánh giá, đây là một bài dùng chia để trị khá thú vị. Chắc hẳn sẽ có một số cách khác hay và thông minh hơn chứ không "khủng bố" như kia xD.

Xong, đây là chia sẻ của mình về 1 hướng giải cho bài toán này. Hy vọng sẽ giúp ích cho các bạn trong quá trình ôn luyện của mình.

Nếu có gì sai sót hay không đúng thì mong các bạn góp ý cho mình nhé. Mình sẽ sửa lại cho đúng.


Cảm ơn các bạn đã đọc bài viết của mình. Chúc các bạn có một ngày vui vẻ và học tập hiệu quả nhé. Happy coding :3









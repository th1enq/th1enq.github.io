---
title: Olpympic 30/4 2025 Khối 11
layout: cses-page
type: cp
description: Lời giải đề thi Olympic 30/4 2025 môn Tin học khối 11
maxProblem: 3
doneProblem: 3
category: [Dynamic Programming, Dijkstra, Segment Tree, Inclusion-Exclusion]
---

<div class="solutions-container">
  <div class="header-section">
    <div class="flex items-center justify-between mb-8">
      <h1 class="title">Olympic 30/4 2025 Khối 11</h1>
    </div>

    <div class="description-box">
      <p>
      Cuộc thi Olympic truyền thống 30 tháng 4 là một cuộc thi học sinh giỏi hàng năm dành cho học sinh khối 10 và 11 của khu vực phía Nam. Cuộc thi này do trường THPT Chuyên Lê Hồng Phong sáng lập và được tổ chức lần đầu tiên vào năm 1995. 

      Dưới đây là lời giải của mình cho đề thi Môn Tin Học của Khối 11 sử dụng ngôn ngữ Golang.
      </p>
    </div>
  </div>

  {% assign categories = "olp30_4_11" | split: "," %}
  {% for category in categories %}
    <div class="solutions-section">
      <div class="category-section">
        <h2>
            Link đề bài và nộp bài: 
            <a href="https://codeforces.com/gym/601507" target="_blank" >
              <i class="fas fa-external-link-alt"></i>
              Codeforces
            </a>
        </h2>
        <h2> Problems</h2>
        <div class="solutions-grid">
          {% assign solutions = site.pages | where: "category", category | sort: "title" %}
          {% for solution in solutions %}
            <div class="solution-item">
              <a href="{{ solution.url | relative_url }}" class="solution-link">
                <div class="solution-content">
                  <h3>{{ solution.title }}</h3>
                  <div class="solution-date">{{ solution.date | date: "%b %d, %Y" }}</div>
                </div>
              </a>
            </div>
          {% endfor %}
        </div>
      </div>
    </div>
  {% endfor %}
</div>

<style>
.solutions-container {
  max-width: 56rem;
  margin: 0 auto;
  padding: 3rem 1rem;
}

.header-section {
  margin-bottom: 2rem;
}

.title {
  font-size: 2.25rem;
  font-weight: 700;
  color: #e4e4e7;
  margin: 0;
}

.progress-text {
  color: #3B82F6;
  font-size: 0.875rem;
  font-weight: 500;
}

.description-box {
  background: rgba(24, 24, 27, 0.3);
  backdrop-filter: blur(16px);
  border: 1px solid rgba(255, 255, 255, 0.05);
  border-radius: 0.75rem;
  padding: 1.5rem;
  margin-bottom: 2rem;
}

.description-box p {
  color: rgba(209, 213, 219, 0.7);
  line-height: 1.6;
  margin: 0;
}

.category-section {
  margin-bottom: 2rem;
}

.category-section h2 {
  font-size: 1.5rem;
  font-weight: 700;
  color: #e4e4e7;
  margin-bottom: 1rem;
}

.solutions-grid {
  display: grid;
  gap: 0.5rem;
}

.solution-item {
  background: rgb(24, 24, 27);
  border: 1px solid rgba(63, 63, 70, 0.4);
  border-radius: 0.75rem;
  padding: 1rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
  transition: border-color 0.2s ease;
}

.solution-item:hover {
  border-color: rgba(59, 130, 246, 0.4);
}

.solution-link {
  flex: 1;
  text-decoration: none;
  color: inherit;
}

.solution-link:hover {
  text-decoration: none;
}

.solution-content {
  flex: 1;
}

.solution-content h3 {
  color: #e4e4e7;
  font-size: 1rem;
  font-weight: 600;
  margin: 0;
}

.solution-date {
  color: #71717a;
  font-size: 0.875rem;
  margin-top: 0.25rem;
}

.view-solution {
  color: #3B82F6;
  text-decoration: none;
  font-size: 0.875rem;
  font-weight: 500;
  display: inline-flex;
  align-items: center;
  gap: 0.25rem;
  margin-left: 1rem;
}

.view-solution:hover {
  color: #60A5FA;
  text-decoration: none !important;
}

.view-solution .fa-external-link-alt {
  font-size: 0.75rem;
}

.flex {
  display: flex;
}

.items-center {
  align-items: center;
}

.justify-between {
  justify-content: space-between;
}

.mb-8 {
  margin-bottom: 2rem;
}
</style>
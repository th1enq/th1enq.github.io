---
# the default layout is 'page'
icon: fas fa-code
order: 4
---

{% assign cards = site.cp | sort: "date" | reverse %}
{% for card in cards %}
  <div class="adventure-card" data-url="{{ card.url | relative_url }}">
    <div class="d-flex justify-content-between align-items-start mb-2">
      <h2 class="m-0">{{ card.title }}</h2>
      <div class="time-period">2025 - Present</div>
    </div>
    
    <div class="description mb-3">
      {{ card.description }}
    </div>
    
   <div class="progress mb-2">
    <div class="progress-bar" role="progressbar" 
        style="width: {{ card.doneProblem | times: 100.0 | divided_by: card.maxProblem }}%" 
        aria-valuenow="{{ card.doneProblem }}" 
        aria-valuemin="0" 
        aria-valuemax="{{ card.maxProblem }}">
    </div>
  </div>
    <div class="text-end mb-2 problems-count"> {{ card.doneProblem }} / {{card.maxProblem }} problems solved</div>
    
    <div class="tags mb-2">
      {% for tag in card.category %}
        <span class="badge">{{ tag }}</span>
      {% endfor %}
    </div>
    
    <a href="{{ card.linkSection }}" class="view-progress" target="_blank" onclick="event.stopPropagation()">
      View Progress <i class="fas fa-external-link-alt"></i>
    </a>
  </div>
{% endfor %}

<style>
.adventure-card {
  background: rgb(24, 24, 27);
  border: 1px solid rgba(63, 63, 70, 0.4);
  border-radius: 12px;
  padding: 24px; /* Increased from 16px to 24px */
  margin-bottom: 24px; /* Increased from 16px to 24px */
  transition: border-color 0.2s ease, transform 0.2s ease;
  cursor: pointer;
  max-width: 900px; /* Added max-width for larger cards */
  margin-left: auto;
  margin-right: auto;
}

.adventure-card:hover {
  border-color: rgba(59, 130, 246, 0.4);
  transform: translateY(-2px);
}

.adventure-card h2 {
  color: #e4e4e7;
  font-size: 24px; /* Increased from 20px to 24px */
  font-weight: 700; /* Increased from 600 to 700 */
  line-height: 1.3; /* Increased from 1.2 to 1.3 */
  font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
  margin-bottom: 6px; /* Added margin bottom */
}

.time-period {
  color: #3B82F6;
  font-size: 14px; /* Increased from 12px to 14px */
  font-weight: 500;
}

.description {
  color: #a1a1aa;
  font-size: 15px; /* Increased from 13px to 15px */
  line-height: 1.5; /* Increased from 1.4 to 1.5 */
  font-weight: 400;
  margin-bottom: 16px; /* Added extra space */
}

.progress {
  background: rgba(39, 39, 42, 0.6);
  height: 6px; /* Increased from 4px to 6px */
  border-radius: 3px; /* Increased from 2px to 3px */
  overflow: hidden;
  margin-bottom: 8px; /* Added margin */
}

.progress-bar {
  background: #3B82F6;
  border-radius: 3px; /* Increased from 2px to 3px */
}

.problems-count {
  color: #3B82F6;
  font-size: 14px; /* Increased from 12px to 14px */
  font-weight: 500;
}

.tags {
  display: flex;
  flex-wrap: wrap;
  gap: 6px; /* Increased from 4px to 6px */
  margin-top: 16px; /* Added margin top */
}

.tags .badge {
  background: rgba(39, 39, 42, 0.6);
  color: #3B82F6;
  border: 1px solid rgba(59, 130, 246, 0.2);
  border-radius: 6px; /* Increased from 4px to 6px */
  padding: 6px 10px; /* Increased from 4px 8px to 6px 10px */
  font-size: 13px; /* Increased from 11px to 13px */
  font-weight: 500;
}

.view-progress {
  color: #3B82F6;
  text-decoration: none;
  font-size: 14px; /* Increased from 12px to 14px */
  font-weight: 500;
  display: inline-flex;
  align-items: center;
  gap: 6px; /* Increased from 4px to 6px */
  z-index: 1;
  position: relative;
  margin-top: 12px; /* Added margin */
  padding: 6px 10px; /* Added padding */
  border-radius: 6px; /* Added border-radius */
  transition: background-color 0.2s;
}

.view-progress:hover {
  color: #60A5FA;
  text-decoration: none !important;
  background-color: rgba(59, 130, 246, 0.1); /* Added hover background */
}

.fa-external-link-alt {
  font-size: 12px; /* Increased from 11px to 12px */
}

/* Improve spacing between title and time */
.d-flex.justify-content-between.align-items-start.mb-2 {
  margin-bottom: 12px !important; /* Increased from actual value */
}

/* Improve spacing */
.mb-3 {
  margin-bottom: 16px !important;
}

.mb-2 {
  margin-bottom: 12px !important;
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('.adventure-card').forEach(card => {
    card.addEventListener('click', function(e) {
      if (!e.target.closest('.view-progress')) {
        const cardUrl = this.getAttribute('data-url');
        window.location.href = cardUrl;
      }
    });
  });
});
</script>

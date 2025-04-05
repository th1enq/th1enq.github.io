---
layout: default
icon: fab fa-github
order: 2
---

<div class="projects-container">
  <h1 class="projects-title">Projects</h1>
  
  <div class="projects-grid">
    {% assign projects = "" | split: "" %}
    
    {% assign project1 = "" | split: "" | push: "Adventure Time" | push: "2D Indie Game built with SDL2 and C++." | push: "https://github.com/th1enq/Adventure-Time" | push: "SDL2,C++" %}
    {% assign projects = projects | push: project1 %}
    
    {% assign project2 = "" | split: "" | push: "Library Management System" | push: "A simple library management system built with JavaFX." | push: "https://github.com/th1enq/Library-Management-System-JAVA" | push: "Java,JavaFX,MySQL,Google Books API" %}
    {% assign projects = projects | push: project2 %}
    
    {% assign project3 = "" | split: "" | push: "CatShell" | push: "A simple shell built with Golang and C" | push: "https://github.com/th1enq/CatShell" | push: "Golang,C" %}
    {% assign projects = projects | push: project3 %}
    
    {% assign project4 = "" | split: "" | push: "GoVibe" | push: "A simple social network built with Golang" | push: "https://github.com/th1enq/GoVibe" | push: "Golang,Docker,PostgreSQL,TailwindCSS,ReactJS" %}
    {% assign projects = projects | push: project4 %}
    
    {% assign project5 = "" | split: "" | push: "dotfiles" | push: "My personal dotfiles configuration for Arch Linux using bspwm." | push: "https://github.com/th1enq/dotfiles" | push: "Shell,Python,Lua,Javascript,SCSS" %}
    {% assign projects = projects | push: project5 %}

    {% for project in projects %}
      {% assign title = project[0] %}
      {% assign description = project[1] %}
      {% assign github = project[2] %}
      {% assign tagString = project[3] %}
      {% assign tags = tagString | split: "," %}
      
      <article class="project-card" onclick="window.location.href='{{ github }}'">
        <div class="card-background"></div>
        <div class="card-content">
          <div class="project-header">
            <h2 class="project-title">{{ title }}</h2>
            <div class="project-links">
              <a href="{{ github }}" target="_blank" class="github-link" onclick="event.stopPropagation()">
                <svg class="github-icon" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.23-.015-2.235-3.015.555-3.795-.735-4.035-1.41-.135-.345-.72-1.41-1.23-1.695-.42-.225-1.02-.78-.015-.795.945-.015 1.62.87 1.845 1.23 1.08 1.815 2.805 1.305 3.495.99.105-.78.42-1.305.765-1.605-2.67-.3-5.46-1.335-5.46-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405s2.04.135 3 .405c2.295-1.56 3.3-1.23 3.3-1.23.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.3 0 .315.225.69.825.57A12.02 12.02 0 0024 12c0-6.63-5.37-12-12-12z" />
                </svg>
              </a>
            </div>
          </div>
          <p class="project-description">{{ description }}</p>
          <div class="project-tags{% if tags.size > 5 %} tag-container" data-more-tags="true{% endif %}">
            {% for tag in tags %}
              {% if forloop.index <= 5 or tags.size <= 5 %}
                <span class="tag">{{ tag }}</span>
              {% else %}
                <span class="tag hidden-tag">{{ tag }}</span>
              {% endif %}
            {% endfor %}
          </div>
        </div>
      </article>
    {% endfor %}
  </div>
</div>

<style>
.projects-container {
  max-width: 64rem;
  margin: 0 auto;
  padding: 1rem;
}

.projects-title {
  font-size: 2.5rem;
  font-weight: 700;
  margin-bottom: 2rem;
  color: #e4e4e7;
}

.projects-grid {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.project-card {
  position: relative;
  border-radius: 0.75rem;
  overflow: hidden;
  padding: 1px;
  background: linear-gradient(to bottom right, rgba(59, 130, 246, 0.05), rgba(139, 92, 246, 0.05));
  transition: transform 0.3s ease-out;
  cursor: pointer;
}

.project-card:hover {
  transform: translateY(-4px) scale(1.01);
}

.card-background {
  position: absolute;
  inset: 0;
  background: linear-gradient(to bottom right, rgba(59, 130, 246, 0.05), rgba(139, 92, 246, 0.05));
  opacity: 0;
  transition: opacity 0.5s;
}

.project-card:hover .card-background {
  opacity: 1;
}

.card-content {
  position: relative;
  height: 100%;
  background-color: rgba(24, 24, 27, 0.3);
  backdrop-filter: blur(16px);
  border: 1px solid rgba(255, 255, 255, 0.05);
  border-radius: 0.75rem;
  padding: 1.75rem;
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.project-card::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 1px;
  background: linear-gradient(to right, transparent, rgba(255, 255, 255, 0.05), transparent);
  transform: scaleX(0);
  transition: transform 0.4s ease-out;
}

.project-card:hover::after {
  transform: scaleX(1);
}

.project-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
}

.project-title {
  font-size: 1.5rem;
  font-weight: 700;
  color: rgba(255, 255, 255, 0.95);
  margin: 0;
  transition: color 0.3s;
}

.project-card:hover .project-title {
  color: #ffffff;
}

.project-links {
  display: flex;
  gap: 1rem;
}

.github-link {
  color: #9ca3af;
  transition: color 0.2s, transform 0.2s;
}

.github-link:hover {
  color: #ffffff;
  transform: scale(1.1);
}

.github-icon {
  width: 1.25rem;
  height: 1.25rem;
}

.project-description {
  color: rgba(209, 213, 219, 0.7);
  line-height: 1.5;
  margin: 0;
}

.project-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 0.25rem; /* Reduced spacing between tags */
  margin-top: 0.5rem;
}

.tag {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 0.1rem 0.4rem; /* Reduced padding for a tighter fit */
  font-size: 0.8rem; /* Smaller font size for compact tags */
  font-weight: 500;
  line-height: 1; /* Ensures no extra vertical spacing */
  background-color: rgba(59, 130, 246, 0.1); /* Subtle background color */
  color: rgba(147, 197, 253, 0.9); /* Light blue text color */
  border-radius: 0.375rem; /* Rounded corners for a pill-like shape */
  border: 1px solid rgba(59, 130, 246, 0.3); /* Slightly darker border for contrast */
  transition: all 0.2s ease;
  letter-spacing: 0.02em;
  box-shadow: 0 0 0 1px rgba(59, 130, 246, 0.2) inset; /* Inner shadow for depth */
}

.tag:hover {
  background-color: rgba(59, 130, 246, 0.15); /* Slightly darker background on hover */
  color: rgba(147, 197, 253, 1); /* Brighter text color on hover */
  transform: translateY(-1px); /* Subtle lift effect */
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Add shadow for hover effect */
}

.more-tags-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 0.1rem 0.4rem; /* Reduced padding for a smaller button */
  font-size: 0.7rem; /* Smaller font size to match tags */
  font-weight: 500;
  line-height: 1; /* Ensures no extra vertical spacing */
  background-color: rgba(59, 130, 246, 0.1);
  color: rgba(147, 197, 253, 0.9);
  border-radius: 0.375rem;
  border: 1px solid rgba(59, 130, 246, 0.3);
  transition: all 0.2s ease;
  cursor: pointer;
  letter-spacing: 0.02em;
  box-shadow: 0 0 0 1px rgba(59, 130, 246, 0.2) inset;
}

.more-tags-button:hover {
  background-color: rgba(59, 130, 246, 0.15);
  color: rgba(147, 197, 253, 1);
  transform: translateY(-1px);
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.tags-popover {
  position: absolute;
  bottom: 100%;
  left: 0;
  margin-bottom: 0.5rem;
  background-color: rgb(17, 24, 39);
  border: 1px solid rgba(255, 255, 255, 0.05);
  border-radius: 0.75rem;
  padding: 0.5rem;
  box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
  min-width: max-content;
  backdrop-filter: blur(16px);
  z-index: 30;
  display: none;
  opacity: 0;
  transform: translateY(5px) scale(0.95);
  transition: opacity 0.2s, transform 0.2s;
}

.tags-popover.active {
  display: block;
  opacity: 1;
  transform: translateY(0) scale(1);
}

@media (min-width: 640px) {
  .projects-container {
    padding: 2rem;
  }
}

@media (min-width: 768px) {
  .projects-grid {
    gap: 2rem;
  }
}

@media (prefers-reduced-motion) {
  .project-card,
  .project-card::after,
  .github-link,
  .tags-popover,
  .card-background,
  .project-title {
    transition: none;
  }
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
  // Initialize tag containers with more tags functionality
  document.querySelectorAll('.tag-container[data-more-tags="true"]').forEach(container => {
    const hiddenTags = container.querySelectorAll('.hidden-tag');
    
    if (hiddenTags.length > 0) {
      // Create more button
      const moreButton = document.createElement('button');
      moreButton.className = 'more-tags-button';
      moreButton.textContent = '+' + hiddenTags.length;
      container.appendChild(moreButton);
      
      // Create popover for hidden tags
      const popover = document.createElement('div');
      popover.className = 'tags-popover';
      const popoverContent = document.createElement('div');
      popoverContent.className = 'project-tags';
      popover.appendChild(popoverContent);
      
      // Add hidden tags to popover
      hiddenTags.forEach(tag => {
        const tagClone = tag.cloneNode(true);
        tagClone.classList.remove('hidden-tag');
        popoverContent.appendChild(tagClone);
      });
      
      // Add arrow
      const arrow = document.createElement('div');
      arrow.style.cssText = 'position:absolute;bottom:0;left:50%;transform:translate(-50%,50%) rotate(45deg);width:0.5rem;height:0.5rem;background-color:rgb(17,24,39);border-right:1px solid rgba(255,255,255,0.05);border-bottom:1px solid rgba(255,255,255,0.05);';
      popover.appendChild(arrow);
      
      container.appendChild(popover);
      
      // Toggle popover on mouseover
      moreButton.addEventListener('mouseenter', () => {
        popover.classList.add('active');
      });
      
      moreButton.addEventListener('mouseleave', () => {
        popover.classList.remove('active');
      });
      
      // Prevent card click when interacting with popover
      popover.addEventListener('click', (e) => {
        e.stopPropagation();
      });
    }
  });
});
</script>
---
# the default layout is 'page'
layout: default
icon: fas fa-info-circle
order: 7
---

<div class="id-card-wrapper">
  <div class="lanyard">
    <div class="lanyard-string left"></div>
    <div class="lanyard-string right"></div>
    <div class="lanyard-clip"></div>
  </div>
  
  <div class="id-card" id="draggable-card">
    <div class="id-card-front">
      <div class="card-header">
        <div class="company-logo">VCS</div>
        <div class="company-name">Viettel Cyber Security</div>
      </div>
      <div class="profile-section">
        <div class="avatar-container">
          <img src="/assets/img/avatar.png" alt="th1enq" class="avatar-image">
        </div>
        <div class="name-section">
          <h1 class="fullname">th1enq</h1>
          <p class="job-title">Backend Development Intern</p>
        </div>
      </div>
      
      <div class="details-section">
        <div class="detail-item">
          <i class="fas fa-birthday-cake detail-icon"></i>
          <span class="detail-text">March 2005</span>
        </div>
        <div class="detail-item">
          <i class="fas fa-university detail-icon"></i>
          <span class="detail-text">2nd-year IT student at VNU-UET</span>
        </div>
        <div class="detail-item">
          <i class="fab fa-linux detail-icon"></i>
          <span class="detail-text">I use Arch Linux btw.</span>
        </div>
        <div class="detail-item">
          <i class="fab fa-golang detail-icon"></i>
          <span class="detail-text">One champ Golang</span>
        </div>
      </div>
      
      <div class="footer">
        <p class="footer-text">Click card to flip</p>
      </div>
    </div>
    
    <div class="id-card-back">
      <div class="back-header">
        <h2>Connect With Me</h2>
      </div>
      
      <div class="social-links-container">
        <a href="https://github.com/th1enq" class="social-link" target="_blank">
          <i class="fab fa-github"></i>
          <span>GitHub</span>
          <p>@th1enq</p>
        </a>
        
        <a href="https://linkedin.com/in/th1enq" class="social-link" target="_blank">
          <i class="fab fa-linkedin"></i>
          <span>LinkedIn</span>
          <p>@th1enq</p>
        </a>
        
        <a href="https://facebook.com/th1enq" class="social-link" target="_blank">
          <i class="fab fa-facebook"></i>
          <span>Facebook</span>
          <p>@th1enq</p>
        </a>
        
        <a href="mailto:th1enq@example.com" class="social-link">
          <i class="fas fa-envelope"></i>
          <span>Email</span>
          <p>th1enq@example.com</p>
        </a>
      </div>
      
      <div class="back-footer">
        <p class="contact-prompt">Let's connect and collaborate!</p>
      </div>
    </div>
  </div>
</div>

<style>
:root {
  --card-width: 350px;
  --card-height: 550px;
  --card-bg-front: #ffffff;
  --card-bg-back: #f8f9fa;
  --card-border: #e0e0e0;
  --card-shadow: rgba(0, 0, 0, 0.2);
  --text-primary: #333333;
  --text-secondary: #666666;
  --accent-color: #3498db;
  --accent-gradient: linear-gradient(135deg, #3498db, #1e6091);
  --company-bg: #0055a4;
  --skill-bar-bg: #e0e0e0;
  --skill-fill-color: #3498db;
  --lanyard-color: #e74c3c;
}

.dark {
  --card-bg-front: #2d3436;
  --card-bg-back: #1e2224;
  --card-border: #444444;
  --card-shadow: rgba(0, 0, 0, 0.4);
  --text-primary: #f0f0f0;
  --text-secondary: #cccccc;
  --accent-color: #3498db;
  --accent-gradient: linear-gradient(135deg, #3498db, #1e6091);
  --company-bg: #004080;
  --skill-bar-bg: #444444;
  --skill-fill-color: #3498db;
}

.id-card-wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  perspective: 1000px;
  padding: 80px 20px 40px;
  position: relative;
  min-height: 600px;
}

.lanyard {
  position: absolute;
  top: -10px;
  left: 50%;
  transform: translateX(-50%);
  z-index: 0;
  width: 120px;
  height: 100px;
  transform-origin: top center;
  animation: swinging 4s ease-in-out infinite alternate;
}

@keyframes swinging {
  0% { transform: translateX(-50%) rotate(-5deg); }
  100% { transform: translateX(-50%) rotate(5deg); }
}

.lanyard-string {
  position: absolute;
  width: 8px;
  height: 80px;
  background-color: var(--lanyard-color);
  top: 0;
  border-radius: 4px;
}

.lanyard-string.left {
  left: 35px;
  transform: rotate(-5deg);
}

.lanyard-string.right {
  right: 35px;
  transform: rotate(5deg);
}

.lanyard-clip {
  position: absolute;
  width: 30px;
  height: 15px;
  background-color: #888;
  border-radius: 3px;
  bottom: 20px;
  left: 50%;
  transform: translateX(-50%);
  box-shadow: 0 2px 5px rgba(0,0,0,0.2);
  z-index: 10;
}

.id-card {
  width: var(--card-width);
  height: var(--card-height);
  position: relative;
  transform-style: preserve-3d;
  transition: transform 0.6s cubic-bezier(0.4, 0, 0.2, 1);
  cursor: grab;
  will-change: transform;
  box-shadow: 0 15px 40px var(--card-shadow);
  transform-origin: center;
  backface-visibility: hidden;
}

.id-card:active {
  cursor: grabbing;
  transition: none;
}

.id-card.dragging {
  transition: none;
}

.id-card.flipped {
  transform: rotateY(180deg);
}

.id-card-front,
.id-card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  backface-visibility: hidden;
  border-radius: 16px;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  border: 1px solid var(--card-border);
  background-color: var(--card-bg-front);
  color: var(--text-primary);
}

.id-card-front {
  z-index: 1;
}

.id-card-back {
  background-color: var(--card-bg-back);
  transform: rotateY(180deg);
  padding: 20px;
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.card-header {
  background: var(--accent-gradient);
  padding: 15px;
  display: flex;
  align-items: center;
  color: white;
}

.company-logo {
  width: 40px;
  height: 40px;
  background-color: white;
  border-radius: 50%;
  color: var(--company-bg);
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
  margin-right: 10px;
  font-size: 16px;
}

.company-name {
  font-size: 18px;
  font-weight: 500;
}

.profile-section {
  padding: 20px;
  display: flex;
  align-items: center;
  flex-direction: column;
  text-align: center;
  border-bottom: 1px solid var(--card-border);
}

.avatar-container {
  width: 120px;
  height: 120px;
  border-radius: 50%;
  overflow: hidden;
  border: 4px solid white;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
  margin-bottom: 15px;
  transition: transform 0.3s ease;
}

.id-card:hover .avatar-container {
  transform: scale(1.05);
}

.avatar-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.name-section {
  width: 100%;
}

.fullname {
  margin: 0 0 5px 0;
  font-size: 28px;
  font-weight: 700;
  color: var(--accent-color);
}

.job-title {
  margin: 0;
  font-size: 16px;
  color: var(--text-secondary);
  font-weight: 500;
}

.details-section {
  padding: 15px 25px;
  flex: 1;
}

.detail-item {
  display: flex;
  align-items: center;
  padding: 12px 0;
  border-bottom: 1px solid var(--card-border);
}

.detail-item:last-child {
  border-bottom: none;
}

.detail-icon {
  width: 25px;
  height: 25px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  background-color: var(--accent-color);
  color: white;
  font-size: 14px;
  margin-right: 15px;
  flex-shrink: 0;
}

.detail-text {
  font-size: 14px;
  color: var(--text-secondary);
}

.footer {
  padding: 10px;
  text-align: center;
  font-size: 12px;
  color: var(--text-secondary);
  background-color: rgba(0,0,0,0.03);
}

.back-header {
  padding: 15px;
  text-align: center;
  background: var(--accent-gradient);
  color: white;
  border-radius: 12px;
  margin-bottom: 10px;
}

.back-header h2 {
  margin: 0;
  font-size: 24px;
  font-weight: 600;
}

.social-links-container {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 15px;
  padding: 0 10px;
}

.social-link {
  display: flex;
  align-items: center;
  gap: 15px;
  padding: 12px 20px;
  background-color: var(--card-bg-front);
  color: var(--text-primary);
  border-radius: 12px;
  text-decoration: none;
  transition: transform 0.3s ease, background-color 0.3s ease;
  border: 1px solid var(--card-border);
}

.social-link:hover {
  transform: translateX(5px);
  background-color: var(--accent-color);
  color: white;
}

.social-link:hover i {
  transform: scale(1.2);
}

.social-link i {
  font-size: 24px;
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: var(--accent-color);
  color: white;
  border-radius: 50%;
  transition: transform 0.3s ease;
}

.social-link span {
  font-size: 16px;
  font-weight: 600;
  flex: 1;
}

.social-link p {
  font-size: 14px;
  color: var(--text-secondary);
  margin: 0;
}

.social-link:hover p {
  color: rgba(255, 255, 255, 0.8);
}

.back-footer {
  padding: 15px;
  text-align: center;
  background: rgba(0, 0, 0, 0.03);
  border-radius: 12px;
  margin-top: auto;
}

.contact-prompt {
  margin: 0;
  font-size: 16px;
  color: var(--text-primary);
  font-weight: 500;
}

@media (max-width: 600px) {
  :root {
    --card-width: 320px;
    --card-height: 500px;
  }
  
  .profile-section {
    padding: 15px;
  }
  
  .avatar-container {
    width: 100px;
    height: 100px;
  }
  
  .fullname {
    font-size: 24px;
  }
  
  .details-section {
    padding: 10px 20px;
  }
  
  .detail-item {
    padding: 10px 0;
  }
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
  // Check for dark mode
  const isDarkMode = document.body.classList.contains('dark') || 
                    document.documentElement.classList.contains('dark') ||
                    window.matchMedia('(prefers-color-scheme: dark)').matches;
  
  if (isDarkMode) {
    document.documentElement.classList.add('dark');
  }
  
  // Card flip functionality
  const card = document.querySelector('.id-card');
  let isFlipped = false;
  
  // Variables for dragging
  let isDragging = false;
  let startX, startY;
  let initialRotation = { x: 0, y: 0, z: 0 };
  let currentRotation = { x: 0, y: 0, z: 0 };
  
  // Physics variables
  let velocity = { x: 0, y: 0, z: 0 };
  let damping = 0.96; // Adjusted for smoother movement
  let springStrength = 0.2; // Increased for better return to center
  let lastTimestamp = 0;
  let animationId = null;
  
  // Setup physics animation
  function startPhysicsAnimation() {
    if (animationId) cancelAnimationFrame(animationId);
    lastTimestamp = performance.now();
    updatePhysics();
  }
  
  function updatePhysics(timestamp = performance.now()) {
    if (isDragging || isFlipped) {
      animationId = requestAnimationFrame(updatePhysics);
      return;
    }
    
    const deltaTime = timestamp - lastTimestamp;
    lastTimestamp = timestamp;
    
    // Apply spring force (pulls back to center)
    velocity.x += -currentRotation.x * springStrength;
    velocity.y += -currentRotation.y * springStrength;
    velocity.z += -currentRotation.z * springStrength;
    
    // Update rotation based on velocity
    currentRotation.x += velocity.x * (deltaTime / 16);
    currentRotation.y += velocity.y * (deltaTime / 16);
    currentRotation.z += velocity.z * (deltaTime / 16);
    
    // Apply damping (friction)
    velocity.x *= damping;
    velocity.y *= damping;
    velocity.z *= damping;
    
    // Apply the rotation to the card
    card.style.transform = `rotateX(${currentRotation.x}deg) rotateY(${currentRotation.y}deg) rotateZ(${currentRotation.z}deg)`;
    
    // Stop the animation if it's nearly stopped
    if (Math.abs(velocity.x) < 0.01 && Math.abs(velocity.y) < 0.01 && Math.abs(velocity.z) < 0.01) {
      cancelAnimationFrame(animationId);
      return;
    }
    
    animationId = requestAnimationFrame(updatePhysics);
  }
  
  // Handle card flipping
  card.addEventListener('click', function(e) {
    // Only flip if we're not dragging
    if (!isDragging) {
      isFlipped = !isFlipped;
      this.classList.toggle('flipped');
      
      // Reset rotation when flipping
      if (isFlipped) {
        currentRotation = { x: 0, y: 0, z: 0 };
        velocity = { x: 0, y: 0, z: 0 };
        card.style.transform = 'rotateY(180deg)';
      } else {
        startPhysicsAnimation();
      }
    }
  });
  
  // Make card draggable
  card.addEventListener('mousedown', startDrag);
  card.addEventListener('touchstart', function(e) {
    const touch = e.touches[0];
    startDrag(touch);
  }, { passive: false });
  
  function startDrag(e) {
    if (isFlipped) return;
    
    isDragging = true;
    card.classList.add('dragging');
    
    // Store the initial mouse/touch position
    startX = e.clientX || e.pageX;
    startY = e.clientY || e.pageY;
    
    // Store the current rotation values
    initialRotation = { ...currentRotation };
    
    // Add the move and end listeners
    document.addEventListener('mousemove', onDrag);
    document.addEventListener('touchmove', onTouchDrag, { passive: false });
    document.addEventListener('mouseup', stopDrag);
    document.addEventListener('touchend', stopDrag);
    
    // Prevent default to avoid text selection
    e.preventDefault();
  }
  
  function onDrag(e) {
    if (!isDragging) return;
    
    // Calculate how far we've moved from the starting point
    const deltaX = (e.clientX || e.pageX) - startX;
    const deltaY = (e.clientY || e.pageY) - startY;
    
    // Convert the movement to rotation angles
    currentRotation.y = initialRotation.y + (deltaX * 0.5);
    currentRotation.x = initialRotation.x - (deltaY * 0.5);
    
    // Allow full 360-degree rotation
    currentRotation.y = currentRotation.y % 360;
    currentRotation.x = currentRotation.x % 360;
    
    // Calculate a natural Z rotation based on X and Y movement
    currentRotation.z = (currentRotation.x + currentRotation.y) * 0.1;
    
    // Apply the rotation
    card.style.transform = `rotateX(${currentRotation.x}deg) rotateY(${currentRotation.y}deg) rotateZ(${currentRotation.z}deg)`;
    
    // Calculate velocity for inertia
    velocity.x = (currentRotation.x - initialRotation.x) * 0.1;
    velocity.y = (currentRotation.y - initialRotation.y) * 0.1;
    velocity.z = (currentRotation.z - initialRotation.z) * 0.1;
  }
  
  function onTouchDrag(e) {
    const touch = e.touches[0];
    onDrag(touch);
    e.preventDefault();
  }
  
  function stopDrag() {
    if (!isDragging) return;
    
    isDragging = false;
    card.classList.remove('dragging');
    
    // Start physics animation for inertia effect
    startPhysicsAnimation();
    
    // Remove the event listeners
    document.removeEventListener('mousemove', onDrag);
    document.removeEventListener('touchmove', onTouchDrag);
    document.removeEventListener('mouseup', stopDrag);
    document.removeEventListener('touchend', stopDrag);
  }
  
  // Animate skill bars
  setTimeout(function() {
    const skillFills = document.querySelectorAll('.skill-fill');
    skillFills.forEach(function(fill) {
      const width = fill.style.width;
      fill.style.width = "0";
      setTimeout(function() {
        fill.style.width = width;
      }, 200);
    });
  }, 500);
  
  // Reset the card when mouse leaves if not flipped
  document.addEventListener('mouseleave', function() {
    if (!isFlipped && !isDragging) {
      // Generate a gentle push in random directions
      velocity.x = (Math.random() - 0.5) * 2;
      velocity.y = (Math.random() - 0.5) * 2;
      velocity.z = (Math.random() - 0.5) * 2;
      startPhysicsAnimation();
    }
  });
});
</script>
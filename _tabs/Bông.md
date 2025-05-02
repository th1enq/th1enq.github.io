---
layout: default
icon: fas fa-cat
order: 5
---

<div class="cat-gallery">
  <h2>My Lovely Cat</h2>
  <p>Here are some photos of my adorable cat!</p>
  
   <div class="cat-photos">
    {% for image in site.static_files %}
      {% if image.path contains '/assets/cat/' and image.extname == '.jpg' %}
        <img src="{{ image.path }}" alt="My cat">
      {% endif %}
    {% endfor %}
  </div>
</div>

<style>
.cat-gallery {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

.cat-photos {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 20px;
  margin-top: 20px;
}

.cat-photos img {
  width: 100%;
  height: auto;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  transition: transform 0.3s ease;
}

.cat-photos img:hover {
  transform: scale(1.05);
}
</style>
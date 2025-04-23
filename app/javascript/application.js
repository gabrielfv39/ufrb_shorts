import "@hotwired/turbo-rails"
import "controllers"
import "./custom/video_form"


document.addEventListener('DOMContentLoaded', function() {
  setupTagInput('cast');
  setupTagInput('crew');

  function setupTagInput(fieldName) {
    const input = document.getElementById(`${fieldName}-input`);
    const hiddenField = document.getElementById(`video_${fieldName}`);
    
    if (!input || !hiddenField) return;
    
    if (hiddenField.value) {
      const tags = hiddenField.value.split(',').map(t => t.trim());
      tags.forEach(tag => {
        if (tag) addTag(fieldName, tag);
      });
    }
    
    input.addEventListener('keydown', function(e) {
      if (e.key === 'Enter') {
        e.preventDefault();
        const tagText = this.value.trim();
        if (tagText) {
          addTag(fieldName, tagText);
          this.value = '';
          updateHiddenField(fieldName);
        }
      }
    });
  }

  function addTag(fieldName, text) {
    const tag = document.createElement('div');
    tag.className = 'tag';
    tag.innerHTML = `
      ${text}
      <span class="tag-close" onclick="removeTag(this, '${fieldName}')">×</span>
    `;
    document.getElementById(`${fieldName}-tags`).appendChild(tag);
  }
});

function removeTag(closeButton, fieldName) {
  closeButton.parentElement.remove();
  updateHiddenField(fieldName);
}

function updateHiddenField(fieldName) {
  const tags = Array.from(document.getElementById(`${fieldName}-tags`).children)
    .map(tag => tag.textContent.trim().slice(0, -1).trim())
    .join(', ');
  document.getElementById(`video_${fieldName}`).value = tags;
}

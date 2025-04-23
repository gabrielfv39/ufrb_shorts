window.setupVideoForm = function() {
  function setupTagInput(fieldName) {
    const input = document.getElementById(`${fieldName}-input`);
    const hiddenField = document.getElementById(`video_${fieldName}`);
    
    if (!input || !hiddenField) return;
    
    const tagsContainer = document.getElementById(`${fieldName}-tags`);
    tagsContainer.innerHTML = '';
    
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
      <span class="tag-close" data-field="${fieldName}">×</span>
    `;
    
    const closeBtn = tag.querySelector('.tag-close');
    closeBtn.addEventListener('click', function() {
      this.parentElement.remove();
      updateHiddenField(this.dataset.field);
    });
    
    document.getElementById(`${fieldName}-tags`).appendChild(tag);
  }

  function updateHiddenField(fieldName) {
    const tags = Array.from(document.getElementById(`${fieldName}-tags`).children)
      .map(tag => tag.textContent.trim().replace('×', '').trim())
      .join(', ');
    document.getElementById(`video_${fieldName}`).value = tags;
  }

  setupTagInput('cast');
  setupTagInput('crew');
}
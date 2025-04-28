(() => {
  const expandButtons = [...document.querySelectorAll('button[aria-label="Expand row"]')];

  expandButtons.forEach(button => button.click());

  return expandButtons.length;
})();

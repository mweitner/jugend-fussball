document.addEventListener("DOMContentLoaded", () => {
  const applySubtitle = (selector) => {
    const nodes = document.querySelectorAll(selector);
    for (const node of nodes) {
      if (!node || node.querySelector(".sidebar-brand-subtitle")) continue;

      const fullText = (node.textContent || "").trim();
      if (!fullText) continue;

      const match = fullText.match(/^(.*)\s\((.*)\)$/);
      if (!match) continue;

      const mainText = match[1].trim();
      const meta = match[2].trim();
      if (!mainText || !meta) continue;
      const metaWithParens = `(${meta})`;

      node.textContent = "";

      const main = document.createElement("span");
      main.className = "sidebar-brand-main";
      main.textContent = mainText;

      const sub = document.createElement("small");
      sub.className = "sidebar-brand-subtitle";
      sub.textContent = metaWithParens;

      node.appendChild(main);
      node.appendChild(sub);
    }
  };

  applySubtitle(".sidebar-brand-text");
  applySubtitle(".mobile-header .brand");
});

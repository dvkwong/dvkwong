import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@11.12.2/dist/mermaid.js';
mermaid.registerIconPacks([
  {
    name: 'logos',
    loader: () =>
      fetch('https://unpkg.com/@iconify-json/logos@1/icons.json').then((res) => res.json()),
  },
]);
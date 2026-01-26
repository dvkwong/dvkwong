mermaid.registerIconPacks([
  {
    name: 'logos', // Name to use in Mermaid syntax
    loader: () => fetch('https://unpkg.com/@iconify-json/logos@1/icons.json').then((res) => res.json()),
  },
]);

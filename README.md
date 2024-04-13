- 👋 Hi, I’m David Wong from NZ
- 👀 I’m interested in Chess, Body Boarding
- 🌱 I’m currently learning to improve my chess at chess.com
- 💞️ I’m looking to collaborate on ...
- 📫 How to reach me ...

<!---
dvkwong/dvkwong is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->

## How to build and run theme locally

1. Install Docker
2. Run docker command from ubuntu terminal
3. Update [jekyll-TeXt-theme](https://kitian616.github.io/jekyll-TeXt-theme/docs/en/quick-start#ruby-gem-method) configs.

```bash
# Add this line to your Jekyll site’s Gemfile:
gem "jekyll-text-theme"
# Add this line to your Jekyll site’s _config.yml file:
theme: jekyll-text-theme
```

```bash
# Generate Gemfile.lock:
cd docs
docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.6 bundle install
# Build Docker image:
docker-compose -f ./docker/docker-compose.build-image.yml build
```





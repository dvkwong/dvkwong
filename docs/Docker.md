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
docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.7 bundle install

# Build Docker image:
docker-compose -f ./docker/docker-compose.build-image.yml build

# Preview website
docker-compose -f ./docker/docker-compose.default.yml up    
```
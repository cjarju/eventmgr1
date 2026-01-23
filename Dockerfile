FROM ruby:2.4.10-stretch

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /app

# ---- Fix Debian Stretch EOL ----
RUN printf "deb http://archive.debian.org/debian stretch main\n\
deb http://archive.debian.org/debian-security stretch/updates main\n" \
> /etc/apt/sources.list && \
echo 'Acquire::Check-Valid-Until \"false\";' > /etc/apt/apt.conf.d/99no-check-valid-until

# Install runtime dependencies
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
  apt-get update -qq && apt-get install -y --no-install-recommends \
  build-essential \
  git \
  curl \
  nodejs \
  libpq-dev \
  libpq5 \
  postgresql-client \
  && rm -rf /var/lib/apt/lists/*

# Install Bundler for Rails 5
RUN gem install bundler -v 1.17.3

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

ENV BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_BIN=/usr/local/bundle/bin \
    PATH=/usr/local/bundle/bin:$PATH

# Install gems system-wide (no --path)
RUN --mount=type=cache,target=/root/.gem_cache,sharing=locked \
    bundle install --jobs 4 --retry 3 
# To install production gems only, add --without development test

# Copy app code
COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

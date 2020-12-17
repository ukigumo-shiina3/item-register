FROM ruby:2.6.3
RUN apt-get update 
RUN apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client 

# 公式のインストール方法を参考に安定版で最新のyarnをインストールする
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn
    
WORKDIR /item-register 
COPY Gemfile Gemfile.lock /item-register/
RUN bundle install
# Rails Sample Redis

## Redis

[ステップ 5: クラスターのノードに接続する - Amazon ElastiCache](https://docs.aws.amazon.com/ja_jp/AmazonElastiCache/latest/UserGuide/GettingStarted.ConnectToCacheNode.html)

### Install

```
sudo yum install gcc

wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make distclean  // Ubuntu systems only
make

src/redis-cli -c -h mycachecluster.eaogs8.0001.usw2.cache.amazonaws.com -p 6379
```

### CLI

```
redis-cli -c -h mycachecluster.eaogs8.0001.usw2.cache.amazonaws.com -p 6379

# DB
select 0~15

# set, get
set hoge huga
get hoge

keys *
```

## Gemfile

[redis\-store/redis\-rails: Redis stores for Ruby on Rails](https://github.com/redis-store/redis-rails)

```
gem 'redis-rails'
```

## Cache Store

```
# /redis-test/config/application.rb

config.cache_store = :redis_store, {
  host: "mycachecluster.eaogs8.0001.usw2.cache.amazonaws.com",
  port: 6379,
  db: 0,
  #password: "mysecret",
  namespace: "cache"
}
```

## Session Store

```
# /redis-test/config/initializers/session_store.rb

Rails.application.config.session_store :redis_store, {
  servers: [
    {
      host: "mycachecluster.eaogs8.0001.usw2.cache.amazonaws.com",
      port: 6379,
      db: 0,
      #password: "mysecret",
      namespace: "session"
    },
  ],
  expire_after: 90.minutes,
  key: "_#{Rails.application.class.parent_name.downcase}_session"
}
```

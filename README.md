# Rails Sample Redis

## Redis

[ステップ 5: クラスターのノードに接続する - Amazon ElastiCache](https://docs.aws.amazon.com/ja_jp/AmazonElastiCache/latest/UserGuide/GettingStarted.ConnectToCacheNode.html)

```
redis-cli -c -h test-redis.jtn6nh.0001.apse1.cache.amazonaws.com:6379

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
  host: "test-redis.jtn6nh.0001.apse1.cache.amazonaws.com",
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
      host: "test-redis.jtn6nh.0001.apse1.cache.amazonaws.com",
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

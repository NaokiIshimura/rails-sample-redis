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

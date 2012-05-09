Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '9e5fb6cd760fe24ec42b', '97f151b292cb32d1631558f78328842008077593'
end
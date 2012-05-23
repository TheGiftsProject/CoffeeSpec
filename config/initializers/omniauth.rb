Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  unless Rails.env.production?
    provider :github, '3863da1cbf3347e2f47a', '2b0bca639d2faecc8b3c23d35ca4c577c3534a99'
  else
    provider :github, '32f98ecbe6a0613aec5c', 'df28fa9599d66d2db43c10e1e89e44ad7c011f42'
  end
end
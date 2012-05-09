Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, '3863da1cbf3347e2f47a', '2b0bca639d2faecc8b3c23d35ca4c577c3534a99'
end
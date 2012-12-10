OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '139225706229184', '26793611497a6dc2165a541ed1f04dc2'
end
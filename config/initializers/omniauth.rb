Rails.application.config.middleware.use OmniAuth::Builder do
  env = Rails.application.credentials
  provider :google_oauth2, env.dig(:google, :client), env.dig(:google, :secret), { name: 'google' }
  provider :github, env.dig(:github, :client), env.dig(:github, :secret)
  provider :facebook, env.dig(:facebook, :app_id), env.dig(:facebook, :secret)
  provider :linkedin, env.dig(:linkedin, :client), env.dig(:linkedin, :secret)
end

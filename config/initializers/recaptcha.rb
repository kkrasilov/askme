Recaptcha.configure do |config|
  config.site_key  = Rails.application.credentials.recaptcha.try(:fetch, :public_key).to_s
  config.secret_key = Rails.application.credentials.recaptcha.try(:fetch, :private_key).to_s
end

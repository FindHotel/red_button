class TheRedButton::Config
  include Confiture::Configuration

  confiture_allowed_keys(:secret, :key)
  confiture_defaults(secret: 'SECRET_STUFF', key: 'EVEN_MOAR_SECRET')
end

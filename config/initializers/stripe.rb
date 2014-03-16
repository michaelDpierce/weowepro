Rails.configuration.stripe = {
  publishable_key: ENV['pk_test_br3CFmqOcRfScd6aHGqxYCr2'],
  secret_key: ENV['sk_test_4XxR8NRWLVhWAvwEdQNQWMLi']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

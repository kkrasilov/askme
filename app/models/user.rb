require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest::SHA256.new
  VALID_EMAIL_REGEX = /\A[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_USERNAME_REGEX = /\A\w+\z/

  attr_accessor :password

  has_many :questions

  before_validation :normalize_params
  before_save :encrypt_password

  validates :username, presence: true, length: {maximum: 40}, format: {with: VALID_USERNAME_REGEX}
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :email, :username, uniqueness: true
  validates :password, :password_confirmation, presence: true, on: :create
  validates :password, confirmation: true

  def self.authenticate(email, password)
    user = find_by(email: email&.downcase!)

    return unless user.present?

    hashed_password = hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(
      password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST)
    )

    return unless user.password_hash == hashed_password
    user
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = self.class.hash_to_string(OpenSSL::Random.random_bytes(16))
      self.password_hash = self.class.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(
        password, password_salt, ITERATIONS, DIGEST.length, DIGEST))
    end
  end

  def normalize_params
    username&.downcase!
    email&.downcase!
  end
end

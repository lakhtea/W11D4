class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :session_token, presence: true
    validates :password, length: { minimum: 6, allow_nil: true }

    attr_reader :password

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)

        if user && user.is_password?(password)
            return user
        else
            return nil
        end
    end

    def self.generate_session_token
        SecureRandom.urlsafe_base64(16)
    end

    def password=(password) 
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        obj = BCrypt::Password.new(self.password_digest)
        obj.is_password?(password)
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def reset_session_token
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end
end

class User < ActiveRecord::Base
    has_secure_password

    validates :name, presence: true
    validates :password, presence: true
    validates :password_confirmation, presence: true, length: {minimum: 3}
    validates :email, uniqueness: true, presence: true, case_sensitive: false


    def self.authenticate_with_credentials(email, password)
        email = email.strip.downcase
        user = User.find_by_email(email)
        if user && user.authenticate(password)
            user
        else
            nil
        end
    end
end

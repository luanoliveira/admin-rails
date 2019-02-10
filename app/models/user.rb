class User < ApplicationRecord
    attr_accessor :phone

    PHONE_REGEXP = /\A\([0-9]{2}\) [0-9]{4,5}-[0-9]{4}\Z/

    validates :name, presence: true
    validates :email, 
        format: { with: URI::MailTo::EMAIL_REGEXP },
        uniqueness: { case_sensitive: false }
    validates :phone, 
        format: { with: User::PHONE_REGEXP },
        allow_blank: true
    validates :password, length: { minimum: 6 }

    has_secure_password

    def before_save(record)
        record.email = record.email.downcase
    end
end

require "rails_helper"

RSpec.describe User, :type => :model do

  context "valid user" do
    it "orders them in reverse chronologically" do
      user = User.new
      user.name = "Luan Oliveira"
      user.email = "luan@teste"
      user.phone = "(84) 99412-8007"
      user.password = "123456"
      user.password_confirmation = "123456"
      expect(user.valid?).to be_truthy
    end

    it "email único por usuário" do
      user = User.new(
        name: "Example User", 
        email: "luan@teste", 
        phone: "(84) 99412-8007",
        password: "123456",
        password_confirmation: "123456"
        )
      user.save
      duplicate_user = user.dup      
      duplicate_user.email = "luan@teste".upcase
      expect(duplicate_user.valid?).to be_falsey
    end
  end

end
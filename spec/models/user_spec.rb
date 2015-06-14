require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:posts) }
  it { should have_many(:comments) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { should validate_length_of(:name).is_at_most(50) }
  it { should validate_length_of(:email).is_at_most(243+'@example.com'.length) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe ".email" do
    let!(:user) { create(:user) }

    it "is unique" do
      expect(build(:user, email: user.email)).not_to be_valid
    end

    it "is valid" do
      expect(build(:user, email: user.email)).not_to be_valid
    end
  end

  describe ".password" do
    let(:user) { create(:user) }

    it " is in lowercase" do
      expect(user.password).to eq user.password.downcase
    end
  end

  describe "#authenticated?" do
    let(:user) { create(:user) }

    it "is is valid" do
      expect(user.authenticated?('')).to eq false
    end
  end
end
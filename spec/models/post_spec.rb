require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:comments) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:content) }

  it { should validate_length_of(:title).is_at_most(50) }
  it { should validate_length_of(:content).is_at_most(1000) }

  describe "#destroy" do
    let(:post) { create(:post) }

    before do
      create_list(:comment, 3, post: post)
    end

    it "destroy all the post's comments" do
      expect{ post.destroy }.to change{ post.comments.count }.by(-3)
    end
  end
end 

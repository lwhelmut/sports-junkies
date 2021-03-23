require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe "投稿" do
    context '投稿ができる場合' do
      it '必要な項目が入力されて入れば投稿できる' do
        expect(@post).to be_valid
      end
    end
    context '投稿ができない場合' do
      it 'titleが空では投稿ができない' do
        @post.title = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it 'conceptが空では投稿ができない' do
        @post.concept = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Concept can't be blank")
      end
    end
  end
end

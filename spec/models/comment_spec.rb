require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe "投稿" do
    context '投稿ができる場合' do
      it '必要な項目が入力されて入れば投稿できる' do
        expect(@comment).to be_valid
      end
    end
    context '投稿ができない場合' do
      it 'contentが空では投稿ができない' do
        @comment.content = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content can't be blank")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe "メッセージの送信" do
    context 'メッセージの送信ができる場合' do
      it '必要な項目が入力されて入れば送信できる' do
        expect(@message).to be_valid
      end
    end
    context 'メッセージの送信ができない場合' do
      it 'contentが空では送信ができない' do
        @message.content = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Content can't be blank")
      end
    end
  end
end

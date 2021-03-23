require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe "ルームの追加" do
    context 'ルームの追加ができる場合' do
      it '必要な項目が入力されて入れば追加できる' do
        expect(@room).to be_valid
      end
    end
    context 'ルームの追加ができない場合' do
      it 'Room nameが空では投稿ができない' do
        @room.name = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end

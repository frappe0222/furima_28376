require 'rails_helper'
describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do

      it '全てカラムが存在してる'do
        expect(@user).to be_valid
      end
      it 'emailに＠が含まれていれば登録できる'do
        expect(@user.email).to include('@')
      end
      it 'passwordが6文字以上の英数字であれば登録できる' do
        @user.password ="111aaa"
        @user.password_confirmation = "111aaa"
        expect(@user).to be_valid
      end

      it 'name_familyとname_firstが全角（漢字、ひらがな、カタカナ）であれば登録できる'do
        @user.name_family = "平のソ"
        @user.name_first ="宗たヒ"
        expect(@user).to be_valid
      end
      it 'kana_name_familyとkana_name_firstが全角（カタカナ）であれば登録できる'do
        @user.kana_name_family = "ヒラノ"
        @user.kana_name_first = "ソウタ"
        expect(@user).to be_valid
      end
    end 

    context'新規登録がうまくいかない時'do

       it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
       end
       
       it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
       end

       it "password_confirmationが空では登録できないこと" do
        @user.password = ""
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "emailが空では登録できないこと" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "nicknameが空では登録できないこと" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "name_familyが空では登録できないこと" do
        @user.name_family = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name family can't be blank")
      end

      it "name_firstが空では登録できないこと" do
        @user.name_first = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first can't be blank")
      end

      it "kana_name_familyが空では登録できないこと" do
        @user.kana_name_family = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana name family can't be blank")
      end

      it "kana_name_firstが空では登録できないこと" do
        @user.kana_name_first = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana name first can't be blank")
      end

      it "birthが空では登録できないこと" do
        @user.birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end


    end
  end
end   
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

         validates :nickname,:name_family,:name_first,:kana_name_family,:kana_name_first,:birth,:email,:password, presence: true

         VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
         validates :name_family,:name_first, format: { with: VALID_ZENKAKU_REGEX, message: '全角文字を使用してください' } do
         end

         VALID_ZENKANA_REGEX = /\A[ァ-ヶー－]+\z/
         validates :kana_name_family,:kana_name_first, format: { with: VALID_ZENKANA_REGEX, message: '全角カタカナを使用してください' } do
         end

         VALID_PASS_REGEX = /[a-z\d]{6,}/i
         validates :password, length: { minimum: 6 },format: { with:VALID_PASS_REGEX , message: '6文字以上の半角英数字で設定してください' } do
         end

         VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
         validates :email,uniqueness: true, format: { with: VALID_EMAIL_REGEX } do
         end

end

class CartItem < ApplicationRecord

    belongs_to :customer
    belongs_to :product
    validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }

    # numericality: { only_integer: true }　全角数字はDBに保存されずに弾く（全角数字は０とモデルに保存されてしまうため）
    # greater_than: 0　0よりも大きな数が入力されているかを判定するオプション

end

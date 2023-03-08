class ReadCount < ApplicationRecord

    #references型なら入力済みの筈
  belongs_to :user
  belongs_to :book
end

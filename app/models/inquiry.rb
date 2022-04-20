class Inquiry < ApplicationRecord
	validates :kind, :content, presence: true

	enum status: { yet: 0, complete: 1 }

	KIND = ['サービスについて', 'フレーバー追加申請', '組み合わせの評価について', 'その他']
end

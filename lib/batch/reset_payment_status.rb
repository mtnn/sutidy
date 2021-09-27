class Batch::ResetPaymentStatus
  def self.reset_payment_status
    SubscribedItem.all.each do |item|
      item.update(payment_status: 0)
    end
    puts '月初に伴い請求ステータスを一律変更致しました。'
  end
end
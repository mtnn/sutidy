class InsertAdminsAccount < ActiveRecord::Migration[5.2]
  def up
    return unless Rails.env == 'production'
    Admin.create!(
      email: 'root01@sutidy.com',
      password: 'root01',
      )
  end
end

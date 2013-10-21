class ChangeFinanceOpinionDefaultValue < ActiveRecord::Migration
  def up
    change_column_default(:applications, :finance_opinion, nil)
  end

  def down
    change_column_default(:applications, :finance_opinion, "pending")
  end
end

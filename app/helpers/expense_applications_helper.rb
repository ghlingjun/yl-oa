module ExpenseApplicationsHelper
  def state_for_select
    result = []
    ExpenseApplication::EXPENSE_TYPE.each do |k, v|
      result << [v, k]
    end
    result
  end
end

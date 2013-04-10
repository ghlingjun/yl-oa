module ApplicationTypeFinder
  def expense_applications
    where('type = ?', 'ExpenseApplication')
  end
  def item_applications
    where('type = ?', 'ItemApplication')
  end
  def leave_applications
    where('type = ?', 'LeaveApplication')
  end
  def payment_applications
    where('type = ?', 'PaymentApplication')
  end

  def contract_applications
    where('type = ?', 'ContractApplication')
  end

  def billing_applications
    where('type = ?', 'BillingApplication')
  end
end
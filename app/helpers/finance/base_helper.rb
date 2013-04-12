module Finance::BaseHelper
  def mark_if_necessary(application)
    if finance_opinion_pending?(application)
      return "admin"
    end
  end

  def finance_opinion_pending?(application)
    !application.finance_opinion || application.finance_opinion.eql?("pending")
  end
end
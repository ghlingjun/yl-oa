module ApplicationReceiversHelper
  def state_for_select
    result = []
    result << [I18n.t('activerecord.state.application.pending'), 'pending']
    result << [I18n.t('activerecord.state.application.approved'), 'approved']
    result << [I18n.t('activerecord.state.application.rejected'), 'rejected']
    result
  end
end

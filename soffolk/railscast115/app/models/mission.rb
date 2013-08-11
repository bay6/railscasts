class Mission < ActiveRecord::Base
  include MissionCache

  belongs_to :creator, class_name: "User"
  belongs_to :assigned_to, class_name: "User"

  has_many :comments, :as => :commentable
  has_many :events, :as => :eventable

  validates_presence_of :name, :description, :status

  STATUS = {
    0 => "新建",
    1 => "进行中",
    2 => "待验证",
    3 => "完成",
    4 => "关闭"
  }

  def human_status
    STATUS[status||0]
  end

  def status_description
    return I18n.t('missions.status.available_to_accept') if cache_assigned_to.nil?
    case status
    when 1 then cache_assigned_to.nickname + I18n.t('missions.status.ongoing')
    when 2 then cache_assigned_to.nickname + I18n.t("missions.status.proposed")
    when 3 then cache_assigned_to.nickname + I18n.t("missions.status.finished")
    when 4 then I18n.t("missions.status.closed")
    end
  end

  def action_for(current_user)
    if can_accept?(current_user)
      action = "accept"
    elsif can_finish?(current_user)
      action = "finish"
    elsif can_confirm?(current_user)
      action = "confirm"
    elsif can_close?(current_user)
      action = "close"
    else
      nil
    end
  end

  def perform_action(action_name, current_user)
    result = case action_name
             when 'accept'
               can_accept?(current_user) ? accept(current_user) : false
             when 'finish'
               can_finish?(current_user) ? finish : false
             when 'confirm'
               can_confirm?(current_user) ? confirm : false
             when 'close'
               can_close?(current_user) ? close : false
             end
    result
  end

  def accept(current_user)
    update_attributes(assigned_to: current_user,
                      status: 1,
                      start_time: Time.now
                     )
  end

  def finish
    update_attributes(status: 2, finish_time: Time.now)
  end

  def confirm
    update_attributes(status: 3)
  end

  def close
    update_attributes(status: 4)
  end

  def can_accept?(current_user)
    status == 0 && cache_assigned_to.nil? && creator != current_user
  end

  def can_finish?(current_user)
    status == 1 && cache_assigned_to == current_user
  end

  def can_confirm?(current_user)
    status == 2 && creator == current_user
  end

  def can_close?(current_user)
    status == 3 && creator == current_user
  end

end

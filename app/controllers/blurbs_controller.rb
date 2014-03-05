class BlurbsController < InheritedResources::Base
  before_filter :force_http
  before_filter :authenticate_user!
  before_filter :check_manage_blurbs

  private
  def check_manage_blurbs
    unless current_user.can?(:manage_blurbs)
      raise Authority::SecurityViolation.new(current_user,
                                             :manage_blurbs,
                                             BlurbsController)
    end
  end
end
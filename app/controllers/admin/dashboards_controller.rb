class Admin::DashboardsController < Admin::BaseController
  def index
    @rates = Rate.all
    @inquiries = Inquiry.all.order(created_at: :desc)
  end
end

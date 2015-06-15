ActiveAdmin.register User do
  config.sort_order = 'created_at_asc'

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  index do |user|
    column "Signed Up", sortable: :created_at do |u|
      u.created_at.strftime("%B %e, %Y")
    end
    column :name
    column :email
    column "Distance Travelled (km)" do |user|
      user.total(:km_travelled)
    end
    column "Carbon (kg)" do |user|
      user.total(:carbon)
    end
    column "Donation (ZAR)" do |user|
      user.total_donation
    end
    column "Pledges" do |user|
      user.pledges_summary
    end

    actions
  end

  csv do
    column :name
    column :email
    column "Distance Travelled (km)" do |user|
      user.total(:km_travelled)
    end
    column "Carbon (kg)" do |user|
      user.total(:carbon)
    end
    column "Donation (ZAR)" do |user|
      user.total_donation
    end
    column "Pledges" do |user|
      user.pledges_summary
    end
  end

  
end

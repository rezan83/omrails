ActiveAdmin.register Item do
    permit_params :text, :user, :url, :title
    
end
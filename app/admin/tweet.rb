ActiveAdmin.register Tweet do
    permit_params :content, :user
    
end
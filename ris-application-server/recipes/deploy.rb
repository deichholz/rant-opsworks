include_recipe 'deploy'
include_recipe "nginx::service"

node[:deploy].each do |application, deploy|

    # determine root folder of new app deployment
    app_root = "#{deploy_config[:deploy_to]}/current"

    opsworks_deploy_dir do
        user deploy[:user]
        group deploy[:group]
        path deploy[:deploy_to]
    end

    opsworks_deploy do
        app application
        deploy_data deploy
    end

    nginx_web_app application do
        application deploy
        cookbook "nginx"
    end
end
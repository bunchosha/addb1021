require 'capistrano-unicorn'

set :application, "addb1021"
set :repo_url, 'git@github.com:bunchosha/addb1021.git'#gitからコードをcloneする
set :branch, 'master' #マージ前なら他のブランチでも設定可能
set :deploy_to, '/var/www/addb1021'
set :keep_releases, 5 #何個アプリを確保しておくか。この場合はデプロイした最新のアプリ5個をキープ
set :rbenv_type, :user
set :rbenv_ruby, '2.0.0-p643'     #rubyのバージョン間違えないように!
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all
set :linked_dirs, %w{bin log tmp/backup tmp/pids tmp/cache tmp/sockets vendor/bundle}

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end

set :ssh_options, {
   config: false
}
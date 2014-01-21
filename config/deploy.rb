set :stages, %w(production vagrant)
set :default_stage, "vagrant"

require 'capistrano/ext/multistage'
require 'capi/unicorn'
require "rvm/capistrano"
require 'bundler/capistrano'

set :application, "qrtura"
set :rvm_type, :system

set :use_sudo, false

set :rake, "#{rake} --trace"
set :app_dir, "/srv/#{application}"
set :current_path, "#{app_dir}/current"
set :deploy_to, "#{app_dir}"

set :ssh_options, { forward_agent: true }
default_run_options[:pty] = true

set :repository, "https://github.com/ulmic/qrtura.git"
set :scm, "git"
set :deploy_via, :remote_cache

desc "Seed database data"
task :seed_data do
  run "cd #{current_path} && RAILS_ENV=#{rails_env} #{rake} db:seed"
end

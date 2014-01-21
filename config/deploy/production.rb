set :rails_env, 'production'
set :branch, 'master'

set :keep_releases, 15

set :user, 'qrtura'

server "qrtura.ru", :app, :web, :db, :primary => true

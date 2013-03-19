namespace :db do
  desc "Destroy and re-migrate the database, useful if you've edited migrations."
  task :recycle => ['db:drop', 'db:create', 'db:migrate', 'db:test:prepare']
end

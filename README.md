# `Ratpack`

A simple Sinatra app that uses ActiveRecord, Sqlite and Twitter Bootstrap v2.3 (old!). All the other dependencies were updated.

Visual Studio Code support and Rubocop settings were added.

The [Sinatra-ActiveRecord installation instructions](https://github.com/sinatra-activerecord/sinatra-activerecord#readme) were important. I corrected many issues with the original webapp.


## Up and Running
1. `bundle install`
2. `sudo apt install rerun`
3. `rerun -- rackup --port 4321`
   ```
   13:59:31 [rerun] Rerun (26496) running Ratpack (26676)
   Puma starting in single mode...
   * Puma version: 6.0.0 (ruby 3.1.0-p0) ("Sunflower")
   *  Min threads: 0
   *  Max threads: 5
   *  Environment: development
   *          PID: 26676
   * Listening on http://127.0.0.1:4321
   * Listening on http://[::1]:4321
   Use Ctrl-C to stop
   ```
4. Visit http://localhost:4321

OK, so the website works. Now verify that `rake` is properly setup.
```shell
$ bundle exec rake -T
rake db:create              # Creates the database from DATABASE_URL or config/database.yml for the current RAILS_ENV (use db:create:all to create all databases in the config). Without RAILS_ENV or when RAILS_ENV is d...
rake db:create_migration    # Create a migration (parameters: NAME, VERSION)
rake db:drop                # Drops the database from DATABASE_URL or config/database.yml for the current RAILS_ENV (use db:drop:all to drop all databases in the config). Without RAILS_ENV or when RAILS_ENV is develop...
rake db:encryption:init     # Generate a set of keys for configuring Active Record encryption in a given environment
rake db:environment:set     # Set the environment value for the database
rake db:fixtures:load       # Loads fixtures into the current environment's database
rake db:migrate             # Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)
rake db:migrate:down        # Runs the "down" for a given migration VERSION
rake db:migrate:redo        # Rolls back the database one migration and re-migrates up (options: STEP=x, VERSION=x)
rake db:migrate:status      # Display status of migrations
rake db:migrate:up          # Runs the "up" for a given migration VERSION
rake db:prepare             # Runs setup if database does not exist, or runs migrations if it does
rake db:reset               # Drops and recreates all databases from their schema for the current environment and loads the seeds
rake db:rollback            # Rolls the schema back to the previous version (specify steps w/ STEP=n)
rake db:schema:cache:clear  # Clears a db/schema_cache.yml file
rake db:schema:cache:dump   # Creates a db/schema_cache.yml file
rake db:schema:dump         # Creates a database schema file (either db/schema.rb or db/structure.sql, depending on `ENV['SCHEMA_FORMAT']` or `config.active_record.schema_format`)
rake db:schema:load         # Loads a database schema file (either db/schema.rb or db/structure.sql, depending on `ENV['SCHEMA_FORMAT']` or `config.active_record.schema_format`) into the database
rake db:seed                # Loads the seed data from db/seeds.rb
rake db:seed:replant        # Truncates tables of each database for current environment and loads the seeds
rake db:setup               # Creates all databases, loads all schemas, and initializes with the seed data (use db:reset to also drop all databases first)
rake db:version             # Retrieves the current schema version number
```

5. Create an empty migration file in `db/migrate/`.
   The instructions said to do this:
   ```
   bundle exec rake db:migrate
   ```
   But that failed, and I had to do this:
   ```
   bundle exec rake db:create_migration NAME=create_users
   ```
   A file called `db/migrate/20230210192832_create_users.rb` was created, and looked like:
   ```
   class CreateUsers < ActiveRecord::Migration[7.0]
      def change
      end
   end
   ```

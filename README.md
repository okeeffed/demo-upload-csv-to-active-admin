# README

## Replicating this repo

Followed [this blog](https://blog.dennisokeeffe.com/blog/2022-03-12-active-admin-with-ruby-on-rails-7).

```s
$ bundle exec rails g model Template name:string description:string author:string
$ touch app/admin/templates.rb

# Create a service folder for the CSV converter
$ mkdir app/services
$ touch app/services/csv_helper.rb test.csv
```

In `test.csv`:

```csv
"POST A","DESCRIPTION A","AUTHOR A"
"POST B","DESCRIPTION B","AUTHOR B"
"POST C","DESCRIPTION C","AUTHOR C"
"POST D","DESCRIPTION D","AUTHOR D"
"POST E","DESCRIPTION E","AUTHOR E"
```

Logs for transaction:

```rb
TRANSACTION (0.1ms)  begin transaction
  ↳ app/admin/templates.rb:13:in `each'
  Template Create (1.2ms)  INSERT INTO "templates" ("name", "description", "author", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["name", "POST A"], ["description", "DESCRIPTION A"], ["author", "AUTHOR A"], ["created_at", "2022-04-05 09:19:59.478827"], ["updated_at", "2022-04-05 09:19:59.478827"]]
  ↳ app/admin/templates.rb:13:in `each'
  Template Create (0.1ms)  INSERT INTO "templates" ("name", "description", "author", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["name", "POST B"], ["description", "DESCRIPTION B"], ["author", "AUTHOR B"], ["created_at", "2022-04-05 09:19:59.486523"], ["updated_at", "2022-04-05 09:19:59.486523"]]
  ↳ app/admin/templates.rb:13:in `each'
  Template Create (0.1ms)  INSERT INTO "templates" ("name", "description", "author", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["name", "POST C"], ["description", "DESCRIPTION C"], ["author", "AUTHOR C"], ["created_at", "2022-04-05 09:19:59.489077"], ["updated_at", "2022-04-05 09:19:59.489077"]]
  ↳ app/admin/templates.rb:13:in `each'
  Template Create (0.1ms)  INSERT INTO "templates" ("name", "description", "author", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["name", "POST D"], ["description", "DESCRIPTION D"], ["author", "AUTHOR D"], ["created_at", "2022-04-05 09:19:59.492045"], ["updated_at", "2022-04-05 09:19:59.492045"]]
  ↳ app/admin/templates.rb:13:in `each'
  Template Create (0.1ms)  INSERT INTO "templates" ("name", "description", "author", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["name", "POST E"], ["description", "DESCRIPTION E"], ["author", "AUTHOR E"], ["created_at", "2022-04-05 09:19:59.495070"], ["updated_at", "2022-04-05 09:19:59.495070"]]
  ↳ app/admin/templates.rb:13:in `each'
  TRANSACTION (1.4ms)  commit transaction
  ↳ app/admin/templates.rb:12:in `block (2 levels) in <main>'
Redirected to http://localhost:3000/admin/template
Completed 302 Found in 60ms (ActiveRecord: 4.1ms | Allocations: 12128)
```

Checking on the Rails console:

```s
bundle exec rails c
Running via Spring preloader in process 6113
Loading development environment (Rails 6.1.5)
irb(main):001:0> Template.all.count
   (0.9ms)  SELECT sqlite_version(*)
   (0.2ms)  SELECT COUNT(*) FROM "templates"
=> 5
irb(main):002:0> Template.all
  Template Load (0.2ms)  SELECT "templates".* FROM "templates"
=>
[#<Template:0x00007faa7813abd0
  id: 1,
  name: "POST A",
  description: "DESCRIPTION A",
  author: "AUTHOR A",
  created_at: Tue, 05 Apr 2022 09:19:59.478827000 UTC +00:00,
  updated_at: Tue, 05 Apr 2022 09:19:59.478827000 UTC +00:00>,
 #<Template:0x00007faa78169d40
  id: 2,
  name: "POST B",
  description: "DESCRIPTION B",
  author: "AUTHOR B",
  created_at: Tue, 05 Apr 2022 09:19:59.486523000 UTC +00:00,
  updated_at: Tue, 05 Apr 2022 09:19:59.486523000 UTC +00:00>,
 #<Template:0x00007faa78169c50
  id: 3,
  name: "POST C",
  description: "DESCRIPTION C",
  author: "AUTHOR C",
  created_at: Tue, 05 Apr 2022 09:19:59.489077000 UTC +00:00,
  updated_at: Tue, 05 Apr 2022 09:19:59.489077000 UTC +00:00>,
 #<Template:0x00007faa78169b88
  id: 4,
  name: "POST D",
  description: "DESCRIPTION D",
  author: "AUTHOR D",
  created_at: Tue, 05 Apr 2022 09:19:59.492045000 UTC +00:00,
  updated_at: Tue, 05 Apr 2022 09:19:59.492045000 UTC +00:00>,
 #<Template:0x00007faa78169ac0
  id: 5,
  name: "POST E",
  description: "DESCRIPTION E",
  author: "AUTHOR E",
  created_at: Tue, 05 Apr 2022 09:19:59.495070000 UTC +00:00,
  updated_at: Tue, 05 Apr 2022 09:19:59.495070000 UTC +00:00>]
irb(main):003:0>
```
